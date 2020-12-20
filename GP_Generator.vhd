library ieee;
use ieee.std_logic_1164.all;

entity GP_Generator is 
port(Gin_1,Pin_1,Gin_0,Pin_0:in std_logic;
		Gout,Pout:out std_logic);
end entity GP_Generator;

architecture behav of GP_Generator is 
Signal x,Px:std_logic;
begin
uut_Gs:entity work.Logic_Gate_Invert port map(Gin_1,Pin_1,Gin_0,Gout);
uut_Ps:entity work.And_Gate port map(Pin_1,Pin_0,Pout);
end behav;
	