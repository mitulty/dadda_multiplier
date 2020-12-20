library ieee;
use ieee.std_logic_1164.all;

entity Logic_Gate_Invert is 
port(A,B,C:in std_logic;
		O:out std_logic);
end entity Logic_Gate_Invert;

architecture behav of Logic_Gate_Invert is 
signal x: std_logic;
begin
uut_0: entity work.Logic_Gate port map(A,B,C,x);
uut_1: entity work.Inverter port map(x,O);
end behav;
	