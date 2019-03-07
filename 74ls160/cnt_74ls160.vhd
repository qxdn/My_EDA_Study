library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all; --不知道干什么
entity cnt_74ls160 is
	port 
	(
		rst_n  :		in std_logic;
		clk	 :		in std_logic;
		pe_te	 : 	in std_logic_vector(1 downto 0);
		load_n :		in std_logic;
		D		 :		in std_logic_vector(3 downto 0); --数据输入
		
		C		 :		out std_logic; --进位
		Q_out	 :		out std_logic_vector(3 downto 0)
	);
end entity;

architecture bhv of cnt_74ls160 is
	signal Q :std_logic_vector (3 downto 0);
	begin
		process(rst_n,clk,pe_te,load_n)
			begin
				if(rst_n='0') then Q<="0000";C<='0';
				elsif (clk'event and clk='1') then
					if(load_n='0')		then		Q<=D;C<='0';
					elsif(pe_te="00") then		
						if (Q="1001") then Q<="0000";C<='1';
						else	 Q<=Q+1;C<='0';
						end if;
					end if;
				end if;
			end process;
		Q_out<=Q;
	end bhv;