library ieee;
use ieee.std_logic_1164.all;

entity dadda_multiplier_tb is end entity;

architecture test of dadda_multiplier_tb is 
Signal A,B: std_logic_vector(15 downto 0);
Signal p: std_logic_vector(31 downto 0);
begin
uut:Entity work.dadda_multiplier port map(A,B,p);
process begin
A<="1010101001001011";
B<="1101010101011011";
wait for 30 ns;
A<="1010101110101010";
B<="1111010101010111";
wait for 30 ns;
A<="1110010101010111";
B<="1111010101011110";
wait for 30 ns;
A<="0000000000011111";
B<="0000000100001000";
wait for 30 ns;
A<="1111111111111111";
B<="1111111111111111";
wait for 30 ns;
A<="1010101111100001";
B<="1111111111111111";
wait for 30 ns;
A<="1111111111111110";
B<="1000000000000001";
wait for 30 ns;
wait;
end process;
end test;

