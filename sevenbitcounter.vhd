library IEEE; use IEEE.STD_LOGIC_1164.ALL; 

entity sevenbitcounter is 
Port 
( clk : in STD_LOGIC; rst : in STD_LOGIC; en : in STD_LOGIC; o : out STD_LOGIC_VECTOR(6 downto 0) ); end sevenbitcounter; 

architecture rtl of sevenbitcounter is 

component tFF_2 
    Port ( 
        i_clock : in STD_LOGIC; 
        i_t     : in STD_LOGIC; 
        o_q     : out STD_LOGIC; 
        o_qbar  : out STD_LOGIC 
    ); 
end component; 
 
signal q : STD_LOGIC_VECTOR(6 downto 0); 
signal qbar : STD_LOGIC_VECTOR(6 downto 0); 
signal t : STD_LOGIC_VECTOR(6 downto 0); 
  

begin 

-- Toggle logic (ripple carry enable) 
t(0) <= en; 
t(1) <= q(0) and en; 
t(2) <= q(0) and q(1) and en; 
t(3) <= q(0) and q(1) and q(2) and en; 
t(4) <= q(0) and q(1) and q(2) and q(3) and en; 
t(5) <= q(0) and q(1) and q(2) and q(3) and q(4) and en; 
t(6) <= q(0) and q(1) and q(2) and q(3) and q(4) and q(5) and en; 
 
-- T Flip-Flop instantiations 
TFF0: tFF_2 port map(i_clock => clk, i_t => t(0), o_q => q(0), o_qbar => qbar(0)); 
TFF1: tFF_2 port map(i_clock => clk, i_t => t(1), o_q => q(1), o_qbar => qbar(1)); 
TFF2: tFF_2 port map(i_clock => clk, i_t => t(2), o_q => q(2), o_qbar => qbar(2)); 
TFF3: tFF_2 port map(i_clock => clk, i_t => t(3), o_q => q(3), o_qbar => qbar(3)); 
TFF4: tFF_2 port map(i_clock => clk, i_t => t(4), o_q => q(4), o_qbar => qbar(4)); 
TFF5: tFF_2 port map(i_clock => clk, i_t => t(5), o_q => q(5), o_qbar => qbar(5)); 
TFF6: tFF_2 port map(i_clock => clk, i_t => t(6), o_q => q(6), o_qbar => qbar(6)); 
 
o <= q; 
  

end rtl; 