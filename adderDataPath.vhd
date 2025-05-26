library ieee;
use ieee.std_logic_1164.all;

entity adderDataPath is
	port(
	--IN
		Sign_A, Sign_B: in STD_LOGIC;
		Mantissa_A, Mantissa_B: in STD_LOGIC;
		Exponent_A, Exponent_B: in STD_LOGIC;
		I_CLOCK, I_RESET_BAR: in STD_LOGIC;
	--OUT
		Sign_Out: out STD_LOGIC;
		Mantissa_Out: out STD_LOGIC;
		Exponent_Out: out STD_LOGIC;
	--Control Path link
		load1, load2, load3, load4, load5, load6, load7: in STD_LOGIC;
		on21, on22, flag0, flag1: in STD_LOGIC;
		clear3, clear4, shiftR3, shiftR4, shiftR5: in STD_LOGIC;
		cin, countD6, countU7, done: in STD_LOGIC;
		sign, notless9, coutfz, zero: out STD_LOGIC
	);
	end adderDataPath;
	
	architecture rtl of adderDataPath is
	   SIGNAL SHFTAMantissa, SHFTBMantissa, AExpBiggerThanBExp, AExpSmallerThanBExp, DCEMT_SIG    : STD_LOGIC;
		 SIGNAL SignAorSignBNegative             : STD_LOGIC;
		 SIGNAL exponentSubtractor_result        : STD_LOGIC_VECTOR(7 downto 0);
		 SIGNAL exponentDifferenceNegator_result : STD_LOGIC_VECTOR(7 downto 0);
		 SIGNAL ExponentA_8Bit, ExponentB_8Bit   : STD_LOGIC_VECTOR(7 downto 0);
		 SIGNAL MantissaA_9Bit, MantissaB_9Bit   : STD_LOGIC_VECTOR(8 downto 0);
		 SIGNAL downcounter_result               : STD_LOGIC_VECTOR(7 downto 0);
		 SIGNAL register_Am_result               : STD_LOGIC_VECTOR(8 downto 0);
		 SIGNAL register_Bm_result               : STD_LOGIC_VECTOR(8 downto 0);
		 SIGNAL register_Am_negator_result       : STD_LOGIC_VECTOR(8 downto 0);
		 SIGNAL register_Bm_negator_result       : STD_LOGIC_VECTOR(8 downto 0);
		 SIGNAL mantissa_adder_result            : STD_LOGIC_VECTOR(8 downto 0);
		 SIGNAL complementer_Sm_result           : STD_LOGIC_VECTOR(8 downto 0);
		 SIGNAL mantissa_adder_8Bit              : STD_LOGIC_VECTOR(7 downto 0);
		 SIGNAL register_Sm_result               : STD_LOGIC_VECTOR(8 downto 0);
		 SIGNAL larger_exponent                  : STD_LOGIC_VECTOR(7 downto 0);
		 SIGNAL register_Se_result               : STD_LOGIC_VECTOR(7 downto 0);
		 SIGNAL register_Sum_input               : STD_LOGIC_VECTOR(15 downto 0);
		 SIGNAL mantissaAddCarry					  : STD_LOGIC;
		 
		 COMPONENT FP_Register IS
			PORT(
				i_reset, i_ld, i_clk : IN	STD_LOGIC;
				i_Value				 : IN	STD_LOGIC_VECTOR(15 downto 0);
				o_Sign				 : OUT	STD_LOGIC;
				o_Exponent			 : OUT 	STD_LOGIC_VECTOR(6 downto 0);
				o_Mantissa			 : OUT 	STD_LOGIC_VECTOR(7 downto 0));

			END COMPONENT;

		 
		 begin
		 
		 
		 end rtl;