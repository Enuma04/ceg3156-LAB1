library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity rounder is
    Port (
        clock : in  STD_LOGIC;
        in_a  : in  STD_LOGIC_VECTOR(11 downto 0);
        out_r : out STD_LOGIC_VECTOR(7 downto 0)
    );
end rounder;

architecture structural of rounder is

    -- Internal signals
    signal base_val        : STD_LOGIC_VECTOR(7 downto 0);  -- in_a(11 downto 4)
    signal incremented_val : STD_LOGIC_VECTOR(7 downto 0);
    signal round_enable    : STD_LOGIC;
    signal sticky          : STD_LOGIC;
    signal g, r, lsb       : STD_LOGIC;

    -- Adder component
    component Adder8 is
        Port (
            i_Ai    : in  STD_LOGIC_VECTOR(7 downto 0);
            i_Bi     : in  STD_LOGIC_VECTOR(7 downto 0);
				o_CarryOut		: OUT	STD_LOGIC;
            O_Sum   : out STD_LOGIC_VECTOR(7 downto 0)
        );
    end component;

    -- 2-to-1 mux component
    component mux_2to1_a is
        Port (
            A     : in  STD_LOGIC_VECTOR(7 downto 0);
            B     : in  STD_LOGIC_VECTOR(7 downto 0);
            Sel   : in  STD_LOGIC;
            Y   : out STD_LOGIC_VECTOR(7 downto 0)
        );
    end component;

begin

    -- Extract base value
    base_val <= in_a(11 downto 4);

    -- Extract rounding bits
    g    <= in_a(4);
    r    <= in_a(3);
    lsb  <= in_a(5);
    sticky <= in_a(2) or in_a(1) or in_a(0);

    -- Rounding condition logic: round_enable = G and (R or S or LSB)
    round_enable <= g and (r or sticky or lsb);

    -- Adder to add 1 to base_val
    adder_inst: Adder8
        port map (
            i_Ai   => base_val,
            i_Bi   => "00000001",
				o_CarryOut => open,
            o_Sum => incremented_val
        );

    -- Mux to select rounded or unrounded result
    mux_inst: mux_2to1_a
        port map (
            A   => base_val,
            B   => incremented_val,
            Sel => round_enable,
            Y => out_r
        );

end structural;
