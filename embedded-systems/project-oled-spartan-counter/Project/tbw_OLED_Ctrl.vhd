LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
 
ENTITY tbw_OLED_Ctrl IS
END tbw_OLED_Ctrl;
 
ARCHITECTURE behavior OF tbw_OLED_Ctrl IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT OLED_Ctrl
    PORT(
         Clk : IN  std_logic;
         Reset : IN  std_logic;
         Byte : IN  std_logic_vector(7 downto 0);
         WriteByte : IN  std_logic;
         Busy : OUT  std_logic;
         I2C_Go : OUT  std_logic;
         I2C_FIFO_DI : OUT  std_logic_vector(7 downto 0);
         I2C_FIFO_Push : OUT  std_logic;
         I2C_FIFO_Full : IN  std_logic;
         I2C_Busy : IN  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal Clk : std_logic := '0';
   signal Reset : std_logic := '0';
   signal Byte : std_logic_vector(7 downto 0) := (others => '0');
   signal WriteByte : std_logic := '0';
   signal I2C_FIFO_Full : std_logic := '0';
   signal I2C_Busy : std_logic := '0';

 	--Outputs
   signal Busy : std_logic;
   signal I2C_Go : std_logic;
   signal I2C_FIFO_DI : std_logic_vector(7 downto 0);
   signal I2C_FIFO_Push : std_logic;

   -- Clock period definitions
   constant Clk_period : time := 20 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: OLED_Ctrl PORT MAP (
          Clk => Clk,
          Reset => Reset,
          Byte => Byte,
          WriteByte => WriteByte,
          Busy => Busy,
          I2C_Go => I2C_Go,
          I2C_FIFO_DI => I2C_FIFO_DI,
          I2C_FIFO_Push => I2C_FIFO_Push,
          I2C_FIFO_Full => I2C_FIFO_Full,
          I2C_Busy => I2C_Busy
        );

   -- Clock definition
   Clk <= not Clk after Clk_period/2;

   -- I2C_Busy signal returning from I2C_Master
   process
   begin
      loop
         wait until rising_edge( Clk ) and I2C_Go = '1';
         I2C_Busy <= '1';
         wait for 20 * Clk_period;
         I2C_Busy <= '0';
      end loop;
   end process;

   -- Stimulus process
   stim_proc: process
   begin
      -- hold reset state for 10 clocks.
      Reset <= '1';
      wait for 10 * clk_period;
      Reset <= '0';

      -- wait until UUT is ready (OLED initialization)
      wait until rising_edge( Clk ) and Busy = '0';
      
      -- send some bytes
      for i in 3 to 10 loop
         wait for 3 * Clk_period;

         Byte <= std_logic_vector( to_unsigned( i, 8 ) );
         WriteByte <= '1';
         wait for Clk_period;
         WriteByte <= '0';

         wait until rising_edge( Clk ) and Busy = '0';
      end loop;

      wait;
   end process;

END;
