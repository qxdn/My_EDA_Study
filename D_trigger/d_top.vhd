library IEEE;
use IEEE.std_logic_1164.all;
entity d_top is
	port 	
	(
		rst_n	 : in  std_logic;  --复位低电平
		set_n	 : in  std_logic;  --置位低电平
		D		 : in  std_logic;  --输入
		clk	 : in  std_logic;  --时钟
		
		Q	 	 : out std_logic   --输出
	);
	end;
	
architecture bhv of d_top is
	begin
		process(rst_n,set_n,D,clk)
			begin
				if 		(rst_n='0') then Q<='0';
				elsif		(clk'event and clk ='1') then 
					if 	(set_n='0') then Q<='1';
					else	 Q<=D;
					end if;
				end if;
			end process;
	end bhv;