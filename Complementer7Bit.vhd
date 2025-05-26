library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Complementer7Bit is
    Port (
			en: in STD_LOGIC;
        A     : in  STD_LOGIC_VECTOR(6 downto 0);
        CompA : out STD_LOGIC_VECTOR(6 downto 0)
    );
end Complementer7Bit;

architecture rtl of Complementer7Bit is

    signal NotA    : STD_LOGIC_VECTOR(6 downto 0);
    signal Carry   : STD_LOGIC_VECTOR(7 downto 0); -- 8-bit: Carry(0) is Cin

    component oneBitAdder
        Port (
           i_CarryIn		: IN	STD_LOGIC;
				i_Ai, i_Bi		: IN	STD_LOGIC;
				o_Sum, o_CarryOut	: OUT	STD_LOGIC
        );
    end component;

begin
    NotA <=  (NOT A) and (others => en) ;
    Carry(0) <= '1';

    -- Instantiate 7 full adders
    FA_Loop : for i in 0 to 6 generate
        FA : oneBitAdder
            port map (
                i_Ai    => NotA(i),
                i_Bi    => '0',
                i_CarryIn  => Carry(i),
                o_Sum  => CompA(i),
                o_CarryOut => Carry(i+1)
            );
    end generate;

end rtl;
