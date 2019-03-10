


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;


entity debounce is
    Port ( btn : in STD_LOGIC;
           clk : in STD_LOGIC;
           dbnc : out STD_LOGIC);
end debounce;

architecture Behavioral of debounce is
    signal counter : std_logic_vector(26 downto 0):=(others=>'0');
begin   
    process(CLK)
    --variable Origin_Hz: integer :=125000000;
    --variable tmp: integer;
    begin
        
        if (rising_edge(clk)) then
         if (unsigned(counter) < 31249999) then
                     counter <= std_logic_vector(unsigned(counter) + 1); 
                     
              else
                     counter <= (others => '0');
                     dbnc<= btn;         
            end if;
        
         end if;
     end process;
end Behavioral;