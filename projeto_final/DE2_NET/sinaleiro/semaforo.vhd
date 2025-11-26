library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity semaforo is
    port(
        -- clocks / reset
        clk         : in  std_logic;        -- system clock (for register interface)
        clk_1hz     : in  std_logic;        -- 1 Hz clock enable (derived from 50 MHz)
        rst         : in  std_logic;

        -- simple register interface (síncrono com `clk`)
        reg_addr    : in  std_logic_vector(1 downto 0); -- 4 regs (0..3)
        reg_wr      : in  std_logic;                      -- write strobe
        reg_wdata   : in  std_logic_vector(31 downto 0); -- write data
        reg_rd      : in  std_logic;                      -- read strobe
        reg_rdata   : out std_logic_vector(31 downto 0); -- read data (valid next cycle)

        -- outputs: two semaphores (ID0 and ID1)
        o0_vermelho, o0_amarelo, o0_verde : out std_logic;
        o1_vermelho, o1_amarelo, o1_verde : out std_logic;

        -- irq: pulse (1 clock cycle of `clk`) when state changes
        irq_state_change : out std_logic;
        state_code_out   : out std_logic_vector(1 downto 0) -- current state code for external logic
    );
end entity;

architecture rtl of semaforo is

    -- State encoding
    type t_state is (IDLE, RED, YELLOW, GREEN);
    signal state     : t_state := IDLE;
    signal state_next: t_state := IDLE;

    -- programmable times (seconds)
    signal time_red    : integer range 0 to 65535 := 10; -- defaults
    signal time_yellow : integer range 0 to 65535 := 3;
    signal time_green  : integer range 0 to 65535 := 10;

    -- remaining seconds in current state
    signal remaining   : integer range 0 to 65535 := 0;

    -- control register (REG3) layout on write:
    -- bit 0: START (write 1 to trigger start)
    -- bit 1: STOP  (write 1 to stop -> go to IDLE)
    -- bits 3..2: START_STATE (00=RED,01=YELLOW,10=GREEN)
    signal ctrl_reg    : std_logic_vector(31 downto 0) := (others => '0');
    signal start_req   : std_logic := '0';

    -- read data register
    signal reg_rdata_int: std_logic_vector(31 downto 0) := (others => '0');

    -- IRQ pulse generation
    signal irq_int     : std_logic := '0';

    -- helper: encode state to 2-bit code
    function state_code(s: t_state) return std_logic_vector is
    begin
        case s is
            when IDLE   => return "00";
            when RED    => return "01";
            when YELLOW => return "10";
            when GREEN  => return "11";
        end case;
    end function;

begin

    -- Register write interface (synchronous to `clk`)
    reg_write_proc: process(clk)
    begin
        if rising_edge(clk) then
            if rst = '1' then
                time_red    <= 10;
                time_yellow <= 3;
                time_green  <= 10;
                ctrl_reg    <= (others => '0');
                start_req   <= '0';
            else
                if reg_wr = '1' then
                    case reg_addr is
                        when "00" => -- REG0: set RED time (seconds)
                            time_red <= to_integer(unsigned(reg_wdata(15 downto 0)));
                        when "01" => -- REG1: set YELLOW time
                            time_yellow <= to_integer(unsigned(reg_wdata(15 downto 0)));
                        when "10" => -- REG2: set GREEN time
                            time_green <= to_integer(unsigned(reg_wdata(15 downto 0)));
                        when "11" => -- REG3: CONTROL
                            ctrl_reg <= reg_wdata;
                            -- capture start/stop request edges
                            if reg_wdata(0) = '1' then
                                start_req <= '1';
                            end if;
                            if reg_wdata(1) = '1' then
                                -- immediate stop
                                state <= IDLE;
                                remaining <= 0;
                                irq_int <= '1';
                            end if;
                        when others => null;
                    end case;
                else
                    -- clear one-shot start request after processed by other process
                    if start_req = '1' then
                        start_req <= '0';
                    end if;
                end if;
            end if;
        end if;
    end process;

    -- State machine driven by 1 Hz clock
    fsm_proc: process(clk_1hz, rst)
    begin
        if rst = '1' then
            state <= IDLE;
            remaining <= 0;
            irq_int <= '0';
        elsif rising_edge(clk_1hz) then
            irq_int <= '0'; -- default no irq
            -- handle start request synchronous to 1Hz domain: if start_req set, start with requested state
            if start_req = '1' then
                -- decode start state from ctrl_reg(3..2)
                case ctrl_reg(3 downto 2) is
                    when "00" => state <= RED;    remaining <= time_red;
                    when "01" => state <= YELLOW; remaining <= time_yellow;
                    when "10" => state <= GREEN;  remaining <= time_green;
                    when others => state <= RED;   remaining <= time_red;
                end case;
                irq_int <= '1';
            else
                -- normal operation: if IDLE, do nothing
                if state = IDLE then
                    -- nothing
                else
                    -- decrement remaining and switch states when reaches 0
                    if remaining > 0 then
                        remaining <= remaining - 1;
                    end if;

                    if remaining = 0 then
                        -- transition to next state and load time
                        if state = RED then
                            state <= GREEN;
                            remaining <= time_green;
                            irq_int <= '1';
                        elsif state = GREEN then
                            state <= YELLOW;
                            remaining <= time_yellow;
                            irq_int <= '1';
                        elsif state = YELLOW then
                            state <= RED;
                            remaining <= time_red;
                            irq_int <= '1';
                        end if;
                    end if;
                end if;
            end if;
        end if;
    end process;

    -- outputs for lights: simple mapping (semaphore 1 opposite of 0)
    outputs_proc: process(state)
    begin
        -- defaults
        o0_vermelho <= '0'; o0_amarelo <= '0'; o0_verde <= '0';
        o1_vermelho <= '0'; o1_amarelo <= '0'; o1_verde <= '0';

        case state is
            when IDLE =>
                null; -- all off
            when RED =>
                o0_vermelho <= '1';
                o1_verde    <= '1';
            when YELLOW =>
                o0_amarelo <= '1';
                o1_amarelo <= '1';
            when GREEN =>
                o0_verde    <= '1';
                o1_vermelho <= '1';
        end case;
    end process;

    -- register read output (synchronous to clk)
    reg_read_proc: process(clk)
    begin
        if rising_edge(clk) then
            if rst = '1' then
                reg_rdata_int <= (others => '0');
            else
                if reg_rd = '1' then
                    case reg_addr is
                        when "00" => -- REG0: status (lower bits = state code)
                            reg_rdata_int <= (31 downto 2 => '0') & state_code(state);
                        when "01" => -- REG1: remaining seconds
                            reg_rdata_int <= std_logic_vector(to_unsigned(remaining, 32));
                        when "10" => -- REG2: current programmed times (red in low 16 bits)
                            reg_rdata_int <= std_logic_vector(to_unsigned(time_red, 32));
                        when "11" => -- REG3: control register (last written value)
                            reg_rdata_int <= ctrl_reg;
                        when others => reg_rdata_int <= (others => '0');
                    end case;
                end if;
            end if;
        end if;
    end process;

    -- drive external reg_rdata and irq output
    reg_rdata <= reg_rdata_int;
    irq_state_change <= irq_int;
    state_code_out <= state_code(state);

