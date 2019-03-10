
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ripple_adder is
    Port (
    A0,B0,C0,A1,B1,A2,B2,A3,B3 : in std_logic;
    C4,S0,S1,S2,S3 : out std_logic
    );
end ripple_adder;

architecture Behavioral of ripple_adder is
component adder
    port(
    A,B,Cin : in std_logic;
    Cout, S : out std_logic);
end component;
signal C1o,C2o,C3o : std_logic;
begin
adder1: adder
port map(
S=>S0,
A=>A0,
B=>B0,
Cin=>C0,
Cout=>C1o
);
adder2: adder
port map(
S=>S1,
A=>A1,
B=>B1,
Cout=>C2o,
Cin=>C1o
);
adder3: adder
port map(
S=>S2,
A=>A2,
B=>B2,
Cout=>C3o,
Cin=>C2o
);
adder4: adder
port map(
S=>S3,
A=>A3,
B=>B3,
Cout=>C4,
Cin=>C3o
);



end Behavioral;
