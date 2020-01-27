--------------------------------------------------------------------------------
-- Copyright (c) 1995-2013 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 14.7
--  \   \         Application : sch2hdl
--  /   /         Filename : top.vhf
-- /___/   /\     Timestamp : 03/25/2019 09:05:05
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: sch2hdl -intstyle ise -family spartan3e -flat -suppress -vhdl C:/XilinxPrj/OLED/Test_oled/top.vhf -w C:/XilinxPrj/OLED/Test_oled/top.sch
--Design Name: top
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

entity IFD_MXILINX_top is
   generic( INIT : bit :=  '0');
   port ( C : in    std_logic; 
          D : in    std_logic; 
          Q : out   std_logic);
end IFD_MXILINX_top;

architecture BEHAVIORAL of IFD_MXILINX_top is
   attribute BOX_TYPE         : string ;
   attribute IOB              : string ;
   attribute IOSTANDARD       : string ;
   attribute IBUF_DELAY_VALUE : string ;
   attribute IFD_DELAY_VALUE  : string ;
   signal D_IN   : std_logic;
   signal XLXN_1 : std_logic;
   signal XLXN_2 : std_logic;
   component FDCE
      generic( INIT : bit :=  '0');
      port ( C   : in    std_logic; 
             CE  : in    std_logic; 
             CLR : in    std_logic; 
             D   : in    std_logic; 
             Q   : out   std_logic);
   end component;
   attribute BOX_TYPE of FDCE : component is "BLACK_BOX";
   
   component IBUF
      port ( I : in    std_logic; 
             O : out   std_logic);
   end component;
   attribute IOSTANDARD of IBUF : component is "DEFAULT";
   attribute IBUF_DELAY_VALUE of IBUF : component is "0";
   attribute IFD_DELAY_VALUE of IBUF : component is "AUTO";
   attribute BOX_TYPE of IBUF : component is "BLACK_BOX";
   
   component VCC
      port ( P : out   std_logic);
   end component;
   attribute BOX_TYPE of VCC : component is "BLACK_BOX";
   
   component GND
      port ( G : out   std_logic);
   end component;
   attribute BOX_TYPE of GND : component is "BLACK_BOX";
   
   attribute IOB of I_36_15 : label is "TRUE";
begin
   I_36_15 : FDCE
   generic map( INIT => INIT)
      port map (C=>C,
                CE=>XLXN_2,
                CLR=>XLXN_1,
                D=>D_IN,
                Q=>Q);
   
   I_36_24 : IBUF
      port map (I=>D,
                O=>D_IN);
   
   I_36_26 : VCC
      port map (P=>XLXN_2);
   
   I_36_29 : GND
      port map (G=>XLXN_1);
   
end BEHAVIORAL;



library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity top is
   port ( btn_south : in    std_logic; 
          Clk_50MHz : in    std_logic; 
          ROT_A     : in    std_logic; 
          ROT_B     : in    std_logic; 
          SW        : in    std_logic_vector (3 downto 0); 
          LED0      : out   std_logic; 
          LED7      : out   std_logic; 
          SCL       : inout std_logic; 
          SDA       : inout std_logic);
end top;

architecture BEHAVIORAL of top is
   attribute HU_SET     : string ;
   attribute BOX_TYPE   : string ;
   signal Byte                       : std_logic_vector (7 downto 0);
   signal XLXN_95                    : std_logic_vector (7 downto 0);
   signal XLXN_176                   : std_logic;
   signal XLXN_177                   : std_logic;
   signal XLXN_195                   : std_logic;
   signal XLXN_196                   : std_logic;
   signal XLXN_198                   : std_logic_vector (7 downto 0);
   signal XLXN_224                   : std_logic;
   signal XLXN_226                   : std_logic;
   signal XLXN_228                   : std_logic;
   signal XLXN_232                   : std_logic;
   signal XLXI_1_FIFO_Pop_openSignal : std_logic;
   signal XLXI_1_ReadCnt_openSignal  : std_logic_vector (3 downto 0);
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
   
   component IFD_MXILINX_top
      generic( INIT : bit :=  '0');
      port ( C : in    std_logic; 
             D : in    std_logic; 
             Q : out   std_logic);
   end component;
   
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
   
   component BUF
      port ( I : in    std_logic; 
             O : out   std_logic);
   end component;
   attribute BOX_TYPE of BUF : component is "BLACK_BOX";
   
   component RotaryEnc
      port ( ROT_A : in    std_logic; 
             ROT_B : in    std_logic; 
             RotL  : out   std_logic; 
             RotR  : out   std_logic; 
             Clk   : in    std_logic);
   end component;
   
   component OR2
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of OR2 : component is "BLACK_BOX";
   
   attribute HU_SET of XLXI_3 : label is "XLXI_3_0";
begin
   XLXN_95(7 downto 0) <= x"78";
   XLXI_1 : I2C_Master
      port map (Address(7 downto 0)=>XLXN_95(7 downto 0),
                Clk=>Clk_50MHz,
                FIFO_DI(7 downto 0)=>XLXN_198(7 downto 0),
                FIFO_Pop=>XLXI_1_FIFO_Pop_openSignal,
                FIFO_Push=>XLXN_196,
                Go=>XLXN_195,
                ReadCnt(3 downto 0)=>XLXI_1_ReadCnt_openSignal(3 downto 0),
                Reset=>XLXN_224,
                Busy=>XLXN_232,
                FIFO_DO=>open,
                FIFO_Empty=>open,
                FIFO_Full=>XLXN_228,
                NACK=>LED7,
                SCL=>SCL,
                SDA=>SDA);
   
   XLXI_3 : IFD_MXILINX_top
      port map (C=>Clk_50MHz,
                D=>btn_south,
                Q=>XLXN_224);
   
   XLXI_8 : OLED_Ctrl
      port map (Byte(7 downto 0)=>Byte(7 downto 0),
                Clk=>Clk_50MHz,
                I2C_Busy=>XLXN_232,
                I2C_FIFO_Full=>XLXN_228,
                Reset=>XLXN_224,
                WriteByte=>XLXN_226,
                Busy=>LED0,
                I2C_FIFO_DI(7 downto 0)=>XLXN_198(7 downto 0),
                I2C_FIFO_Push=>XLXN_196,
                I2C_Go=>XLXN_195);
   
   XLXI_9_0 : BUF
      port map (I=>SW(0),
                O=>Byte(4));
   
   XLXI_9_1 : BUF
      port map (I=>SW(1),
                O=>Byte(5));
   
   XLXI_9_2 : BUF
      port map (I=>SW(2),
                O=>Byte(6));
   
   XLXI_9_3 : BUF
      port map (I=>SW(3),
                O=>Byte(7));
   
   XLXI_10_0 : BUF
      port map (I=>SW(0),
                O=>Byte(0));
   
   XLXI_10_1 : BUF
      port map (I=>SW(1),
                O=>Byte(1));
   
   XLXI_10_2 : BUF
      port map (I=>SW(2),
                O=>Byte(2));
   
   XLXI_10_3 : BUF
      port map (I=>SW(3),
                O=>Byte(3));
   
   XLXI_24 : RotaryEnc
      port map (Clk=>Clk_50MHz,
                ROT_A=>ROT_A,
                ROT_B=>ROT_B,
                RotL=>XLXN_177,
                RotR=>XLXN_176);
   
   XLXI_25 : OR2
      port map (I0=>XLXN_176,
                I1=>XLXN_177,
                O=>XLXN_226);
   
end BEHAVIORAL;


