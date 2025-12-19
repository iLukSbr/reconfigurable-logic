
library ieee ;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity counter is

--generic(n: natural := 4);
port(	
	clk:	in std_logic;
	rst:	in std_logic;
	en:	in std_logic;
	o:	out std_logic_vector(3 downto 0)
);
end counter;

architecture behv of counter is		 	  
	
   -- signal Pre_Q: std_logic_vector(n-1 downto 0);
	signal Pre_Q: std_logic_vector(3 downto 0);


begin
    process(clk, en, rst)
    begin
	if rst = '1' then
 	    Pre_Q <= Pre_Q - Pre_Q;
	elsif (clk='1' and clk'event) then
	    if en = '1' then
		Pre_Q <= Pre_Q + 1;
	    end if;
	end if;
    end process;	
	
    o <= Pre_Q;
end behv;
