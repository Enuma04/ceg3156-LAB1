LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY FP_register IS
	PORT(
		i_reset, i_ld, i_clk : IN	STD_LOGIC;
		i_Value				 : IN	STD_LOGIC_VECTOR(15 downto 0);
		o_Sign				 : OUT	STD_LOGIC;
		o_Exponent			 : OUT 	STD_LOGIC_VECTOR(6 downto 0);
		o_Mantissa			 : OUT 	STD_LOGIC_VECTOR(7 downto 0));

END FP_register;

ARCHITECTURE rtl OF FP_register IS

signal int_sign : STD_LOGIC;
signal int_exp	: STD_LOGIC_VECTOR(6 downto 0);
signal int_mant : STD_LOGIC_VECTOR(7 downto 0);

COMPONENT eightBitRegister IS
	PORT(
		i_resetBar, i_load	: IN	STD_LOGIC;
		i_clock				: IN	STD_LOGIC;
		i_Value				: IN	STD_LOGIC_VECTOR(7 downto 0);
		o_Value				: OUT	STD_LOGIC_VECTOR(7 downto 0));
END COMPONENT;

COMPONENT sevenBitRegister IS
	PORT(
		i_resetBar, i_load	: IN	STD_LOGIC;
		i_clock				: IN	STD_LOGIC;
		i_Value				: IN	STD_LOGIC_VECTOR(6 downto 0);
		o_Value				: OUT	STD_LOGIC_VECTOR(6 downto 0));
END COMPONENT;

COMPONENT oneBitRegister IS
	PORT(
		i_resetBar, i_load	: IN	STD_LOGIC;
		i_clock				: IN	STD_LOGIC;
		i_Value				: IN	STD_LOGIC;
		o_Value				: OUT	STD_LOGIC);
END COMPONENT;

BEGIN

FP_sign: oneBitRegister PORT MAP (
		i_resetBar => i_reset,
		i_load => i_ld,
		i_clock	=> i_clk,		
		i_Value	=> i_Value(15),	
		o_Value	=> int_sign);

FP_exponent: sevenBitRegister PORT MAP (
		i_resetBar => i_reset,
		i_load	=> i_ld,
		i_clock	=> i_clk,
		i_Value	=> i_Value(14 downto 8),			
		o_Value => int_exp);
FP_mantissa: eightBitRegister PORT MAP (
		i_resetBar => i_reset,
		i_load	=> i_ld,
		i_clock	=> i_clk,
		i_Value	=> i_Value(7 downto 0),			
		o_Value => int_mant);


--Outputs
o_Sign <= int_sign;
o_Exponent <= int_exp;
o_Mantissa <= int_mant;

END rtl;