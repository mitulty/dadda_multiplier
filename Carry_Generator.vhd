library ieee;
use ieee.std_logic_1164.all;

entity Carry_Generator is 
port(Gin,Pin,Ci:in std_logic;
		Co:out std_logic);
end entity Carry_Generator;

architecture behav of Carry_Generator is 
signal x:std_logic;
begin
uut:entity work.Logic_Gate_Invert port map(Gin,Pin,Ci,Co);
end behav;
	