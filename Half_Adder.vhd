library ieee;
use ieee.std_logic_1164.all;

entity Half_Adder is 
port(A,B:in std_logic;
		S,C:out std_logic);
end entity Half_Adder;
Architecture rtl of Half_Adder is
Signal Ci:std_logic;
Begin
uut_sum:entity work.Tiny_XOR port map(A,B,S); 
uut_carry_not:entity work.Nand_Gate port map(A,B,Ci);
uut_carry:entity work.Inverter port map(Ci,C);
End rtl;
