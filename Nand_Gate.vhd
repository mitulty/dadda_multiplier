library ieee;
use ieee.std_logic_1164.all;

entity Nand_Gate is 
port(A,B:in std_logic;
		O:out std_logic);
end entity Nand_Gate;

architecture behav of Nand_Gate is 
begin
O<=(A nand B) after 150 ps;
end behav;
	