--------------------------------------------------------------------------------
-- Copyright (c) 1995-2013 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 14.7
--  \   \         Application : sch2hdl
--  /   /         Filename : Counter_drc.vhf
-- /___/   /\     Timestamp : 03/25/2019 10:19:54
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: C:\Xilinx\14.7\ISE_DS\ISE\bin\nt\unwrapped\sch2hdl.exe -intstyle ise -family spartan3e -flat -suppress -vhdl Counter_drc.vhf -w C:/XilinxPrj/OLED/Test_oled/Counter.sch
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
   port ( Inc   : in    std_logic; 
          Reset : in    std_logic; 
          State : out   std_logic_vector (3 downto 0));
end Counter;

architecture BEHAVIORAL of Counter is
   attribute BOX_TYPE   : string ;
   signal XLXN_16     : std_logic;
   signal XLXN_17     : std_logic;
   signal XLXN_18     : std_logic;
   signal XLXN_19     : std_logic;
   signal XLXN_20     : std_logic;
   signal XLXN_21     : std_logic;
   signal XLXN_22     : std_logic;
   signal XLXN_28     : std_logic;
   signal XLXN_29     : std_logic;
   signal State_DUMMY : std_logic_vector (3 downto 0);
   component INV
      port ( I : in    std_logic; 
             O : out   std_logic);
   end component;
   attribute BOX_TYPE of INV : component is "BLACK_BOX";
   
   component FDR
      generic( INIT : bit :=  '0');
      port ( C : in    std_logic; 
             D : in    std_logic; 
             R : in    std_logic; 
             Q : out   std_logic);
   end component;
   attribute BOX_TYPE of FDR : component is "BLACK_BOX";
   
   component AND4
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             I2 : in    std_logic; 
             I3 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND4 : component is "BLACK_BOX";
   
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
   
   XLXI_21 : FDR
      port map (C=>XLXN_19,
                D=>XLXN_20,
                R=>XLXN_16,
                Q=>State_DUMMY(1));
   
   XLXI_22 : FDR
      port map (C=>XLXN_20,
                D=>XLXN_21,
                R=>XLXN_17,
                Q=>State_DUMMY(2));
   
   XLXI_23 : FDR
      port map (C=>Inc,
                D=>XLXN_19,
                R=>Reset,
                Q=>State_DUMMY(0));
   
   XLXI_24 : FDR
      port map (C=>XLXN_21,
                D=>XLXN_22,
                R=>XLXN_18,
                Q=>State_DUMMY(3));
   
   XLXI_25 : AND4
      port map (I0=>XLXN_28,
                I1=>State_DUMMY(1),
                I2=>XLXN_29,
                I3=>State_DUMMY(3),
                O=>XLXN_16);
   
   XLXI_26 : INV
      port map (I=>State_DUMMY(2),
                O=>XLXN_29);
   
   XLXI_27 : INV
      port map (I=>State_DUMMY(0),
                O=>XLXN_28);
   
end BEHAVIORAL;


