-- Vhdl test bench created from schematic C:\XilinxPrj\OLED\Test_oled\Main.sch - Mon Apr 08 11:09:35 2019
--
-- Notes: 
-- 1) This testbench template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the unit under test.
-- Xilinx recommends that these types always be used for the top-level
-- I/O of a design in order to guarantee that the testbench will bind
-- correctly to the timing (post-route) simulation model.
-- 2) To use this template as your testbench, change the filename to any
-- name of your choice with the extension .vhd, and use the "Source->Add"
-- menu in Project Navigator to import the testbench. Then
-- edit the user defined section below, adding code to generate the 
-- stimulus for your design.
--
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
LIBRARY UNISIM;
USE UNISIM.Vcomponents.ALL;
ENTITY Main_Main_sch_tb IS
END Main_Main_sch_tb;
ARCHITECTURE behavioral OF Main_Main_sch_tb IS 

   COMPONENT Main
   PORT( Third	:	IN	STD_LOGIC; 
          Fourth	:	IN	STD_LOGIC; 
          Reset	:	IN	STD_LOGIC; 
          First	:	IN	STD_LOGIC; 
          Second	:	IN	STD_LOGIC; 
          Clk	:	IN	STD_LOGIC; 
          SDA	:	INOUT	STD_LOGIC; 
          SCL	:	INOUT	STD_LOGIC; 
          LED7	:	OUT	STD_LOGIC);
   END COMPONENT;

   SIGNAL Third	:	STD_LOGIC;
   SIGNAL Fourth	:	STD_LOGIC;
   SIGNAL Reset	:	STD_LOGIC:=0;
   SIGNAL First	:	STD_LOGIC;
   SIGNAL Second	:	STD_LOGIC;
   SIGNAL Clk	:	STD_LOGIC:=0;
   SIGNAL SDA	:	STD_LOGIC;
   SIGNAL SCL	:	STD_LOGIC;
   SIGNAL LED7	:	STD_LOGIC;
constant Clk_period : time := 20 ns;
BEGIN

   UUT: Main PORT MAP(
		Third => Third, 
		Fourth => Fourth, 
		Reset => Reset, 
		First => First, 
		Second => Second, 
		Clk => Clk, 
		SDA => SDA, 
		SCL => SCL, 
		LED7 => LED7
   );
   Clk <= not Clk after Clk_period/2;
-- *** Test Bench - User Defined Section ***
   
   process
   begin
      
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
-- *** End Test Bench - User Defined Section ***

END;




