--------------------------------------------------------------------------------
-- Copyright (c) 1995-2013 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 14.7
--  \   \         Application : sch2hdl
--  /   /         Filename : Counter.vhf
-- /___/   /\     Timestamp : 04/08/2019 11:49:22
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: sch2hdl -intstyle ise -family spartan3e -flat -suppress -vhdl C:/XilinxPrj/OLED/Test_oled/Counter.vhf -w C:/XilinxPrj/OLED/Test_oled/Counter.sch
--Design Name: Counter
--Device: spartan3e
--Purpose:
--    This vhdl netlist is translated from an ECS schematic. It can be 
--    synthesized and simulated, but it should not be modified. 
--

library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity Counter is
   port ( Clk   : in    std_logic; 
          Inc   : in    std_logic; 
          Reset : in    std_logic; 
          State : out   std_logic_vector (3 downto 0));
end Counter;

architecture BEHAVIORAL of Counter is
   attribute BOX_TYPE   : string ;
   signal XLXN_19     : std_logic;
   signal XLXN_20     : std_logic;
   signal XLXN_21     : std_logic;
   signal XLXN_22     : std_logic;
   signal XLXN_28     : std_logic;
   signal XLXN_29     : std_logic;
   signal XLXN_51     : std_logic;
   signal XLXN_54     : std_logic;
   signal State_DUMMY : std_logic_vector (3 downto 0);
   component INV
      port ( I : in    std_logic; 
             O : out   std_logic);
   end component;
   attribute BOX_TYPE of INV : component is "BLACK_BOX";
   
   component AND4
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             I2 : in    std_logic; 
             I3 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND4 : component is "BLACK_BOX";
   
   component FDRE
      generic( INIT : bit :=  '0');
      port ( C  : in    std_logic; 
             CE : in    std_logic; 
             D  : in    std_logic; 
             R  : in    std_logic; 
             Q  : out   std_logic);
   end component;
   attribute BOX_TYPE of FDRE : component is "BLACK_BOX";
   
   component OR2
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of OR2 : component is "BLACK_BOX";
   
begin
   State(3 downto 0) <= State_DUMMY(3 downto 0);
   XLXI_2 : INV
      port map (I=>State_DUMMY(0),
                O=>XLXN_19);
   
   XLXI_4 : INV
      port map (I=>State_DUMMY(1),
                O=>XLXN_20);
   
   XLXI_6 : INV
      port map (I=>State_DUMMY(2),
                O=>XLXN_21);
   
   XLXI_8 : INV
      port map (I=>State_DUMMY(3),
                O=>XLXN_22);
   
   XLXI_25 : AND4
      port map (I0=>XLXN_28,
                I1=>State_DUMMY(1),
                I2=>XLXN_29,
                I3=>State_DUMMY(3),
                O=>XLXN_51);
   
   XLXI_26 : INV
      port map (I=>State_DUMMY(2),
                O=>XLXN_29);
   
   XLXI_27 : INV
      port map (I=>State_DUMMY(0),
                O=>XLXN_28);
   
   XLXI_28 : FDRE
      port map (C=>Clk,
                CE=>Inc,
                D=>XLXN_19,
                R=>XLXN_54,
                Q=>State_DUMMY(0));
   
   XLXI_29 : FDRE
      port map (C=>Clk,
                CE=>XLXN_19,
                D=>XLXN_20,
                R=>XLXN_54,
                Q=>State_DUMMY(1));
   
   XLXI_30 : FDRE
      port map (C=>Clk,
                CE=>XLXN_20,
                D=>XLXN_21,
                R=>XLXN_54,
                Q=>State_DUMMY(2));
   
   XLXI_31 : FDRE
      port map (C=>Clk,
                CE=>XLXN_21,
                D=>XLXN_22,
                R=>XLXN_54,
                Q=>State_DUMMY(3));
   
   XLXI_33 : OR2
      port map (I0=>XLXN_51,
                I1=>Reset,
                O=>XLXN_54);
   
end BEHAVIORAL;


