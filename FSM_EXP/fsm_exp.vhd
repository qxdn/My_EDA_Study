library ieee;
use ieee.std_logic_1164.all;
entity FSM_EXP is
	port
	(
	clk,reset		:in 	std_logic;
	state_inputs	:in 	std_logic_vector(0 to 1);
	comb_outputs   :out	integer range 0 to 15
	);
end FSM_EXP;

architecture behv of FSM_EXP is
	type FSM_ST is (s0,s1,s2,s3,s4);  --定义数据类型
	signal c_st,next_state :FSM_ST;
	begin
		reg:process (reset,clk)
			begin
				if reset='0' then c_st<=s0;
				elsif clk='1' and clk'event then c_st<=next_state;
				end if;
			end process reg;
		com1:process (c_st,state_inputs)
			begin
				case c_st is
					when s0=>if state_inputs ="00" then next_state<=s0;
					else next_state<=s1; end if;
					when s1=>if state_inputs ="01" then next_state<=s1;
					else next_state<=s2; end if;
					when s2=>if state_inputs ="10" then next_state<=s0;
					else next_state<=s3; end if;
					when s3=>if state_inputs ="11" then next_state<=s3;
					else next_state<=s4; end if;
					when s4=>next_state<=s0;
					when others => next_state<=s0;
				end case;
			end process com1;
		com2:process (c_st)
			begin
				case c_st is
					when s0=> comb_outputs<=5;
					when s1=> comb_outputs<=8;
					when s2=> comb_outputs<=12;
					when s3=> comb_outputs<=14;
					when s4=> comb_outputs<=9;
					when others=> comb_outputs<=5;
				end case;
			end process com2;
	end architecture behv;
