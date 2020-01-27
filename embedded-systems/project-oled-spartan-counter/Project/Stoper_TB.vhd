--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   10:38:21 05/20/2019
-- Design Name:   
-- Module Name:   C:/XilinxPrj/OLED/Test_oled/Stoper_TB.vhd
-- Project Name:  Test_oled
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Stoper
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY Stoper_TB IS
END Stoper_TB;
 
ARCHITECTURE behavior OF Stoper_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Stoper
    PORT(
         DO : IN  std_logic_vector(7 downto 0);
         E0 : IN  std_logic;
         F0 : IN  std_logic;
         Clk : IN  std_logic;
         DO_Rdy : IN  std_logic;
         First_digit : OUT  std_logic_vector(3 downto 0);
         Second_digit : OUT  std_logic_vector(3 downto 0);
         Third_digit : OUT  std_logic_vector(3 downto 0);
         Fourth_digit : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal DO : std_logic_vector(7 downto 0) := (others => '0');
   signal E0 : std_logic := '0';
   signal F0 : std_logic := '0';
   signal Clk : std_logic := '0';
   signal DO_Rdy : std_logic := '0';

 	--Outputs
   signal First_digit : std_logic_vector(3 downto 0);
   signal Second_digit : std_logic_vector(3 downto 0);
   signal Third_digit : std_logic_vector(3 downto 0);
   signal Fourth_digit : std_logic_vector(3 downto 0);

 
BEGIN
 Clk <= not Clk after 10 ns;
	-- Instantiate the Unit Under Test (UUT)
   uut: Stoper PORT MAP (
          DO => DO,
          E0 => E0,
          F0 => F0,
          Clk => Clk,
          DO_Rdy => DO_Rdy,
          First_digit => First_digit,
          Second_digit => Second_digit,
          Third_digit => Third_digit,
          Fourth_digit => Fourth_digit
        );
 


   stim_proc: process
   begin		
     
      DO<=X"29";
      DO_Rdy<='1';
      wait for 100 ns;
      DO_Rdy<='0';
      wait for 100 ns;
      DO<=X"F0";
      DO_Rdy<='1';
      wait for 100 ns;
      DO_Rdy<='0';
      wait for 100 ns;	
      DO<=X"29";
      DO_Rdy<='1';
      wait for 100 ns;
      DO_Rdy<='0';
      wait for 10000 ms;
      DO<=X"29";
      DO_Rdy<='1';
      wait for 100 ns;
      DO_Rdy<='0';
      wait for 100 ns;
      DO<=X"F0";
      DO_Rdy<='1';
      wait for 100 ns;
      DO_Rdy<='0';
      wait for 100 ns;	
      DO<=X"29";
      DO_Rdy<='1';
      wait for 100 ns;
      DO_Rdy<='0';
      wait;
   end process;

END;
