LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
LIBRARY UNISIM;
USE UNISIM.Vcomponents.ALL;
ENTITY Counter_Counter_sch_tb IS
END Counter_Counter_sch_tb;
ARCHITECTURE behavioral OF Counter_Counter_sch_tb IS 

   COMPONENT Counter
   PORT( State	:	OUT	STD_LOGIC_VECTOR (3 DOWNTO 0); 
          Reset	:	IN	STD_LOGIC; 
          Inc	:	IN	STD_LOGIC);
   END COMPONENT;

   SIGNAL State	:	STD_LOGIC_VECTOR (3 DOWNTO 0);
   SIGNAL Reset	:	STD_LOGIC;
   SIGNAL Inc	:	STD_LOGIC;

BEGIN

   UUT: Counter PORT MAP(
		State => State, 
		Reset => Reset, 
		Inc => Inc
   );

-- *** Test Bench - User Defined Section ***
   tb : PROCESS
   BEGIN
      WAIT; -- will wait forever
   END PROCESS;
-- *** End Test Bench - User Defined Section ***

END;
