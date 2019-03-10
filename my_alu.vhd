library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity my_alu is
port(
A,B :in std_logic_vector(3 downto 0);
x : in std_logic_vector(3 downto 0);
output: out std_logic_vector(6 downto 0)
);
end my_alu;

architecture Behavioral of my_alu is

begin
my_aluput : process(x)
begin
if (x="0000") then
 output<=std_logic_vector(unsigned(A)+unsigned(B));
 elsif (x="0001") then
 output<=std_logic_vector(unsigned(A)-unsigned(B));
 elsif (x="0010") then
 output<=std_logic_vector(unsigned(A)+1);
 elsif (x="0011") then
  output<=std_logic_vector(unsigned(A)+1);
 elsif (x="0100") then
   output<=std_logic_vector(0-unsigned(A));
 elsif (x="0101") then
    if (A>B) then
    output<="0001";
    else
    output<="0000";
    end if;
 elsif (x="0110") then
        output<=std_logic_vector(unsigned(A) sll 1);
 elsif (x="0111") then
        output<=std_logic_vector(unsigned(A) srl 1);
 elsif(x="1000") then
        output<=to_stdlogicvector(to_bitvector(A) sra 1);
 elsif(x="1001") then
        output<= not A;
 elsif(x="1010") then
        output<=A and B;
 elsif(x="1011") then
        output<=A or B;
 elsif(x="1100") then
        output<=A xor B;
 elsif(x="1101") then
        output<=A xnor B;
 elsif(x="1110") then
        output<=A nand B;
 else
 output<=A nor B;
end if;

end process;  

end Behavioral;

