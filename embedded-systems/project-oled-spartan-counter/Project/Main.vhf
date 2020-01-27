--------------------------------------------------------------------------------
-- Copyright (c) 1995-2013 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 14.7
--  \   \         Application : sch2hdl
--  /   /         Filename : Main.vhf
-- /___/   /\     Timestamp : 05/20/2019 10:29:23
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: sch2hdl -intstyle ise -family spartan3e -flat -suppress -vhdl C:/XilinxPrj/OLED/Test_oled/Main.vhf -w C:/XilinxPrj/OLED/Test_oled/Main.sch
--Design Name: Main
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

entity Main is
   port ( Clk      : in    std_logic; 
          PS2_Clk  : in    std_logic; 
          PS2_Data : in    std_logic; 
          Reset    : in    std_logic; 
          LED7     : out   std_logic; 
          SCL      : inout std_logic; 
          SDA      : inout std_logic);
end Main;

architecture BEHAVIORAL of Main is
   signal XLXN_24                    : std_logic;
   signal XLXN_25                    : std_logic_vector (7 downto 0);
   signal XLXN_26                    : std_logic_vector (7 downto 0);
   signal XLXN_27                    : std_logic;
   signal XLXN_28                    : std_logic;
   signal XLXN_29                    : std_logic;
   signal XLXN_30                    : std_logic;
   signal XLXN_43                    : std_logic_vector (7 downto 0);
   signal XLXN_44                    : std_logic;
   signal XLXN_45                    : std_logic;
   signal XLXN_46                    : std_logic;
   signal XLXN_47                    : std_logic_vector (3 downto 0);
   signal XLXN_48                    : std_logic_vector (3 downto 0);
   signal XLXN_49                    : std_logic_vector (3 downto 0);
   signal XLXN_50                    : std_logic_vector (3 downto 0);
   signal XLXN_59                    : std_logic;
   signal XLXN_60                    : std_logic_vector (7 downto 0);
   signal XLXI_7_FIFO_Pop_openSignal : std_logic;
   signal XLXI_7_ReadCnt_openSignal  : std_logic_vector (3 downto 0);
   component OLED_Ctrl
      port ( Clk           : in    std_logic; 
             Reset         : in    std_logic; 
             WriteByte     : in    std_logic; 
             I2C_FIFO_Full : in    std_logic; 
             I2C_Busy      : in    std_logic; 
             Byte          : in    std_logic_vector (7 downto 0); 
             Busy          : out   std_logic; 
             I2C_Go        : out   std_logic; 
             I2C_FIFO_Push : out   std_logic; 
             I2C_FIFO_DI   : out   std_logic_vector (7 downto 0));
   end component;
   
   component I2C_Master
      port ( Go         : in    std_logic; 
             Address    : in    std_logic_vector (7 downto 0); 
             ReadCnt    : in    std_logic_vector (3 downto 0); 
             SDA        : inout std_logic; 
             SCL        : inout std_logic; 
             FIFO_Pop   : in    std_logic; 
             FIFO_Push  : in    std_logic; 
             FIFO_DI    : in    std_logic_vector (7 downto 0); 
             FIFO_Empty : out   std_logic; 
             FIFO_Full  : out   std_logic; 
             FIFO_DO    : out   std_logic_vector (7 downto 0); 
             Reset      : in    std_logic; 
             Clk        : in    std_logic; 
             Busy       : out   std_logic; 
             NACK       : out   std_logic);
   end component;
   
   component PS2_Kbd
      port ( PS2_Clk   : in    std_logic; 
             PS2_Data  : in    std_logic; 
             Clk_50MHz : in    std_logic; 
             E0        : out   std_logic; 
             F0        : out   std_logic; 
             DO_Rdy    : out   std_logic; 
             DO        : out   std_logic_vector (7 downto 0); 
             Clk_Sys   : in    std_logic);
   end component;
   
   component Stoper
      port ( E0           : in    std_logic; 
             F0           : in    std_logic; 
             Clk          : in    std_logic; 
             DO_Rdy       : in    std_logic; 
             DO           : in    std_logic_vector (7 downto 0); 
             First_digit  : out   std_logic_vector (3 downto 0); 
             Second_digit : out   std_logic_vector (3 downto 0); 
             Third_digit  : out   std_logic_vector (3 downto 0); 
             Fourth_digit : out   std_logic_vector (3 downto 0));
   end component;
   
   component Selector
      port ( Clk           : in    std_logic; 
             Reset         : in    std_logic; 
             Busy          : in    std_logic; 
             First_number  : in    std_logic_vector (3 downto 0); 
             Second_number : in    std_logic_vector (3 downto 0); 
             Third_number  : in    std_logic_vector (3 downto 0); 
             Fourth_number : in    std_logic_vector (3 downto 0); 
             WriteByte     : out   std_logic; 
             Result        : out   std_logic_vector (7 downto 0));
   end component;
   
