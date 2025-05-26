library ieee;
use ieee.std_logic_1164.all;

entity adderControlUnit is
	port(
		I_CLOCK, I_RESET_BAR: in STD_LOGIC;
		sign, notless9, coutfz, zero: in STD_LOGIC;
		load1, load2, load3, load4, load5, load6, load7: out STD_LOGIC;
		on21, on22, flag0, flag1: out STD_LOGIC;
		clear3, clear4, shiftR3, shiftR4, shiftR5: out STD_LOGIC;
		cin, countD6, countU7, done: out STD_LOGIC
		);
		END adderControlUnit;
		
		ARCHITECTURE STRUCT OF adderControlUnit IS
			SIGNAL S0, S1, S2, S3, S4, S5, S6, S7, S8, S9: STD_LOGIC;
			
			COMPONENT enARDFF_2 IS
			PORT(
				i_resetBar: IN STD_LOGIC;
				i_d: IN STD_LOGIC;
				i_enable: IN STD_LOGIC;
				i_clock: IN STD_LOGIC;
				o_q, o_qbar: OUT STD_LOGIC
				);
			END COMPONENT;
			
			BEGIN
			
			D_FF_0 : enARdFF_2
			PORT MAP (i_resetBar => I_RESET_BAR , i_d => '1', i_enable => '1', i_clock => I_CLOCK, o_q => S0 );
			
			D_FF_1 : enARdFF_2
			PORT MAP (i_resetBar => I_RESET_BAR , i_d => S0, i_enable => '1', i_clock => I_CLOCK, o_q => S1 );
			
			D_FF_2 : enARdFF_2
			PORT MAP (i_resetBar => I_RESET_BAR , i_d => S1 AND sign, i_enable => '1', i_clock => I_CLOCK, o_q => S2 );
			
			D_FF_3 : enARdFF_2
			PORT MAP (i_resetBar => I_RESET_BAR , i_d => S2 AND NOT(notless9), i_enable => '1', i_clock => I_CLOCK, o_q => S3 );
			
			D_FF_4 : enARdFF_2
			PORT MAP (i_resetBar => I_RESET_BAR , i_d => (S2 AND NOT(notless9) AND NOT(zero)) OR (S4 AND NOT(zero)), i_enable => '1', i_clock => I_CLOCK, o_q => S4 );
			
			D_FF_5 : enARdFF_2
			PORT MAP (i_resetBar => I_RESET_BAR , i_d => S1 AND NOT(sign) AND notless9, i_enable => '1', i_clock => I_CLOCK, o_q => S5 );
			
			D_FF_6 : enARdFF_2
			PORT MAP (i_resetBar => I_RESET_BAR , i_d => (S1 AND NOT(sign)AND NOT(notless9) AND NOT(zero)) OR (NOT(zero) AND S6), i_enable => '1', i_clock => I_CLOCK, o_q => S6 );
			
			D_FF_7 : enARdFF_2
			PORT MAP (i_resetBar => I_RESET_BAR , i_d => ((S1 AND (NOT(sign))AND NOT(notless9) AND zero) OR S5 OR S3 OR (S2 AND NOT(notless9) AND zero)), i_enable => '1', i_clock => I_CLOCK, o_q => S7 );
			
			D_FF_8 : enARdFF_2
			PORT MAP (i_resetBar => I_RESET_BAR , i_d =>  S7 AND coutfz, i_enable => '1', i_clock => I_CLOCK, o_q => S8 );
			
			D_FF_9 : enARdFF_2
			PORT MAP (i_resetBar => I_RESET_BAR , i_d => (S7 AND NOT(coutfz)) OR S8 OR S9, i_enable => '1', i_clock => I_CLOCK, o_q => S9 );
			
			load1 <= S0;
			load2 <= S0;
			load3 <= S0;
			load4 <= S0;
			on21 <= S2;
			flag1 <= S2;
			on22 <= S1;
			flag0 <= S1;
			clear3 <= S3;
			shiftR3 <=  S4;
			clear4 <=  S5;
			shiftR4 <=  S6;
			load5 <= S7;
			load7 <= S7;
			shiftR5 <=  S8;
			countU7 <=  S8;
			done <= S9;
			cin <=  S1 OR S2;
			load6 <= S1 OR S2;
			countD6 <= S4 OR S6;
		
			
			END STRUCT;
