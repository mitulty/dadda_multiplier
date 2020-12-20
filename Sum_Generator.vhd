library ieee;
use ieee.std_logic_1164.all;

entity Sum_Generator is 
port(Pin,Cv:in std_logic;
		S:out std_logic);
end entity Sum_Generator;

architecture behav of Sum_Generator is 
begin
uut:entity work.Tiny_XOR port map(Pin,Cv,S);
end behav;
	