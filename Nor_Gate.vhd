library ieee;
use ieee.std_logic_1164.all;

entity Nor_Gate is 
port(A,B:in std_logic;
		O:out std_logic);
end entity Nor_Gate;

architecture behav of Nor_Gate is 
begin
O<=(A nor B) after 150 ps;
end behav;
	