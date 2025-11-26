library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity timer is
	port(
		timer_c1, timer_c2, timer_c3, timer_c4, timer_c5, timer_pisca: out std_logic;
		btn_1, btn_2: in std_logic; --sw0 (n25) e sw1 (n26)
		o_seg_un: out std_logic_vector(6 downto 0);
		o_seg_dez: out std_logic_vector(6 downto 0);
		o_cent_un: out std_logic_vector(6 downto 0);
		o_cent_dez: out std_logic_vector(6 downto 0);
		counter_test0: out std_logic_vector(3 downto 0);
		test, divisor_test: out std_logic; 
		clk, rst, en: in std_logic -- clk > n2 ou v1
		
	);
end entity;


architecture behave of timer is

	component bcd_7seg is 
		port(
			i: in std_logic_vector(3 downto 0);
			o: out std_logic_vector(6 downto 0)
		);
	end component;
	
	component counter4b is
	port(
		clk, rst, en: in std_logic;
		o0, o1, o2, o3: out std_logic

	);
	end component;
	
component btn_controller is
	port(
		clk, rst: in std_logic;
		btn_1, btn_2: in std_logic;
		en_count, rst_count: out std_logic
	);
end component;
	component DIVISOR is
		port(CLK: in std_logic;
		 RST: in std_logic;
		 DIV50: out std_logic ); 
	end component;
	
	component and_4 is  
		port(
		 input: in std_logic_vector (3 downto 0);
		 and_en: in std_logic;
		 and_4: out std_logic
		 );
		end component;
		
	component and_5 is  
		port(
		 input: in std_logic_vector (3 downto 0);
		 and_en: in std_logic;
		 and_5: out std_logic
		 );
		end component;
	
	component and_9 is  
		port(
		 and_en: in std_logic;
		 input: in std_logic_vector (3 downto 0);
		 and_9: out std_logic
		 );
	end component;
	
	signal clk_to_btn_controller: std_logic;
	signal en_count_timer: std_logic;
	signal rst_count_timer: std_logic;

	signal counter_to_bcd_0: std_logic_vector(3 downto 0);
	signal counter_to_bcd_1: std_logic_vector(3 downto 0);
	signal counter_to_bcd_2: std_logic_vector(3 downto 0);
	signal counter_to_bcd_3: std_logic_vector(3 downto 0);
	
	signal counter_to_and_0: std_logic_vector(3 downto 0);
	signal counter_to_and_1: std_logic_vector(3 downto 0);
	signal counter_to_and_2: std_logic_vector(3 downto 0);
	signal counter_to_and_3: std_logic_vector(3 downto 0);

	signal enable_0: std_logic; --enable da unidade dos centésimos
	signal enable_1: std_logic; --enable da dezena dos centésimos
	signal enable_2: std_logic; --enable da unidade dos segundos
	signal enable_3: std_logic; --enable da dezena dos segundos
	
	signal enable_to_5sec: std_logic; --enable da dezena dos segundos
	
	signal reset_end: std_logic:= '0';
	signal reset_seg_dez: std_logic:= '0';
	signal reset_seg_un: std_logic:= '0';
	signal reset_cent_dez: std_logic:= '0';
	signal reset_cent_un: std_logic:= '0';
	
	signal reset_5s: std_logic:= '0';
	signal input_5s: std_logic_vector(3 downto 0);
	
	signal enable_0_to_1: std_logic;
	signal enable_1_to_2: std_logic; 
	signal enable_2_to_3: std_logic; 
	
	signal divisor_to_clk: std_logic;

	signal seconds_counter: integer range 0 to 999 := 0;
	
	begin
	--port map do btn_controller
	btn_controller_1: btn_controller
		port map(
		clk => clk_to_btn_controller, 
		rst => rst_count_timer,
		btn_1 => btn_1,
		btn_2 => btn_2,
		en_count => en_count_timer,
		rst_count => rst_count_timer
		);
		
	--portmap dos contadores e bcd da unidade do centésimo
	counter_cent_un: counter4b
		port map(
			clk => divisor_to_clk,
			rst => reset_cent_un,
			--en => en,
			en => en_count_timer,
			o0 => counter_to_bcd_0(0),
			o1 => counter_to_bcd_0(1),
			o2 => counter_to_bcd_0(2),
			o3 => counter_to_bcd_0(3)
			);
	
	--primeiro and
	and_9_cent_dez: and_9 
		port map(
			and_en => en_count_timer,
			input => counter_to_and_0,
			and_9 => enable_0
		);	
		
	counter_cent_dez: counter4b
		port map(
			clk => divisor_to_clk,
			rst => reset_cent_dez,
			en => enable_0,
			o0 => counter_to_bcd_1(0),
			o1 => counter_to_bcd_1(1),
			o2 => counter_to_bcd_1(2),
			o3 => counter_to_bcd_1(3)
			);
			
	--segundo and		
	and_9_seg_un: and_9 
		port map(
			and_en => enable_0_to_1,
			input => counter_to_and_1,
			and_9 => enable_1
		);
		
	counter_seg_un: counter4b
		port map(
			clk => divisor_to_clk,
			rst => reset_seg_un,
			en => enable_1,
			o0 => counter_to_bcd_2(0),
			o1 => counter_to_bcd_2(1),
			o2 => counter_to_bcd_2(2),
			o3 => counter_to_bcd_2(3)
			);
	
	--terceiro and		
	and_9_seg_dez: and_9
		port map(
			and_en => enable_1_to_2,
			input => counter_to_and_2,
			and_9 => enable_2
		);

	counter_seg_dez: counter4b
		port map(
			clk => divisor_to_clk,
			rst => reset_seg_dez,  --reseta quando chega em 59:99
			en => enable_2,
			o0 => counter_to_bcd_3(0),
			o1 => counter_to_bcd_3(1),
			o2 => counter_to_bcd_3(2),
			o3 => counter_to_bcd_3(3)
			);
			
	--quarto and		
	and_4_seg_reset: and_4
		port map(
			input => counter_to_and_3,
			and_en => enable_2_to_3,
			and_4 => reset_end -- quando contado dos sec chega em 5
		);
		
		
	--Ands adicionais
	and_5_seg_un: and_5
		port map(
			input => input_5s,
			and_en => enable_to_5sec,
			and_5 => reset_5s -- quando contador dos sec chega em 5
		);
	
	
	bcd_cent_un: bcd_7seg
		port map(
			i => counter_to_bcd_0,
			o => o_cent_un);
			
	bcd_cent_dez: bcd_7seg
		port map(
			i => counter_to_bcd_1,
			o => o_cent_dez);
			
	bcd_seg_un: bcd_7seg
		port map(
			i => counter_to_bcd_2,
			o => o_seg_un);
			
	bcd_seg_dez: bcd_7seg
		port map(
			i => counter_to_bcd_3,
			o => o_seg_dez);
	
	clock_divider: divisor 
		port map(
		CLK => clk, 
		RST => rst_count_timer,
		DIV50 => divisor_to_clk);
	 
	-- Keep clk for button controller as a simple concurrent assignment
	clk_to_btn_controller <= clk;

	-- Map/forward signals (kept for compatibility)
	counter_to_and_0 <= counter_to_bcd_0;
	counter_to_and_1 <= counter_to_bcd_1;
	counter_to_and_2 <= counter_to_bcd_2;
	counter_to_and_3 <= counter_to_bcd_3;

	input_5s <= counter_to_bcd_3;

	enable_0_to_1 <= enable_0;
	enable_1_to_2 <= enable_1;
	enable_2_to_3 <= enable_2;
	enable_to_5sec <= enable_2;

	-- Simple seconds counter (0..999) driven by divisor_to_clk.
	-- It increments when `en_count_timer` = '1' and wraps at 999 -> 0.
	process(divisor_to_clk, rst_count_timer)
	begin
		if rst_count_timer = '1' then
			seconds_counter <= 0;
			counter_to_bcd_0 <= (others => '0');
			counter_to_bcd_1 <= (others => '0');
			counter_to_bcd_2 <= (others => '0');
			counter_to_bcd_3 <= (others => '0');
			timer_pisca <= '0';
			counter_test0 <= (others => '0');
			timer_c1 <= '0'; timer_c2 <= '0'; timer_c3 <= '0'; timer_c4 <= '0'; timer_c5 <= '0';
		elsif rising_edge(divisor_to_clk) then
			-- increment seconds counter (0..999) when enabled
			if en_count_timer = '1' then
				if seconds_counter = 999 then
					seconds_counter <= 0;
				else
					seconds_counter <= seconds_counter + 1;
				end if;
			end if;

			-- update BCD digits: hundreds, tens, units
			counter_to_bcd_0 <= std_logic_vector(to_unsigned(seconds_counter / 100, 4));
			counter_to_bcd_1 <= std_logic_vector(to_unsigned((seconds_counter / 10) mod 10, 4));
			counter_to_bcd_2 <= std_logic_vector(to_unsigned(seconds_counter mod 10, 4));
			counter_to_bcd_3 <= (others => '0');

			-- simple blink and test outputs
			if (seconds_counter mod 2) = 0 then
				timer_pisca <= '1';
			else
				timer_pisca <= '0';
			end if;

			counter_test0 <= std_logic_vector(to_unsigned(seconds_counter mod 16, 4));
		end if;
	end process;
end architecture;