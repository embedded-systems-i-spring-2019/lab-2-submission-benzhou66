
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity adder_tb is

end adder_tb;

architecture Behavioral of adder_tb is
component ripple_adder
port(
A0,B0,C0,A1,B1,A2,B2,A3,B3 : in std_logic;
    C4,S0,S1,S2,S3 : out std_logic
);
end component;
signal OPS : std_logic_vector(8 downto 0);

signal S0,S1,S2,S3,C4 : std_logic;
begin
UUT: ripple_adder
 port map(
A0=>OPS(8),
B0=>OPS(7),
C0=>OPS(6),
A1=>OPS(5),
B1=>OPS(4),
A2=>OPS(3),
B2=>OPS(2),
A3=>OPS(1),
B3=>OPS(0),
S0=>S0,
S1=>S1,
S2=>S2,
S3=>S3,
C4=>C4
);
process
begin
OPS<="000000000";
wait for 100ns;
OPS<="000000001";
wait for 100ns;
OPS<="000000010";
wait for 100ns;
OPS<="000000011";
wait for 100ns;
OPS<="000000100";
wait for 100ns;
OPS<="111000000";
wait for 100ns;
OPS<="000110000";
wait for 100ns;
OPS<="111111111"; --known output should be 11111
wait;
end process;
end Behavioral;