begin
   XLXN_25(7 downto 0) <= x"78";
   XLXI_6 : OLED_Ctrl
      port map (Byte(7 downto 0)=>XLXN_60(7 downto 0),
                Clk=>Clk,
                I2C_Busy=>XLXN_29,
                I2C_FIFO_Full=>XLXN_30,
                Reset=>Reset,
                WriteByte=>XLXN_24,
                Busy=>XLXN_59,
                I2C_FIFO_DI(7 downto 0)=>XLXN_26(7 downto 0),
                I2C_FIFO_Push=>XLXN_27,
                I2C_Go=>XLXN_28);
   
   XLXI_7 : I2C_Master
      port map (Address(7 downto 0)=>XLXN_25(7 downto 0),
                Clk=>Clk,
                FIFO_DI(7 downto 0)=>XLXN_26(7 downto 0),
                FIFO_Pop=>XLXI_7_FIFO_Pop_openSignal,
                FIFO_Push=>XLXN_27,
                Go=>XLXN_28,
                ReadCnt(3 downto 0)=>XLXI_7_ReadCnt_openSignal(3 downto 0),
                Reset=>Reset,
                Busy=>XLXN_29,
                FIFO_DO=>open,
                FIFO_Empty=>open,
                FIFO_Full=>XLXN_30,
                NACK=>LED7,
                SCL=>SCL,
                SDA=>SDA);
   
   XLXI_9 : PS2_Kbd
      port map (Clk_Sys=>Clk,
                Clk_50MHz=>Clk,
                PS2_Clk=>PS2_Clk,
                PS2_Data=>PS2_Data,
                DO(7 downto 0)=>XLXN_43(7 downto 0),
                DO_Rdy=>XLXN_46,
                E0=>XLXN_44,
                F0=>XLXN_45);
   
   XLXI_10 : Stoper
      port map (Clk=>Clk,
                DO(7 downto 0)=>XLXN_43(7 downto 0),
                DO_Rdy=>XLXN_46,
                E0=>XLXN_44,
                F0=>XLXN_45,
                First_digit(3 downto 0)=>XLXN_47(3 downto 0),
                Fourth_digit(3 downto 0)=>XLXN_50(3 downto 0),
                Second_digit(3 downto 0)=>XLXN_48(3 downto 0),
                Third_digit(3 downto 0)=>XLXN_49(3 downto 0));
   
   XLXI_14 : Selector
      port map (Busy=>XLXN_59,
                Clk=>Clk,
                First_number(3 downto 0)=>XLXN_47(3 downto 0),
                Fourth_number(3 downto 0)=>XLXN_50(3 downto 0),
                Reset=>Reset,
                Second_number(3 downto 0)=>XLXN_48(3 downto 0),
                Third_number(3 downto 0)=>XLXN_49(3 downto 0),
                Result(7 downto 0)=>XLXN_60(7 downto 0),
                WriteByte=>XLXN_24);
   
end BEHAVIORAL;


