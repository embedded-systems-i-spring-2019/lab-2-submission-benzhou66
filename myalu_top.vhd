
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity alu_tester is
    Port ( btn0,btn1,btn2,btn3,clk : in STD_LOGIC;
           sw :in std_logic_vector(3 downto 0);
           led : out STD_LOGIC_VECTOR (3 downto 0));
end alu_tester;

architecture Behavioral of alu_tester is
component my_alu
port(
A,B :in std_logic_vector(3 downto 0);
x : in std_logic_vector(3 downto 0);
output: out std_logic_vector(6 downto 0)
);
end component;
component debounce
port(
  btn : in STD_LOGIC;
  clk : in STD_LOGIC;
  dbnc : out STD_LOGIC
);
end component;
signal xo,Ao,Bo : std_logic_vector(3 downto 0);
signal btn0o,btn1o,btn2o,btn3o : std_logic;
begin
process(clk)
begin
if (rising_edge(clk)) then
   if (btn3o='1') then
   Ao<="0000"; Bo<="0000"; xo<="0000";
   else
    if (btn0o='1') then
    Ao<=sw;
    end if;
    if (btn1o='1') then
    Bo<=sw;
    end if;
    if(btn2o='1') then
    xo<=sw;
    end if;
    end if;
    end if;
    end process;
alu: my_alu
port map(
A=>Ao,
B=>Bo,
x=>xo,
output=>led
); 

debn0: debounce
port map(
btn=>btn0,
dbnc=>btn0o,
clk=>clk
);
debn1: debounce
port map(
btn=>btn1,
dbnc=>btn1o,
clk=>clk
);
debn2: debounce
port map(
btn=>btn2,
dbnc=>btn2o,
clk=>clk
);
debn3: debounce
port map(
btn=>btn3,
dbnc=>btn3o,
clk=>clk
);



end Behavioral;
