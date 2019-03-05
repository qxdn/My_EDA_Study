library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity MUX41A_TOP is
	port (
		s0_4   		  : in   std_logic_vector(0 to 3);  --选择
		a,b,c,d		  : in   std_logic;	--信号输入
		
		Y				  : out  std_logic	--输出
	);
end entity MUX41A_TOP;


architecture if_else of mux41A_TOP is
		begin
			process (s0_4,a,b,c,d)
				begin
					if 	(s0_4="0111") then y<=a;
					elsif (s0_4="1011") then y<=b;
					elsif (s0_4="1101") then y<=c;
					elsif (s0_4="1110") then y<=d;
					else 							 y<='Z'; --你的错
					end if;
				end process;
		end if_else;
		
		
architecture when_else of mux41A_TOP is
		begin
			y <= a when (s0_4="0111")
			else b when (s0_4="1011")
			else c when (s0_4="1101")
			else d when (s0_4="1110")
			else 'Z';
		end when_else;
		
architecture usecase of mux41A_TOP is
		begin
			process(s0_4,a,b,c,d)
				begin
				case (s0_4) is
						when "0111" => y <= a;
						when "1011" => y <= b;
						when "1101" => y <= c;
						when "1110" => y <= d;
						when others => null；
				end case;
				end process;
		end usecase;