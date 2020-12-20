library ieee;
use ieee.std_logic_1164.all;

entity Tiny_XOR is 
port(A,B:in std_logic;
		O:out std_logic);
end entity Tiny_XOR;

architecture behav of Tiny_XOR is 
begin
O<=(A xor B) after 200 ps;
end behav;
	