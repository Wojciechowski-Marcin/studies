
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Stoper is
    Port ( DO : in  STD_LOGIC_VECTOR (7 downto 0);
           E0 : in  STD_LOGIC;
           F0 : in  STD_LOGIC;
           Clk: in  STD_LOGIC;
           DO_Rdy : in  STD_LOGIC;
           First_digit : out  STD_LOGIC_VECTOR (3 downto 0);
           Second_digit : out  STD_LOGIC_VECTOR (3 downto 0);
           Third_digit : out  STD_LOGIC_VECTOR (3 downto 0);
           Fourth_digit : out  STD_LOGIC_VECTOR (3 downto 0));
end Stoper;

architecture Behavioral of Stoper is
signal started : STD_LOGIC:='0';
signal clk_counter : STD_LOGIC_VECTOR(31 downto 0):=X"00000000";
signal First_counter: STD_LOGIC_VECTOR(3 downto 0):="0000";
signal Second_counter: STD_LOGIC_VECTOR(3 downto 0):="0000";
signal Third_counter: STD_LOGIC_VECTOR(3 downto 0):="0000";
signal Fourth_counter: STD_LOGIC_VECTOR(3 downto 0):="0000";
begin
process1 : process( Clk, started )
begin
if rising_edge( Clk ) and started='1' then
   if First_counter="1010" then
      First_counter<="0000";
      Second_counter<=std_logic_vector( unsigned(Second_counter) + 1 );
   end if;
   if Second_counter="1010" then
      Second_counter<="0000";
      Third_counter<=std_logic_vector( unsigned(Third_counter) + 1 );
   end if;
   if Third_counter="1010" then
      Third_counter<="0000";
      Fourth_counter<=std_logic_vector( unsigned(Fourth_counter) + 1 );
   end if;
   if Fourth_counter="1010" then
      Fourth_counter<="0000";
   end if;
   if clk_counter=X"02FAF080" then 
--   if clk_counter=X"00000008" then 
      clk_counter<=X"00000001";
      First_counter<=std_logic_vector( unsigned(First_counter) + 1 );
   else
      clk_counter<=std_logic_vector( unsigned(clk_counter) + 1 );
   end if;
end if;
end process process1;

process2 : process(DO_Rdy,DO,started)
begin
     if falling_edge( DO_Rdy ) and DO = X"F0" then
       if started='0' then
          started<='1';
       else
          started<='0';
       end if;   
   end if;
end process process2;

process3 : process( Clk,First_counter,Second_counter,Third_counter,Fourth_counter  )
begin
if rising_edge( Clk) then
   First_digit<=First_counter;
   Second_digit<=Second_counter;
   Third_digit<=Third_counter;
   Fourth_digit<=Fourth_counter;
end if;

end process process3;


end Behavioral;

