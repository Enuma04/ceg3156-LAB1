library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux_2to1_b is
    Port ( SEL : in  STD_LOGIC;
           A   : in  STD_LOGIC_VECTOR (6 downto 0);
           B   : in  STD_LOGIC_VECTOR (6 downto 0);
           Y   : out STD_LOGIC_VECTOR (6 downto 0));
end mux_2to1_b;

architecture rtl of mux_2to1_b is
begin
    Y <= A when (SEL = '0') else B;
end rtl;