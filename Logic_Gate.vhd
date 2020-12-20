library ieee;
use ieee.std_logic_1164.all;

entity Logic_Gate is 
port(A,B,C:in std_logic;
		O:out std_logic);
end entity Logic_Gate;

architecture behav of Logic_Gate is 
begin
O<=not(A or (B and C)) after 200 ps;
end behav;
	