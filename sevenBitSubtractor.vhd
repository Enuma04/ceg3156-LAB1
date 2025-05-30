library ieee;
use ieee.std_logic_1164.all;

entity sevenBitSubtractor is
port(
i_Bin 		: IN STD_LOGIC;
i_A,i_B  	: IN STD_LOGIC_VECTOR (6 DOWNTO 0);
o_Dout    	: OUT STD_LOGIC_VECTOR (6 DOWNTO 0);
o_Bout		: OUT STD_LOGIC);
end sevenBitSubtractor;

architecture rtl of sevenBitSubtractor is 

SIGNAL BOUT_INT : STD_LOGIC_VECTOR (6 DOWNTO 0);
SIGNAL DIFF_INT : STD_LOGIC_VECTOR (6 DOWNTO 0);

COMPONENT oneBitSubtractor 
port (
i_BorrowIn        	: IN STD_LOGIC;
i_Ai, i_Bi    		: IN STD_LOGIC;
o_Diff, o_BorrowOut : OUT STD_LOGIC);
END COMPONENT;

BEGIN 

sub0 : oneBitSubtractor port map (i_Bin , i_A(0), i_B(0), DIFF_INT(0), BOUT_INT(0));
sub1 : oneBitSubtractor port map (BOUT_INT(0), i_A(1), i_B(1), DIFF_INT(1), BOUT_INT(1));
sub2 : oneBitSubtractor port map (BOUT_INT(1), i_A(2), i_B(2), DIFF_INT(2), BOUT_INT(2));
sub3 : oneBitSubtractor port map (BOUT_INT(2) , i_A(3), i_B(3), DIFF_INT(3), BOUT_INT(3));
sub4 : oneBitSubtractor port map (BOUT_INT(3) , i_A(4), i_B(4), DIFF_INT(4), BOUT_INT(4));
sub5 : oneBitSubtractor port map (BOUT_INT(4) , i_A(5), i_B(5), DIFF_INT(5), BOUT_INT(5));
sub6 : oneBitSubtractor port map (BOUT_INT(5), i_A(6), i_B(6), DIFF_INT(6), BOUT_INT(6));

o_Dout <= DIFF_INT;
o_BOut <= BOUT_INT(6);

END rtl;