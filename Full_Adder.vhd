library ieee;
use ieee.std_logic_1164.all;

entity Full_Adder is 
port(A,B,Ci:in std_logic;
		S,Co:out std_logic);
end entity Full_Adder;
Architecture rtl of Full_Adder is
Signal x:std_logic;
Begin
uut_sum_p:entity work.Tiny_XOR port map(A,B,x);
uut_sum:entity work.Tiny_XOR port map(Ci,x,S);
Co<=(A and B) or (B and Ci) or (Ci and A) after 400 ps;
End rtl;