end architecture;
library ieee;
use ieee.std_logic_1164.all;

entity semaforo is
	port(
		i_c1, i_c2, i_c3, i_c4, i_c5, i_pisca, rst: in std_logic;
		o0_vermelho, o0_amarelo, o0_verde: out std_logic;
		o1_vermelho, o1_amarelo, o1_verde: out std_logic
	
	);
end entity;

architecture behave of semaforo is
type states is (s0, s1, s2, s3, s4);
signal state_reg, state_next: states;

begin
	process(i_c1, i_c2, i_c3, i_c4, i_c5, rst)
	begin
		if rst = '1' then
			state_reg <= s0;
			state_next <= s1;
		elsif state_reg = s0 and i_c1  = '1' and i_c2 = '0' and i_c3 = '0' and i_c4 = '0' and i_c5 = '0'  then
			state_reg <= state_next;
			state_next <= s1;
		elsif state_reg = s1 and i_c1  = '1' and i_c2 = '1' and i_c3 = '0' and i_c4 = '0' and i_c5 = '0' then
			state_reg <= state_next;
			state_next <= s2;
		elsif state_reg = s2 and i_c3 = '1'  then
			state_reg <= state_next;
			state_next <= s3;
		elsif state_reg = s3 and i_c4 = '1' then
			state_reg <= state_next;
			state_next <= s4;
		elsif state_reg = s4 and i_c5 = '1' then
			state_reg <= state_next;
			state_next <= s1;
		else 
			--state_reg <= s0;
			--state_next <= s1;
		end if;
	end process;
	
	process(state_reg)
	begin
		if state_reg = s0 then
			o0_amarelo <= not(i_pisca);
			o1_amarelo <= not(i_pisca);
			o0_vermelho <= '1';
			o0_verde <= '1';
			o1_vermelho <= '1';
			o1_verde <= '1';
		
		elsif state_reg = s1 then
		
			o0_vermelho <= '0';
			o0_amarelo <= '1';
			o0_verde <= '1';
			o1_vermelho <= '1';
			o1_amarelo <= '1';
			o1_verde <= '0';
			
		elsif state_reg = s2 then
		
			o0_vermelho <= '0';
			o0_amarelo <= '1';
			o0_verde <= '1';
			o1_vermelho <= '1';
			o1_amarelo <= '0';
			o1_verde <= '1';
			
		elsif state_reg = s3 then
			
			o0_vermelho <= '1';
			o0_amarelo <= '1';
			o0_verde <= '0';
			o1_vermelho <= '0';
			o1_amarelo <= '1';
			o1_verde <= '1';
			
		elsif state_reg = s4 then
			
			o0_vermelho <= '1';
			o0_amarelo <= '1';
			o0_verde <= '0';
			o1_vermelho <= '1';
			o1_amarelo <= '0';
			o1_verde <= '1';
			
		else
			o0_vermelho <= '0';
			o0_amarelo <= '0';
			o0_verde <= '0';
			o1_vermelho <= '0';
			o1_amarelo <= '0';
			o1_verde <= '0';
		end if;
	end process;
end architecture;