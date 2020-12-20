library ieee;
use ieee.std_logic_1164.all;

entity And_Gate is 
port(A,B:in std_logic;
		O:out std_logic);
end entity And_Gate;

architecture behav of And_Gate is 
Signal x:std_logic;
begin
uut_nand:entity work.Nand_Gate port map(A,B,x);
uut_and:entity work.Inverter port map(x,O);
end behav;
	