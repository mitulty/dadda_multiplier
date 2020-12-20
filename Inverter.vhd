library ieee;
use ieee.std_logic_1164.all;

entity Inverter is 
port(A:in std_logic;
		O:out std_logic);
end entity Inverter;

architecture behav of Inverter is 
begin
O<=not(A) after 100 ps;
end behav;
	