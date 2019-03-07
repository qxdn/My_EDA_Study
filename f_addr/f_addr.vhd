library ieee;
use ieee.std_logic_1164.all;
entity f_addr is
	port
	(
		a		: in		std_logic;
		b		: in		std_logic;
		c		: in		std_logic;
		
		so		: out		std_logic;
		co		: out		std_logic
	);
	end f_addr;
	
architecture adder of f_addr is
begin
		process(a,b,c)
		begin
			if 	(a='1' and b='1' and c ='1')
				then so<='1';co<='1';
			elsif (a='1' and b='1' and c ='0')
				then so<='0'; co<='1';
			elsif (a='1' and b='0' and c ='1')
				then so<='0'; co<='1';
			elsif	(a='1' and b='0' and c ='0')
				then so<='1';co<='1';
			elsif	(a='0' and b='1' and c ='1')
				then so<='0';co<='1';
			elsif	(a='0' and b='1' and c ='0')
				then so<='1';co<='0';
			elsif	(a='0' and b='0' and c ='1')
				then so<='1';co<='0';
			else
				 so<='0';co<='0';
			end if;
		end process;
end adder;
