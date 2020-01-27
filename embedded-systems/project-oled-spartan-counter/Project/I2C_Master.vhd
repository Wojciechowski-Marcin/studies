--------------------------------------------------------------------------------
-- Copyright (c) 1995-2013 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /    Vendor: Xilinx
-- \   \   \/     Version: P.20131013
--  \   \         Application: netgen
--  /   /         Filename: i2c_master.vhd
-- /___/   /\     Timestamp: Wed Mar 02 21:13:40 2016
-- \   \  /  \ 
--  \___\/\___\
--             
-- Command	: -ofmt vhdl i2c_master.ngc 
-- Device	: xc3s500e-4-fg320
-- Input file	: i2c_master.ngc
-- Output file	: i2c_master.vhd
-- # of Entities	: 1
-- Design Name	: I2C_Master
-- Xilinx	: C:\Xilinx\14.7\ISE_DS\ISE\
--             
-- Purpose:    
--     This VHDL netlist is a verification model and uses simulation 
--     primitives which may not represent the true implementation of the 
--     device, however the netlist is functionally correct and should not 
--     be modified.
--             
-- Reference:  
--     Command Line Tools User Guide, Chapter 23
--     Synthesis and Simulation Design Guide, Chapter 6
--             
--------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;

entity I2C_Master is
  port (
    SDA : inout STD_LOGIC; 
    SCL : inout STD_LOGIC; 
    Clk : in STD_LOGIC := 'X'; 
    NACK : out STD_LOGIC; 
    FIFO_Pop : in STD_LOGIC := 'X'; 
    Reset : in STD_LOGIC := 'X'; 
    Go : in STD_LOGIC := 'X'; 
    Busy : out STD_LOGIC; 
    FIFO_Empty : out STD_LOGIC; 
    FIFO_Push : in STD_LOGIC := 'X'; 
    FIFO_Full : out STD_LOGIC; 
    FIFO_DO : out STD_LOGIC_VECTOR ( 7 downto 0 ); 
    Address : in STD_LOGIC_VECTOR ( 7 downto 0 ); 
    FIFO_DI : in STD_LOGIC_VECTOR ( 7 downto 0 ); 
    ReadCnt : in STD_LOGIC_VECTOR ( 3 downto 0 ) 
  );
end I2C_Master;

architecture STRUCTURE of I2C_Master is
  signal Mcount_cntBytes : STD_LOGIC; 
  signal Mcount_cntBytes1 : STD_LOGIC; 
  signal Mcount_cntBytes2 : STD_LOGIC; 
  signal Mcount_cntBytes3 : STD_LOGIC; 
  signal Mcount_cntSCL_cy_1_rt_43 : STD_LOGIC; 
  signal Mcount_cntSCL_cy_2_rt_45 : STD_LOGIC; 
  signal Mcount_cntSCL_cy_3_rt_47 : STD_LOGIC; 
  signal Mcount_cntSCL_cy_4_rt_49 : STD_LOGIC; 
  signal Mcount_cntSCL_cy_5_rt_51 : STD_LOGIC; 
  signal Mcount_cntSCL_cy_6_rt_53 : STD_LOGIC; 
  signal Mcount_cntSCL_xor_7_rt_55 : STD_LOGIC; 
  signal N0 : STD_LOGIC; 
  signal N01 : STD_LOGIC; 
  signal N1 : STD_LOGIC; 
  signal N107 : STD_LOGIC; 
  signal N109 : STD_LOGIC; 
  signal N111 : STD_LOGIC; 
  signal N1111 : STD_LOGIC; 
  signal N112 : STD_LOGIC; 
  signal N113 : STD_LOGIC; 
  signal N114 : STD_LOGIC; 
  signal N115 : STD_LOGIC; 
  signal N116 : STD_LOGIC; 
  signal N117 : STD_LOGIC; 
  signal N118 : STD_LOGIC; 
  signal N12 : STD_LOGIC; 
  signal N14 : STD_LOGIC; 
  signal N15 : STD_LOGIC; 
  signal N55 : STD_LOGIC; 
  signal N57 : STD_LOGIC; 
  signal N59 : STD_LOGIC; 
  signal N61 : STD_LOGIC; 
  signal N62 : STD_LOGIC; 
  signal N64 : STD_LOGIC; 
  signal N65 : STD_LOGIC; 
  signal N69 : STD_LOGIC; 
  signal N71 : STD_LOGIC; 
  signal N73 : STD_LOGIC; 
  signal N75 : STD_LOGIC; 
  signal N77 : STD_LOGIC; 
  signal N79 : STD_LOGIC; 
  signal N80 : STD_LOGIC; 
  signal N82 : STD_LOGIC; 
  signal N84 : STD_LOGIC; 
  signal N85 : STD_LOGIC; 
  signal N87 : STD_LOGIC; 
  signal N90 : STD_LOGIC; 
  signal N92 : STD_LOGIC; 
  signal NACK_and0000 : STD_LOGIC; 
  signal NACK_and00007_95 : STD_LOGIC; 
  signal RdNotWr_96 : STD_LOGIC; 
  signal RdNotWr_and0000 : STD_LOGIC; 
  signal Result_0_1 : STD_LOGIC; 
  signal Result_1_1 : STD_LOGIC; 
  signal Result_2_1 : STD_LOGIC; 
  signal Result_3_1 : STD_LOGIC; 
  signal SCLout_116 : STD_LOGIC; 
  signal SCLout_mux000017_117 : STD_LOGIC; 
  signal SCLout_mux000021_118 : STD_LOGIC; 
  signal SCLout_mux000061_119 : STD_LOGIC; 
  signal SCLout_mux000063_120 : STD_LOGIC; 
  signal SCLout_mux000072 : STD_LOGIC; 
  signal SCLout_mux00008_122 : STD_LOGIC; 
  signal SDAin : STD_LOGIC; 
  signal SDAout_125 : STD_LOGIC; 
  signal SDAout_mux0003107_126 : STD_LOGIC; 
  signal SDAout_mux0003112_127 : STD_LOGIC; 
  signal SDAout_mux0003139_128 : STD_LOGIC; 
  signal SDAout_mux0003157_129 : STD_LOGIC; 
  signal SDAout_mux000316_130 : STD_LOGIC; 
  signal SDAout_mux0003180_131 : STD_LOGIC; 
  signal SDAout_mux0003204 : STD_LOGIC; 
  signal SDAout_mux000325_133 : STD_LOGIC; 
  signal SDAout_mux000337_134 : STD_LOGIC; 
  signal SDAout_mux0003412_135 : STD_LOGIC; 
  signal SDAout_mux0003425_136 : STD_LOGIC; 
  signal SDAout_mux0003431_137 : STD_LOGIC; 
  signal SDAout_mux000358_138 : STD_LOGIC; 
  signal SDAout_mux00038_139 : STD_LOGIC; 
  signal SDAout_mux000388_140 : STD_LOGIC; 
  signal SDAout_mux000393_141 : STD_LOGIC; 
  signal cntBits_or0000 : STD_LOGIC; 
  signal cntBytes_not0001_151 : STD_LOGIC; 
  signal cntSCL_or0000 : STD_LOGIC; 
  signal i_FIFO_DoPop_161 : STD_LOGIC; 
  signal i_FIFO_DoPush : STD_LOGIC; 
  signal i_FIFO_DoPush0_163 : STD_LOGIC; 
  signal i_FIFO_DoPush13_164 : STD_LOGIC; 
  signal i_FIFO_Result_0_1 : STD_LOGIC; 
  signal i_FIFO_Result_1_1_168 : STD_LOGIC; 
  signal i_FIFO_Result_2_1_170 : STD_LOGIC; 
  signal i_FIFO_Result_3_1 : STD_LOGIC; 
  signal NlwRenamedSig_OI_i_FIFO_iEmpty : STD_LOGIC; 
  signal i_FIFO_iEmpty_and0000 : STD_LOGIC; 
  signal i_FIFO_iEmpty_and000058_183 : STD_LOGIC; 
  signal i_FIFO_iEmpty_and000067_184 : STD_LOGIC; 
  signal i_FIFO_iEmpty_or0000 : STD_LOGIC; 
  signal NlwRenamedSig_OI_i_FIFO_iFull : STD_LOGIC; 
  signal i_FIFO_iFull_and0000 : STD_LOGIC; 
  signal i_FIFO_iFull_and000048_188 : STD_LOGIC; 
  signal i_FIFO_iFull_and000071_189 : STD_LOGIC; 
  signal i_FIFO_iFull_and000076_190 : STD_LOGIC; 
  signal i_FIFO_iFull_or0000 : STD_LOGIC; 
  signal sclEnd : STD_LOGIC; 
  signal sregIn_and0000 : STD_LOGIC; 
  signal sregOut_mux0000_1_1_212 : STD_LOGIC; 
  signal sregOut_mux0000_1_2_213 : STD_LOGIC; 
  signal sregOut_mux0000_2_1_215 : STD_LOGIC; 
  signal sregOut_mux0000_2_2_216 : STD_LOGIC; 
  signal sregOut_mux0000_3_1_218 : STD_LOGIC; 
  signal sregOut_mux0000_3_2_219 : STD_LOGIC; 
  signal sregOut_mux0000_4_1_221 : STD_LOGIC; 
  signal sregOut_mux0000_4_2_222 : STD_LOGIC; 
  signal sregOut_mux0000_5_1_224 : STD_LOGIC; 
  signal sregOut_mux0000_5_2_225 : STD_LOGIC; 
  signal sregOut_mux0000_6_1_227 : STD_LOGIC; 
  signal sregOut_mux0000_6_2_228 : STD_LOGIC; 
  signal sregOut_mux0000_7_1_230 : STD_LOGIC; 
  signal sregOut_mux0000_7_2_231 : STD_LOGIC; 
  signal sregOut_not0001_232 : STD_LOGIC; 
  signal state_FSM_FFd1_233 : STD_LOGIC; 
  signal state_FSM_FFd1_In_234 : STD_LOGIC; 
  signal state_FSM_FFd2_235 : STD_LOGIC; 
  signal state_FSM_FFd2_In12_236 : STD_LOGIC; 
  signal state_FSM_FFd2_In2_237 : STD_LOGIC; 
  signal state_FSM_FFd2_In26_238 : STD_LOGIC; 
  signal state_FSM_FFd3_239 : STD_LOGIC; 
  signal state_FSM_FFd3_In_240 : STD_LOGIC; 
  signal state_FSM_FFd4_241 : STD_LOGIC; 
  signal state_FSM_FFd4_In : STD_LOGIC; 
  signal state_FSM_FFd5_243 : STD_LOGIC; 
  signal state_FSM_FFd5_In1_244 : STD_LOGIC; 
  signal state_FSM_FFd6_245 : STD_LOGIC; 
  signal NLW_IOB2_O_UNCONNECTED : STD_LOGIC; 
  signal NLW_i_FIFO_Mram_RAM8_SPO_UNCONNECTED : STD_LOGIC; 
  signal NLW_i_FIFO_Mram_RAM7_SPO_UNCONNECTED : STD_LOGIC; 
  signal NLW_i_FIFO_Mram_RAM6_SPO_UNCONNECTED : STD_LOGIC; 
  signal NLW_i_FIFO_Mram_RAM5_SPO_UNCONNECTED : STD_LOGIC; 
  signal NLW_i_FIFO_Mram_RAM4_SPO_UNCONNECTED : STD_LOGIC; 
  signal NLW_i_FIFO_Mram_RAM3_SPO_UNCONNECTED : STD_LOGIC; 
  signal NLW_i_FIFO_Mram_RAM2_SPO_UNCONNECTED : STD_LOGIC; 
  signal NLW_i_FIFO_Mram_RAM1_SPO_UNCONNECTED : STD_LOGIC; 
  signal DI : STD_LOGIC_VECTOR ( 7 downto 0 ); 
  signal NlwRenamedSig_OI_FIFO_DO : STD_LOGIC_VECTOR ( 7 downto 0 ); 
  signal Mcount_cntSCL_cy : STD_LOGIC_VECTOR ( 6 downto 0 ); 
  signal Mcount_cntSCL_lut : STD_LOGIC_VECTOR ( 0 downto 0 ); 
  signal Result : STD_LOGIC_VECTOR ( 7 downto 0 ); 
  signal cntBits : STD_LOGIC_VECTOR ( 3 downto 0 ); 
  signal cntBytes : STD_LOGIC_VECTOR ( 3 downto 0 ); 
  signal cntSCL : STD_LOGIC_VECTOR ( 7 downto 0 ); 
  signal i_FIFO_Result : STD_LOGIC_VECTOR ( 3 downto 0 ); 
  signal i_FIFO_addrRd : STD_LOGIC_VECTOR ( 3 downto 0 ); 
  signal i_FIFO_addrWr : STD_LOGIC_VECTOR ( 3 downto 0 ); 
  signal sregIn : STD_LOGIC_VECTOR ( 7 downto 0 ); 
  signal sregOut : STD_LOGIC_VECTOR ( 7 downto 0 ); 
  signal sregOut_mux0000 : STD_LOGIC_VECTOR ( 7 downto 0 ); 
begin
  FIFO_Empty <= NlwRenamedSig_OI_i_FIFO_iEmpty;
  FIFO_Full <= NlwRenamedSig_OI_i_FIFO_iFull;
  FIFO_DO(7) <= NlwRenamedSig_OI_FIFO_DO(7);
  FIFO_DO(6) <= NlwRenamedSig_OI_FIFO_DO(6);
  FIFO_DO(5) <= NlwRenamedSig_OI_FIFO_DO(5);
  FIFO_DO(4) <= NlwRenamedSig_OI_FIFO_DO(4);
  FIFO_DO(3) <= NlwRenamedSig_OI_FIFO_DO(3);
  FIFO_DO(2) <= NlwRenamedSig_OI_FIFO_DO(2);
  FIFO_DO(1) <= NlwRenamedSig_OI_FIFO_DO(1);
  FIFO_DO(0) <= NlwRenamedSig_OI_FIFO_DO(0);
  XST_GND : GND
    port map (
      G => N0
    );
  XST_VCC : VCC
    port map (
      P => N1
    );
  RdNotWr : FDE
    port map (
      C => Clk,
      CE => RdNotWr_and0000,
      D => Address(0),
      Q => RdNotWr_96
    );
  sregOut_0 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => Clk,
      CE => sregOut_not0001_232,
      D => sregOut_mux0000(0),
      Q => sregOut(0)
    );
  sregOut_1 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => Clk,
      CE => sregOut_not0001_232,
      D => sregOut_mux0000(1),
      Q => sregOut(1)
    );
  sregOut_2 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => Clk,
      CE => sregOut_not0001_232,
      D => sregOut_mux0000(2),
      Q => sregOut(2)
    );
  sregOut_3 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => Clk,
      CE => sregOut_not0001_232,
      D => sregOut_mux0000(3),
      Q => sregOut(3)
    );
  sregOut_4 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => Clk,
      CE => sregOut_not0001_232,
      D => sregOut_mux0000(4),
      Q => sregOut(4)
    );
  sregOut_5 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => Clk,
      CE => sregOut_not0001_232,
      D => sregOut_mux0000(5),
      Q => sregOut(5)
    );
  sregOut_6 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => Clk,
      CE => sregOut_not0001_232,
      D => sregOut_mux0000(6),
      Q => sregOut(6)
    );
  sregOut_7 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => Clk,
      CE => sregOut_not0001_232,
      D => sregOut_mux0000(7),
      Q => sregOut(7)
    );
  NACK_12 : FDRE
    port map (
      C => Clk,
      CE => NACK_and0000,
      D => N1,
      R => state_FSM_FFd6_245,
      Q => NACK
    );
  sregIn_0 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => Clk,
      CE => sregIn_and0000,
      D => SDAin,
      Q => sregIn(0)
    );
  sregIn_1 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => Clk,
      CE => sregIn_and0000,
      D => sregIn(0),
      Q => sregIn(1)
    );
  sregIn_2 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => Clk,
      CE => sregIn_and0000,
      D => sregIn(1),
      Q => sregIn(2)
    );
  sregIn_3 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => Clk,
      CE => sregIn_and0000,
      D => sregIn(2),
      Q => sregIn(3)
    );
  sregIn_4 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => Clk,
      CE => sregIn_and0000,
      D => sregIn(3),
      Q => sregIn(4)
    );
  sregIn_5 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => Clk,
      CE => sregIn_and0000,
      D => sregIn(4),
      Q => sregIn(5)
    );
  sregIn_6 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => Clk,
      CE => sregIn_and0000,
      D => sregIn(5),
      Q => sregIn(6)
    );
  sregIn_7 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => Clk,
      CE => sregIn_and0000,
      D => sregIn(6),
      Q => sregIn(7)
    );
  cntBits_0 : FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => Clk,
      CE => sclEnd,
      D => Result(0),
      R => cntBits_or0000,
      Q => cntBits(0)
    );
  cntBits_1 : FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => Clk,
      CE => sclEnd,
      D => Result(1),
      R => cntBits_or0000,
      Q => cntBits(1)
    );
  cntBits_2 : FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => Clk,
      CE => sclEnd,
      D => Result(2),
      R => cntBits_or0000,
      Q => cntBits(2)
    );
  cntBits_3 : FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => Clk,
      CE => sclEnd,
      D => Result(3),
      R => cntBits_or0000,
      Q => cntBits(3)
    );
  cntSCL_0 : FDR
    generic map(
      INIT => '0'
    )
    port map (
      C => Clk,
      D => Result_0_1,
      R => cntSCL_or0000,
      Q => cntSCL(0)
    );
  cntSCL_1 : FDR
    generic map(
      INIT => '0'
    )
    port map (
      C => Clk,
      D => Result_1_1,
      R => cntSCL_or0000,
      Q => cntSCL(1)
    );
  cntSCL_2 : FDR
    generic map(
      INIT => '0'
    )
    port map (
      C => Clk,
      D => Result_2_1,
      R => cntSCL_or0000,
      Q => cntSCL(2)
    );
  cntSCL_3 : FDR
    generic map(
      INIT => '0'
    )
    port map (
      C => Clk,
      D => Result_3_1,
      R => cntSCL_or0000,
      Q => cntSCL(3)
    );
  cntSCL_4 : FDR
    generic map(
      INIT => '0'
    )
    port map (
      C => Clk,
      D => Result(4),
      R => cntSCL_or0000,
      Q => cntSCL(4)
    );
  cntSCL_5 : FDR
    generic map(
      INIT => '0'
    )
    port map (
      C => Clk,
      D => Result(5),
      R => cntSCL_or0000,
      Q => cntSCL(5)
    );
  cntSCL_6 : FDR
    generic map(
      INIT => '0'
    )
    port map (
      C => Clk,
      D => Result(6),
      R => cntSCL_or0000,
      Q => cntSCL(6)
    );
  cntSCL_7 : FDR
    generic map(
      INIT => '0'
    )
    port map (
      C => Clk,
      D => Result(7),
      R => cntSCL_or0000,
      Q => cntSCL(7)
    );
  cntBytes_0 : FDE
    port map (
      C => Clk,
      CE => cntBytes_not0001_151,
      D => Mcount_cntBytes,
      Q => cntBytes(0)
    );
  cntBytes_1 : FDE
    port map (
      C => Clk,
      CE => cntBytes_not0001_151,
      D => Mcount_cntBytes1,
      Q => cntBytes(1)
    );
  cntBytes_2 : FDE
    port map (
      C => Clk,
      CE => cntBytes_not0001_151,
      D => Mcount_cntBytes2,
      Q => cntBytes(2)
    );
  cntBytes_3 : FDE
    port map (
      C => Clk,
      CE => cntBytes_not0001_151,
      D => Mcount_cntBytes3,
      Q => cntBytes(3)
    );
  Mcount_cntSCL_cy_0_Q : MUXCY
    port map (
      CI => N0,
      DI => N1,
      S => Mcount_cntSCL_lut(0),
      O => Mcount_cntSCL_cy(0)
    );
  Mcount_cntSCL_xor_0_Q : XORCY
    port map (
      CI => N0,
      LI => Mcount_cntSCL_lut(0),
      O => Result_0_1
    );
  Mcount_cntSCL_cy_1_Q : MUXCY
    port map (
      CI => Mcount_cntSCL_cy(0),
      DI => N0,
      S => Mcount_cntSCL_cy_1_rt_43,
      O => Mcount_cntSCL_cy(1)
    );
  Mcount_cntSCL_xor_1_Q : XORCY
    port map (
      CI => Mcount_cntSCL_cy(0),
      LI => Mcount_cntSCL_cy_1_rt_43,
      O => Result_1_1
    );
  Mcount_cntSCL_cy_2_Q : MUXCY
    port map (
      CI => Mcount_cntSCL_cy(1),
      DI => N0,
      S => Mcount_cntSCL_cy_2_rt_45,
      O => Mcount_cntSCL_cy(2)
    );
  Mcount_cntSCL_xor_2_Q : XORCY
    port map (
      CI => Mcount_cntSCL_cy(1),
      LI => Mcount_cntSCL_cy_2_rt_45,
      O => Result_2_1
    );
  Mcount_cntSCL_cy_3_Q : MUXCY
    port map (
      CI => Mcount_cntSCL_cy(2),
      DI => N0,
      S => Mcount_cntSCL_cy_3_rt_47,
      O => Mcount_cntSCL_cy(3)
    );
  Mcount_cntSCL_xor_3_Q : XORCY
    port map (
      CI => Mcount_cntSCL_cy(2),
      LI => Mcount_cntSCL_cy_3_rt_47,
      O => Result_3_1
    );
  Mcount_cntSCL_cy_4_Q : MUXCY
    port map (
      CI => Mcount_cntSCL_cy(3),
      DI => N0,
      S => Mcount_cntSCL_cy_4_rt_49,
      O => Mcount_cntSCL_cy(4)
    );
  Mcount_cntSCL_xor_4_Q : XORCY
    port map (
      CI => Mcount_cntSCL_cy(3),
      LI => Mcount_cntSCL_cy_4_rt_49,
      O => Result(4)
    );
  Mcount_cntSCL_cy_5_Q : MUXCY
    port map (
      CI => Mcount_cntSCL_cy(4),
      DI => N0,
      S => Mcount_cntSCL_cy_5_rt_51,
      O => Mcount_cntSCL_cy(5)
    );
  Mcount_cntSCL_xor_5_Q : XORCY
    port map (
      CI => Mcount_cntSCL_cy(4),
      LI => Mcount_cntSCL_cy_5_rt_51,
      O => Result(5)
    );
  Mcount_cntSCL_cy_6_Q : MUXCY
    port map (
      CI => Mcount_cntSCL_cy(5),
      DI => N0,
      S => Mcount_cntSCL_cy_6_rt_53,
      O => Mcount_cntSCL_cy(6)
    );
  Mcount_cntSCL_xor_6_Q : XORCY
    port map (
      CI => Mcount_cntSCL_cy(5),
      LI => Mcount_cntSCL_cy_6_rt_53,
      O => Result(6)
    );
  Mcount_cntSCL_xor_7_Q : XORCY
    port map (
      CI => Mcount_cntSCL_cy(6),
      LI => Mcount_cntSCL_xor_7_rt_55,
      O => Result(7)
    );
  IOB1 : IOBUF
    generic map(
      CAPACITANCE => "DONT_CARE",
      DRIVE => 12,
      IBUF_DELAY_VALUE => "0",
      IBUF_LOW_PWR => TRUE,
      IFD_DELAY_VALUE => "AUTO",
      IOSTANDARD => "DEFAULT",
      SLEW => "20"
    )
    port map (
      I => N0,
      T => SDAout_125,
      O => SDAin,
      IO => SDA
    );
  IOB2 : IOBUF
    generic map(
      CAPACITANCE => "DONT_CARE",
      DRIVE => 12,
      IBUF_DELAY_VALUE => "0",
      IBUF_LOW_PWR => TRUE,
      IFD_DELAY_VALUE => "AUTO",
      IOSTANDARD => "DEFAULT",
      SLEW => "20"
    )
    port map (
      I => N0,
      T => SCLout_116,
      O => NLW_IOB2_O_UNCONNECTED,
      IO => SCL
    );
  state_FSM_FFd3 : FDR
    generic map(
      INIT => '0'
    )
    port map (
      C => Clk,
      D => state_FSM_FFd3_In_240,
      R => Reset,
      Q => state_FSM_FFd3_239
    );
  state_FSM_FFd1 : FDR
    generic map(
      INIT => '0'
    )
    port map (
      C => Clk,
      D => state_FSM_FFd1_In_234,
      R => Reset,
      Q => state_FSM_FFd1_233
    );
  state_FSM_FFd6 : FDS
    generic map(
      INIT => '1'
    )
    port map (
      C => Clk,
      D => N0,
      S => Reset,
      Q => state_FSM_FFd6_245
    );
  state_FSM_FFd4 : FDR
    generic map(
      INIT => '0'
    )
    port map (
      C => Clk,
      D => state_FSM_FFd4_In,
      R => Reset,
      Q => state_FSM_FFd4_241
    );
  i_FIFO_addrWr_3 : FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => Clk,
      CE => i_FIFO_DoPush,
      D => i_FIFO_Result_3_1,
      R => Reset,
      Q => i_FIFO_addrWr(3)
    );
  i_FIFO_addrWr_2 : FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => Clk,
      CE => i_FIFO_DoPush,
      D => i_FIFO_Result_2_1_170,
      R => Reset,
      Q => i_FIFO_addrWr(2)
    );
  i_FIFO_addrWr_1 : FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => Clk,
      CE => i_FIFO_DoPush,
      D => i_FIFO_Result_1_1_168,
      R => Reset,
      Q => i_FIFO_addrWr(1)
    );
  i_FIFO_addrWr_0 : FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => Clk,
      CE => i_FIFO_DoPush,
      D => i_FIFO_Result_0_1,
      R => Reset,
      Q => i_FIFO_addrWr(0)
    );
  i_FIFO_addrRd_3 : FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => Clk,
      CE => i_FIFO_DoPop_161,
      D => i_FIFO_Result(3),
      R => Reset,
      Q => i_FIFO_addrRd(3)
    );
  i_FIFO_addrRd_2 : FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => Clk,
      CE => i_FIFO_DoPop_161,
      D => i_FIFO_Result(2),
      R => Reset,
      Q => i_FIFO_addrRd(2)
    );
  i_FIFO_addrRd_1 : FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => Clk,
      CE => i_FIFO_DoPop_161,
      D => i_FIFO_Result(1),
      R => Reset,
      Q => i_FIFO_addrRd(1)
    );
  i_FIFO_addrRd_0 : FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => Clk,
      CE => i_FIFO_DoPop_161,
      D => i_FIFO_Result(0),
      R => Reset,
      Q => i_FIFO_addrRd(0)
    );
  i_FIFO_Mram_RAM8 : RAM16X1D
    port map (
      A0 => i_FIFO_addrWr(0),
      A1 => i_FIFO_addrWr(1),
      A2 => i_FIFO_addrWr(2),
      A3 => i_FIFO_addrWr(3),
      D => DI(7),
      DPRA0 => i_FIFO_addrRd(0),
      DPRA1 => i_FIFO_addrRd(1),
      DPRA2 => i_FIFO_addrRd(2),
      DPRA3 => i_FIFO_addrRd(3),
      WCLK => Clk,
      WE => i_FIFO_DoPush,
      SPO => NLW_i_FIFO_Mram_RAM8_SPO_UNCONNECTED,
      DPO => NlwRenamedSig_OI_FIFO_DO(7)
    );
  i_FIFO_Mram_RAM7 : RAM16X1D
    port map (
      A0 => i_FIFO_addrWr(0),
      A1 => i_FIFO_addrWr(1),
      A2 => i_FIFO_addrWr(2),
      A3 => i_FIFO_addrWr(3),
      D => DI(6),
      DPRA0 => i_FIFO_addrRd(0),
      DPRA1 => i_FIFO_addrRd(1),
      DPRA2 => i_FIFO_addrRd(2),
      DPRA3 => i_FIFO_addrRd(3),
      WCLK => Clk,
      WE => i_FIFO_DoPush,
      SPO => NLW_i_FIFO_Mram_RAM7_SPO_UNCONNECTED,
      DPO => NlwRenamedSig_OI_FIFO_DO(6)
    );
  i_FIFO_Mram_RAM6 : RAM16X1D
    port map (
      A0 => i_FIFO_addrWr(0),
      A1 => i_FIFO_addrWr(1),
      A2 => i_FIFO_addrWr(2),
      A3 => i_FIFO_addrWr(3),
      D => DI(5),
      DPRA0 => i_FIFO_addrRd(0),
      DPRA1 => i_FIFO_addrRd(1),
      DPRA2 => i_FIFO_addrRd(2),
      DPRA3 => i_FIFO_addrRd(3),
      WCLK => Clk,
      WE => i_FIFO_DoPush,
      SPO => NLW_i_FIFO_Mram_RAM6_SPO_UNCONNECTED,
      DPO => NlwRenamedSig_OI_FIFO_DO(5)
    );
  i_FIFO_Mram_RAM5 : RAM16X1D
    port map (
      A0 => i_FIFO_addrWr(0),
      A1 => i_FIFO_addrWr(1),
      A2 => i_FIFO_addrWr(2),
      A3 => i_FIFO_addrWr(3),
      D => DI(4),
      DPRA0 => i_FIFO_addrRd(0),
      DPRA1 => i_FIFO_addrRd(1),
      DPRA2 => i_FIFO_addrRd(2),
      DPRA3 => i_FIFO_addrRd(3),
      WCLK => Clk,
      WE => i_FIFO_DoPush,
      SPO => NLW_i_FIFO_Mram_RAM5_SPO_UNCONNECTED,
      DPO => NlwRenamedSig_OI_FIFO_DO(4)
    );
  i_FIFO_Mram_RAM4 : RAM16X1D
    port map (
      A0 => i_FIFO_addrWr(0),
      A1 => i_FIFO_addrWr(1),
      A2 => i_FIFO_addrWr(2),
      A3 => i_FIFO_addrWr(3),
      D => DI(3),
      DPRA0 => i_FIFO_addrRd(0),
      DPRA1 => i_FIFO_addrRd(1),
      DPRA2 => i_FIFO_addrRd(2),
      DPRA3 => i_FIFO_addrRd(3),
      WCLK => Clk,
      WE => i_FIFO_DoPush,
      SPO => NLW_i_FIFO_Mram_RAM4_SPO_UNCONNECTED,
      DPO => NlwRenamedSig_OI_FIFO_DO(3)
    );
  i_FIFO_Mram_RAM3 : RAM16X1D
    port map (
      A0 => i_FIFO_addrWr(0),
      A1 => i_FIFO_addrWr(1),
      A2 => i_FIFO_addrWr(2),
      A3 => i_FIFO_addrWr(3),
      D => DI(2),
      DPRA0 => i_FIFO_addrRd(0),
      DPRA1 => i_FIFO_addrRd(1),
      DPRA2 => i_FIFO_addrRd(2),
      DPRA3 => i_FIFO_addrRd(3),
      WCLK => Clk,
      WE => i_FIFO_DoPush,
      SPO => NLW_i_FIFO_Mram_RAM3_SPO_UNCONNECTED,
      DPO => NlwRenamedSig_OI_FIFO_DO(2)
    );
  i_FIFO_Mram_RAM2 : RAM16X1D
    port map (
      A0 => i_FIFO_addrWr(0),
      A1 => i_FIFO_addrWr(1),
      A2 => i_FIFO_addrWr(2),
      A3 => i_FIFO_addrWr(3),
      D => DI(1),
      DPRA0 => i_FIFO_addrRd(0),
      DPRA1 => i_FIFO_addrRd(1),
      DPRA2 => i_FIFO_addrRd(2),
      DPRA3 => i_FIFO_addrRd(3),
      WCLK => Clk,
      WE => i_FIFO_DoPush,
      SPO => NLW_i_FIFO_Mram_RAM2_SPO_UNCONNECTED,
      DPO => NlwRenamedSig_OI_FIFO_DO(1)
    );
  i_FIFO_Mram_RAM1 : RAM16X1D
    port map (
      A0 => i_FIFO_addrWr(0),
      A1 => i_FIFO_addrWr(1),
      A2 => i_FIFO_addrWr(2),
      A3 => i_FIFO_addrWr(3),
      D => DI(0),
      DPRA0 => i_FIFO_addrRd(0),
      DPRA1 => i_FIFO_addrRd(1),
      DPRA2 => i_FIFO_addrRd(2),
      DPRA3 => i_FIFO_addrRd(3),
      WCLK => Clk,
      WE => i_FIFO_DoPush,
      SPO => NLW_i_FIFO_Mram_RAM1_SPO_UNCONNECTED,
      DPO => NlwRenamedSig_OI_FIFO_DO(0)
    );
  i_FIFO_iFull : FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => Clk,
      CE => i_FIFO_iFull_and0000,
      D => N1,
      R => i_FIFO_iFull_or0000,
      Q => NlwRenamedSig_OI_i_FIFO_iFull
    );
  i_FIFO_iEmpty : FDRE
    generic map(
      INIT => '1'
    )
    port map (
      C => Clk,
      CE => i_FIFO_iEmpty_and0000,
      D => N1,
      R => i_FIFO_iEmpty_or0000,
      Q => NlwRenamedSig_OI_i_FIFO_iEmpty
    );
  Mcount_cntBits_xor_1_11 : LUT2
    generic map(
      INIT => X"6"
    )
    port map (
      I0 => cntBits(1),
      I1 => cntBits(0),
      O => Result(1)
    );
  Mcount_cntBits_xor_2_11 : LUT3
    generic map(
      INIT => X"6A"
    )
    port map (
      I0 => cntBits(2),
      I1 => cntBits(1),
      I2 => cntBits(0),
      O => Result(2)
    );
  Mcount_cntBits_xor_3_11 : LUT4
    generic map(
      INIT => X"6AAA"
    )
    port map (
      I0 => cntBits(3),
      I1 => cntBits(1),
      I2 => cntBits(0),
      I3 => cntBits(2),
      O => Result(3)
    );
  RdNotWr_and00001 : LUT2
    generic map(
      INIT => X"8"
    )
    port map (
      I0 => state_FSM_FFd5_243,
      I1 => Go,
      O => RdNotWr_and0000
    );
  Mcount_cntBytes_xor_1_11 : LUT4
    generic map(
      INIT => X"EB41"
    )
    port map (
      I0 => RdNotWr_and0000,
      I1 => cntBytes(0),
      I2 => cntBytes(1),
      I3 => ReadCnt(1),
      O => Mcount_cntBytes1
    );
  NACK_and00007 : LUT4
    generic map(
      INIT => X"0080"
    )
    port map (
      I0 => state_FSM_FFd3_239,
      I1 => cntSCL(6),
      I2 => SDAin,
      I3 => cntSCL(1),
      O => NACK_and00007_95
    );
  sregOut_mux0000_0_1 : LUT4
    generic map(
      INIT => X"FE54"
    )
    port map (
      I0 => RdNotWr_and0000,
      I1 => NlwRenamedSig_OI_FIFO_DO(0),
      I2 => N01,
      I3 => Address(0),
      O => sregOut_mux0000(0)
    );
  SCLout_mux00008 : LUT4
    generic map(
      INIT => X"FFBF"
    )
    port map (
      I0 => state_FSM_FFd2_235,
      I1 => cntSCL(2),
      I2 => cntSCL(0),
      I3 => cntSCL(7),
      O => SCLout_mux00008_122
    );
  SCLout_mux000017 : LUT2
    generic map(
      INIT => X"7"
    )
    port map (
      I0 => cntSCL(4),
      I1 => cntSCL(3),
      O => SCLout_mux000017_117
    );
  SCLout_mux000021 : LUT4
    generic map(
      INIT => X"FFFB"
    )
    port map (
      I0 => cntSCL(1),
      I1 => cntSCL(6),
      I2 => cntSCL(5),
      I3 => SCLout_mux000017_117,
      O => SCLout_mux000021_118
    );
  SCLout_mux000061 : LUT4
    generic map(
      INIT => X"C040"
    )
    port map (
      I0 => state_FSM_FFd4_241,
      I1 => cntSCL(0),
      I2 => cntSCL(1),
      I3 => state_FSM_FFd2_235,
      O => SCLout_mux000061_119
    );
  sregIn_and00001 : LUT4
    generic map(
      INIT => X"0080"
    )
    port map (
      I0 => cntSCL(0),
      I1 => state_FSM_FFd1_233,
      I2 => N111,
      I3 => cntSCL(5),
      O => sregIn_and0000
    );
  SDAout_mux0003426 : LUT2
    generic map(
      INIT => X"8"
    )
    port map (
      I0 => N113,
      I1 => SDAout_mux0003412_135,
      O => N14
    );
  state_FSM_FFd4_In1 : LUT4
    generic map(
      INIT => X"8F88"
    )
    port map (
      I0 => Go,
      I1 => state_FSM_FFd5_243,
      I2 => sclEnd,
      I3 => state_FSM_FFd4_241,
      O => state_FSM_FFd4_In
    );
  state_FSM_FFd2_In2 : LUT3
    generic map(
      INIT => X"EA"
    )
    port map (
      I0 => state_FSM_FFd1_233,
      I1 => RdNotWr_96,
      I2 => state_FSM_FFd3_239,
      O => state_FSM_FFd2_In2_237
    );
  state_FSM_FFd2_In12 : LUT3
    generic map(
      INIT => X"08"
    )
    port map (
      I0 => NlwRenamedSig_OI_i_FIFO_iEmpty,
      I1 => state_FSM_FFd3_239,
      I2 => RdNotWr_96,
      O => state_FSM_FFd2_In12_236
    );
  state_FSM_FFd2_In26 : LUT4
    generic map(
      INIT => X"2232"
    )
    port map (
      I0 => state_FSM_FFd2_In12_236,
      I1 => N01,
      I2 => state_FSM_FFd2_In2_237,
      I3 => N12,
      O => state_FSM_FFd2_In26_238
    );
  SDAout_mux00038 : LUT4
    generic map(
      INIT => X"0080"
    )
    port map (
      I0 => N114,
      I1 => cntSCL(0),
      I2 => state_FSM_FFd2_235,
      I3 => cntSCL(5),
      O => SDAout_mux00038_139
    );
  SDAout_mux000316 : LUT2
    generic map(
      INIT => X"1"
    )
    port map (
      I0 => cntBytes(0),
      I1 => cntBytes(1),
      O => SDAout_mux000316_130
    );
  SDAout_mux000325 : LUT4
    generic map(
      INIT => X"FF10"
    )
    port map (
      I0 => cntBytes(3),
      I1 => cntBytes(2),
      I2 => SDAout_mux000316_130,
      I3 => N01,
      O => SDAout_mux000325_133
    );
  SDAout_mux0003431 : LUT4
    generic map(
      INIT => X"F888"
    )
    port map (
      I0 => state_FSM_FFd1_233,
      I1 => SDAout_mux000325_133,
      I2 => state_FSM_FFd3_239,
      I3 => SDAout_mux000337_134,
      O => SDAout_mux0003431_137
    );
  SDAout_mux000393 : LUT4
    generic map(
      INIT => X"FFFE"
    )
    port map (
      I0 => cntSCL(0),
      I1 => cntSCL(6),
      I2 => cntSCL(7),
      I3 => SDAout_mux000388_140,
      O => SDAout_mux000393_141
    );
  SDAout_mux0003112 : LUT4
    generic map(
      INIT => X"F7FF"
    )
    port map (
      I0 => cntSCL(2),
      I1 => cntSCL(5),
      I2 => SDAout_mux0003107_126,
      I3 => cntSCL(3),
      O => SDAout_mux0003112_127
    );
  SDAout_mux0003139 : LUT2
    generic map(
      INIT => X"E"
    )
    port map (
      I0 => cntSCL(4),
      I1 => cntSCL(1),
      O => SDAout_mux0003139_128
    );
  SDAout_mux0003180 : LUT4
    generic map(
      INIT => X"FFD8"
    )
    port map (
      I0 => state_FSM_FFd4_241,
      I1 => SDAout_mux0003112_127,
      I2 => SDAout_mux0003157_129,
      I3 => SDAout_mux000393_141,
      O => SDAout_mux0003180_131
    );
  i_FIFO_Result_1_11 : LUT2
    generic map(
      INIT => X"6"
    )
    port map (
      I0 => i_FIFO_addrWr(1),
      I1 => i_FIFO_addrWr(0),
      O => i_FIFO_Result_1_1_168
    );
  i_FIFO_Result_1_1 : LUT2
    generic map(
      INIT => X"6"
    )
    port map (
      I0 => i_FIFO_addrRd(1),
      I1 => i_FIFO_addrRd(0),
      O => i_FIFO_Result(1)
    );
  cntBytes_not0001_SW0 : LUT4
    generic map(
      INIT => X"F7FF"
    )
    port map (
      I0 => cntBits(2),
      I1 => cntBits(1),
      I2 => cntBits(3),
      I3 => cntBits(0),
      O => N55
    );
  cntBytes_not0001 : LUT4
    generic map(
      INIT => X"F2F0"
    )
    port map (
      I0 => state_FSM_FFd1_233,
      I1 => N55,
      I2 => RdNotWr_and0000,
      I3 => sclEnd,
      O => cntBytes_not0001_151
    );
  state_FSM_FFd3_In : LUT4
    generic map(
      INIT => X"FA8A"
    )
    port map (
      I0 => state_FSM_FFd3_239,
      I1 => N57,
      I2 => sclEnd,
      I3 => state_FSM_FFd4_241,
      O => state_FSM_FFd3_In_240
    );
  state_FSM_FFd1_In_SW0 : LUT4
    generic map(
      INIT => X"A888"
    )
    port map (
      I0 => N1111,
      I1 => state_FSM_FFd1_233,
      I2 => RdNotWr_96,
      I3 => state_FSM_FFd3_239,
      O => N59
    );
  state_FSM_FFd1_In : LUT4
    generic map(
      INIT => X"FD20"
    )
    port map (
      I0 => sclEnd,
      I1 => N01,
      I2 => N59,
      I3 => state_FSM_FFd1_233,
      O => state_FSM_FFd1_In_234
    );
  cntSCL_or00001 : LUT2
    generic map(
      INIT => X"E"
    )
    port map (
      I0 => state_FSM_FFd5_243,
      I1 => sclEnd,
      O => cntSCL_or0000
    );
  cntBits_or00001 : LUT3
    generic map(
      INIT => X"BA"
    )
    port map (
      I0 => state_FSM_FFd4_241,
      I1 => N01,
      I2 => sclEnd,
      O => cntBits_or0000
    );
  sregOut_not000111 : LUT4
    generic map(
      INIT => X"FFFD"
    )
    port map (
      I0 => cntBits(3),
      I1 => cntBits(2),
      I2 => cntBits(1),
      I3 => cntBits(0),
      O => N01
    );
  sregOut_not0001 : LUT4
    generic map(
      INIT => X"FEAE"
    )
    port map (
      I0 => RdNotWr_and0000,
      I1 => N61,
      I2 => sclEnd,
      I3 => N62,
      O => sregOut_not0001_232
    );
  i_FIFO_iFull_and000076 : LUT3
    generic map(
      INIT => X"90"
    )
    port map (
      I0 => i_FIFO_addrRd(3),
      I1 => i_FIFO_Result_3_1,
      I2 => i_FIFO_iFull_and000071_189,
      O => i_FIFO_iFull_and000076_190
    );
  i_FIFO_iFull_and000096 : LUT3
    generic map(
      INIT => X"80"
    )
    port map (
      I0 => i_FIFO_iFull_and000048_188,
      I1 => i_FIFO_iFull_and000076_190,
      I2 => i_FIFO_DoPush,
      O => i_FIFO_iFull_and0000
    );
  i_FIFO_DoPop : LUT4
    generic map(
      INIT => X"3237"
    )
    port map (
      I0 => state_FSM_FFd5_243,
      I1 => N116,
      I2 => RdNotWr_96,
      I3 => N64,
      O => i_FIFO_DoPop_161
    );
  i_FIFO_DoPush40 : LUT4
    generic map(
      INIT => X"5444"
    )
    port map (
      I0 => NlwRenamedSig_OI_i_FIFO_iFull,
      I1 => i_FIFO_DoPush0_163,
      I2 => i_FIFO_DoPush13_164,
      I3 => sclEnd,
      O => i_FIFO_DoPush
    );
  SCLout : FDS
    generic map(
      INIT => '1'
    )
    port map (
      C => Clk,
      D => SCLout_mux000072,
      S => SCLout_mux000063_120,
      Q => SCLout_116
    );
  SCLout_mux0000721 : LUT3
    generic map(
      INIT => X"A8"
    )
    port map (
      I0 => SCLout_116,
      I1 => SCLout_mux00008_122,
      I2 => SCLout_mux000021_118,
      O => SCLout_mux000072
    );
  SDAout : FDS
    generic map(
      INIT => '1'
    )
    port map (
      C => Clk,
      D => SDAout_mux0003204,
      S => SDAout_mux00038_139,
      Q => SDAout_125
    );
  state_FSM_FFd5 : FDRS
    generic map(
      INIT => '0'
    )
    port map (
      C => Clk,
      D => state_FSM_FFd5_In1_244,
      R => Reset,
      S => state_FSM_FFd6_245,
      Q => state_FSM_FFd5_243
    );
  state_FSM_FFd2 : FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => Clk,
      CE => sclEnd,
      D => state_FSM_FFd2_In26_238,
      R => Reset,
      Q => state_FSM_FFd2_235
    );
  Mcount_cntSCL_cy_1_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => cntSCL(1),
      O => Mcount_cntSCL_cy_1_rt_43
    );
  Mcount_cntSCL_cy_2_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => cntSCL(2),
      O => Mcount_cntSCL_cy_2_rt_45
    );
  Mcount_cntSCL_cy_3_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => cntSCL(3),
      O => Mcount_cntSCL_cy_3_rt_47
    );
  Mcount_cntSCL_cy_4_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => cntSCL(4),
      O => Mcount_cntSCL_cy_4_rt_49
    );
  Mcount_cntSCL_cy_5_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => cntSCL(5),
      O => Mcount_cntSCL_cy_5_rt_51
    );
  Mcount_cntSCL_cy_6_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => cntSCL(6),
      O => Mcount_cntSCL_cy_6_rt_53
    );
  Mcount_cntSCL_xor_7_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => cntSCL(7),
      O => Mcount_cntSCL_xor_7_rt_55
    );
  i_FIFO_DoPop_SW2 : LUT2
    generic map(
      INIT => X"1"
    )
    port map (
      I0 => state_FSM_FFd5_243,
      I1 => RdNotWr_96,
      O => N69
    );
  i_FIFO_iFull_or00001 : LUT4
    generic map(
      INIT => X"ABFB"
    )
    port map (
      I0 => Reset,
      I1 => N65,
      I2 => N69,
      I3 => N118,
      O => i_FIFO_iFull_or0000
    );
  SDAout_mux000332_SW0 : LUT2
    generic map(
      INIT => X"B"
    )
    port map (
      I0 => cntSCL(0),
      I1 => cntSCL(5),
      O => N71
    );
  sclEnd_cmp_eq00001 : LUT4
    generic map(
      INIT => X"0020"
    )
    port map (
      I0 => cntSCL(6),
      I1 => cntSCL(1),
      I2 => N115,
      I3 => N71,
      O => sclEnd
    );
  SDAout_mux00032041 : LUT4
    generic map(
      INIT => X"ECA0"
    )
    port map (
      I0 => SDAout_125,
      I1 => SDAout_mux000358_138,
      I2 => SDAout_mux0003180_131,
      I3 => SDAout_mux0003431_137,
      O => SDAout_mux0003204
    );
  i_FIFO_DoPush13 : LUT4
    generic map(
      INIT => X"0040"
    )
    port map (
      I0 => cntBits(3),
      I1 => cntBits(2),
      I2 => cntBits(1),
      I3 => N73,
      O => i_FIFO_DoPush13_164
    );
  sclEnd_cmp_eq00001_SW0 : LUT4
    generic map(
      INIT => X"FFBF"
    )
    port map (
      I0 => cntSCL(1),
      I1 => cntSCL(6),
      I2 => state_FSM_FFd3_239,
      I3 => NlwRenamedSig_OI_i_FIFO_iEmpty,
      O => N75
    );
  i_FIFO_iFull_and000071 : LUT4
    generic map(
      INIT => X"2148"
    )
    port map (
      I0 => i_FIFO_addrWr(1),
      I1 => i_FIFO_addrWr(0),
      I2 => i_FIFO_addrRd(1),
      I3 => i_FIFO_addrRd(0),
      O => i_FIFO_iFull_and000071_189
    );
  i_FIFO_Result_3_2 : LUT4
    generic map(
      INIT => X"6AAA"
    )
    port map (
      I0 => i_FIFO_addrRd(3),
      I1 => i_FIFO_addrRd(2),
      I2 => i_FIFO_addrRd(1),
      I3 => i_FIFO_addrRd(0),
      O => i_FIFO_Result(3)
    );
  i_FIFO_Result_3_11 : LUT4
    generic map(
      INIT => X"6AAA"
    )
    port map (
      I0 => i_FIFO_addrWr(3),
      I1 => i_FIFO_addrWr(2),
      I2 => i_FIFO_addrWr(1),
      I3 => i_FIFO_addrWr(0),
      O => i_FIFO_Result_3_1
    );
  i_FIFO_iEmpty_and000058 : LUT4
    generic map(
      INIT => X"69C3"
    )
    port map (
      I0 => i_FIFO_addrRd(1),
      I1 => i_FIFO_addrRd(2),
      I2 => i_FIFO_addrWr(2),
      I3 => i_FIFO_addrRd(0),
      O => i_FIFO_iEmpty_and000058_183
    );
  sregOut_not0001_SW0 : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => N112,
      I1 => SDAout_mux0003425_136,
      I2 => state_FSM_FFd3_239,
      I3 => N01,
      O => N61
    );
  i_FIFO_iEmpty_and000067 : LUT3
    generic map(
      INIT => X"69"
    )
    port map (
      I0 => i_FIFO_addrRd(1),
      I1 => i_FIFO_addrRd(0),
      I2 => i_FIFO_addrWr(1),
      O => i_FIFO_iEmpty_and000067_184
    );
  i_FIFO_DoPush40_SW0 : LUT3
    generic map(
      INIT => X"AE"
    )
    port map (
      I0 => Reset,
      I1 => N117,
      I2 => NlwRenamedSig_OI_i_FIFO_iFull,
      O => N79
    );
  i_FIFO_DoPush40_SW1 : LUT2
    generic map(
      INIT => X"D"
    )
    port map (
      I0 => NlwRenamedSig_OI_i_FIFO_iFull,
      I1 => Reset,
      O => N80
    );
  i_FIFO_iEmpty_or00001 : LUT4
    generic map(
      INIT => X"B8F0"
    )
    port map (
      I0 => N80,
      I1 => i_FIFO_DoPush13_164,
      I2 => N79,
      I3 => sclEnd,
      O => i_FIFO_iEmpty_or0000
    );
  SDAout_mux0003157_SW0 : LUT4
    generic map(
      INIT => X"FF01"
    )
    port map (
      I0 => state_FSM_FFd3_239,
      I1 => state_FSM_FFd1_233,
      I2 => state_FSM_FFd2_235,
      I3 => cntSCL(2),
      O => N82
    );
  i_FIFO_iEmpty_and0000102 : LUT4
    generic map(
      INIT => X"028A"
    )
    port map (
      I0 => N77,
      I1 => N64,
      I2 => N84,
      I3 => N85,
      O => i_FIFO_iEmpty_and0000
    );
  i_FIFO_iFull_and000048 : LUT4
    generic map(
      INIT => X"69C3"
    )
    port map (
      I0 => i_FIFO_addrWr(1),
      I1 => i_FIFO_addrRd(2),
      I2 => i_FIFO_addrWr(2),
      I3 => i_FIFO_addrWr(0),
      O => i_FIFO_iFull_and000048_188
    );
  NACK_and000020_SW0 : LUT2
    generic map(
      INIT => X"D"
    )
    port map (
      I0 => cntSCL(0),
      I1 => cntSCL(5),
      O => N87
    );
  NACK_and000022 : LUT4
    generic map(
      INIT => X"1000"
    )
    port map (
      I0 => N01,
      I1 => N87,
      I2 => NACK_and00007_95,
      I3 => N15,
      O => NACK_and0000
    );
  i_FIFO_DoPop_SW3 : MUXF5
    port map (
      I0 => N1,
      I1 => N90,
      S => i_FIFO_iEmpty_and000058_183,
      O => N84
    );
  i_FIFO_DoPop_SW3_G : LUT4
    generic map(
      INIT => X"A8FF"
    )
    port map (
      I0 => N65,
      I1 => RdNotWr_96,
      I2 => state_FSM_FFd5_243,
      I3 => i_FIFO_iEmpty_and000067_184,
      O => N90
    );
  i_FIFO_DoPop_SW4 : MUXF5
    port map (
      I0 => N1,
      I1 => N92,
      S => i_FIFO_iEmpty_and000058_183,
      O => N85
    );
  i_FIFO_DoPop_SW4_G : LUT4
    generic map(
      INIT => X"F1FF"
    )
    port map (
      I0 => RdNotWr_96,
      I1 => state_FSM_FFd5_243,
      I2 => N65,
      I3 => i_FIFO_iEmpty_and000067_184,
      O => N92
    );
  i_FIFO_Result_2_11 : LUT3
    generic map(
      INIT => X"6A"
    )
    port map (
      I0 => i_FIFO_addrWr(2),
      I1 => i_FIFO_addrWr(1),
      I2 => i_FIFO_addrWr(0),
      O => i_FIFO_Result_2_1_170
    );
  i_FIFO_Result_2_1 : LUT3
    generic map(
      INIT => X"6A"
    )
    port map (
      I0 => i_FIFO_addrRd(2),
      I1 => i_FIFO_addrRd(1),
      I2 => i_FIFO_addrRd(0),
      O => i_FIFO_Result(2)
    );
  SCLout_mux000063 : LUT4
    generic map(
      INIT => X"1000"
    )
    port map (
      I0 => cntSCL(6),
      I1 => cntSCL(5),
      I2 => N15,
      I3 => SCLout_mux000061_119,
      O => SCLout_mux000063_120
    );
  state_FSM_FFd5_In1 : LUT4
    generic map(
      INIT => X"8F88"
    )
    port map (
      I0 => sclEnd,
      I1 => state_FSM_FFd2_235,
      I2 => Go,
      I3 => state_FSM_FFd5_243,
      O => state_FSM_FFd5_In1_244
    );
  Mcount_cntBytes_xor_0_11 : LUT4
    generic map(
      INIT => X"B313"
    )
    port map (
      I0 => Go,
      I1 => cntBytes(0),
      I2 => state_FSM_FFd5_243,
      I3 => ReadCnt(0),
      O => Mcount_cntBytes
    );
  DI_7_1 : LUT4
    generic map(
      INIT => X"FD20"
    )
    port map (
      I0 => RdNotWr_96,
      I1 => state_FSM_FFd5_243,
      I2 => sregIn(7),
      I3 => FIFO_DI(7),
      O => DI(7)
    );
  DI_6_1 : LUT4
    generic map(
      INIT => X"FD20"
    )
    port map (
      I0 => RdNotWr_96,
      I1 => state_FSM_FFd5_243,
      I2 => sregIn(6),
      I3 => FIFO_DI(6),
      O => DI(6)
    );
  DI_5_1 : LUT4
    generic map(
      INIT => X"FD20"
    )
    port map (
      I0 => RdNotWr_96,
      I1 => state_FSM_FFd5_243,
      I2 => sregIn(5),
      I3 => FIFO_DI(5),
      O => DI(5)
    );
  DI_4_1 : LUT4
    generic map(
      INIT => X"FD20"
    )
    port map (
      I0 => RdNotWr_96,
      I1 => state_FSM_FFd5_243,
      I2 => sregIn(4),
      I3 => FIFO_DI(4),
      O => DI(4)
    );
  DI_3_1 : LUT4
    generic map(
      INIT => X"FD20"
    )
    port map (
      I0 => RdNotWr_96,
      I1 => state_FSM_FFd5_243,
      I2 => sregIn(3),
      I3 => FIFO_DI(3),
      O => DI(3)
    );
  DI_2_1 : LUT4
    generic map(
      INIT => X"FD20"
    )
    port map (
      I0 => RdNotWr_96,
      I1 => state_FSM_FFd5_243,
      I2 => sregIn(2),
      I3 => FIFO_DI(2),
      O => DI(2)
    );
  DI_1_1 : LUT4
    generic map(
      INIT => X"FD20"
    )
    port map (
      I0 => RdNotWr_96,
      I1 => state_FSM_FFd5_243,
      I2 => sregIn(1),
      I3 => FIFO_DI(1),
      O => DI(1)
    );
  DI_0_1 : LUT4
    generic map(
      INIT => X"FD20"
    )
    port map (
      I0 => RdNotWr_96,
      I1 => state_FSM_FFd5_243,
      I2 => sregIn(0),
      I3 => FIFO_DI(0),
      O => DI(0)
    );
  Mcount_cntBytes_xor_2_1_SW1 : LUT3
    generic map(
      INIT => X"C9"
    )
    port map (
      I0 => cntBytes(0),
      I1 => cntBytes(2),
      I2 => cntBytes(1),
      O => N107
    );
  Mcount_cntBytes_xor_2_1 : LUT4
    generic map(
      INIT => X"EC4C"
    )
    port map (
      I0 => Go,
      I1 => N107,
      I2 => state_FSM_FFd5_243,
      I3 => ReadCnt(2),
      O => Mcount_cntBytes2
    );
  Mcount_cntBytes_xor_3_1_SW1 : LUT4
    generic map(
      INIT => X"AAA9"
    )
    port map (
      I0 => cntBytes(3),
      I1 => cntBytes(0),
      I2 => cntBytes(1),
      I3 => cntBytes(2),
      O => N109
    );
  Mcount_cntBytes_xor_3_1 : LUT4
    generic map(
      INIT => X"EC4C"
    )
    port map (
      I0 => Go,
      I1 => N109,
      I2 => state_FSM_FFd5_243,
      I3 => ReadCnt(3),
      O => Mcount_cntBytes3
    );
  Mcount_cntSCL_lut_0_INV_0 : INV
    port map (
      I => cntSCL(0),
      O => Mcount_cntSCL_lut(0)
    );
  state_FSM_Out71_INV_0 : INV
    port map (
      I => state_FSM_FFd5_243,
      O => Busy
    );
  i_FIFO_Mcount_addrWr_xor_0_11_INV_0 : INV
    port map (
      I => i_FIFO_addrWr(0),
      O => i_FIFO_Result_0_1
    );
  i_FIFO_Mcount_addrRd_xor_0_11_INV_0 : INV
    port map (
      I => i_FIFO_addrRd(0),
      O => i_FIFO_Result(0)
    );
  Mcount_cntBits_xor_0_11_INV_0 : INV
    port map (
      I => cntBits(0),
      O => Result(0)
    );
  sregOut_mux0000_7_1 : LUT4
    generic map(
      INIT => X"EC4C"
    )
    port map (
      I0 => state_FSM_FFd5_243,
      I1 => sregOut(6),
      I2 => Go,
      I3 => Address(7),
      O => sregOut_mux0000_7_1_230
    );
  sregOut_mux0000_7_2 : LUT4
    generic map(
      INIT => X"EC4C"
    )
    port map (
      I0 => state_FSM_FFd5_243,
      I1 => NlwRenamedSig_OI_FIFO_DO(7),
      I2 => Go,
      I3 => Address(7),
      O => sregOut_mux0000_7_2_231
    );
  sregOut_mux0000_7_f5 : MUXF5
    port map (
      I0 => sregOut_mux0000_7_2_231,
      I1 => sregOut_mux0000_7_1_230,
      S => N01,
      O => sregOut_mux0000(7)
    );
  sregOut_mux0000_6_1 : LUT4
    generic map(
      INIT => X"EC4C"
    )
    port map (
      I0 => state_FSM_FFd5_243,
      I1 => sregOut(5),
      I2 => Go,
      I3 => Address(6),
      O => sregOut_mux0000_6_1_227
    );
  sregOut_mux0000_6_2 : LUT4
    generic map(
      INIT => X"EC4C"
    )
    port map (
      I0 => state_FSM_FFd5_243,
      I1 => NlwRenamedSig_OI_FIFO_DO(6),
      I2 => Go,
      I3 => Address(6),
      O => sregOut_mux0000_6_2_228
    );
  sregOut_mux0000_6_f5 : MUXF5
    port map (
      I0 => sregOut_mux0000_6_2_228,
      I1 => sregOut_mux0000_6_1_227,
      S => N01,
      O => sregOut_mux0000(6)
    );
  sregOut_mux0000_5_1 : LUT4
    generic map(
      INIT => X"EC4C"
    )
    port map (
      I0 => state_FSM_FFd5_243,
      I1 => sregOut(4),
      I2 => Go,
      I3 => Address(5),
      O => sregOut_mux0000_5_1_224
    );
  sregOut_mux0000_5_2 : LUT4
    generic map(
      INIT => X"EC4C"
    )
    port map (
      I0 => state_FSM_FFd5_243,
      I1 => NlwRenamedSig_OI_FIFO_DO(5),
      I2 => Go,
      I3 => Address(5),
      O => sregOut_mux0000_5_2_225
    );
  sregOut_mux0000_5_f5 : MUXF5
    port map (
      I0 => sregOut_mux0000_5_2_225,
      I1 => sregOut_mux0000_5_1_224,
      S => N01,
      O => sregOut_mux0000(5)
    );
  sregOut_mux0000_4_1 : LUT4
    generic map(
      INIT => X"EC4C"
    )
    port map (
      I0 => state_FSM_FFd5_243,
      I1 => sregOut(3),
      I2 => Go,
      I3 => Address(4),
      O => sregOut_mux0000_4_1_221
    );
  sregOut_mux0000_4_2 : LUT4
    generic map(
      INIT => X"EC4C"
    )
    port map (
      I0 => state_FSM_FFd5_243,
      I1 => NlwRenamedSig_OI_FIFO_DO(4),
      I2 => Go,
      I3 => Address(4),
      O => sregOut_mux0000_4_2_222
    );
  sregOut_mux0000_4_f5 : MUXF5
    port map (
      I0 => sregOut_mux0000_4_2_222,
      I1 => sregOut_mux0000_4_1_221,
      S => N01,
      O => sregOut_mux0000(4)
    );
  sregOut_mux0000_3_1 : LUT4
    generic map(
      INIT => X"EC4C"
    )
    port map (
      I0 => state_FSM_FFd5_243,
      I1 => sregOut(2),
      I2 => Go,
      I3 => Address(3),
      O => sregOut_mux0000_3_1_218
    );
  sregOut_mux0000_3_2 : LUT4
    generic map(
      INIT => X"EC4C"
    )
    port map (
      I0 => state_FSM_FFd5_243,
      I1 => NlwRenamedSig_OI_FIFO_DO(3),
      I2 => Go,
      I3 => Address(3),
      O => sregOut_mux0000_3_2_219
    );
  sregOut_mux0000_3_f5 : MUXF5
    port map (
      I0 => sregOut_mux0000_3_2_219,
      I1 => sregOut_mux0000_3_1_218,
      S => N01,
      O => sregOut_mux0000(3)
    );
  sregOut_mux0000_2_1 : LUT4
    generic map(
      INIT => X"EC4C"
    )
    port map (
      I0 => state_FSM_FFd5_243,
      I1 => sregOut(1),
      I2 => Go,
      I3 => Address(2),
      O => sregOut_mux0000_2_1_215
    );
  sregOut_mux0000_2_2 : LUT4
    generic map(
      INIT => X"EC4C"
    )
    port map (
      I0 => state_FSM_FFd5_243,
      I1 => NlwRenamedSig_OI_FIFO_DO(2),
      I2 => Go,
      I3 => Address(2),
      O => sregOut_mux0000_2_2_216
    );
  sregOut_mux0000_2_f5 : MUXF5
    port map (
      I0 => sregOut_mux0000_2_2_216,
      I1 => sregOut_mux0000_2_1_215,
      S => N01,
      O => sregOut_mux0000(2)
    );
  sregOut_mux0000_1_1 : LUT4
    generic map(
      INIT => X"EC4C"
    )
    port map (
      I0 => state_FSM_FFd5_243,
      I1 => sregOut(0),
      I2 => Go,
      I3 => Address(1),
      O => sregOut_mux0000_1_1_212
    );
  sregOut_mux0000_1_2 : LUT4
    generic map(
      INIT => X"EC4C"
    )
    port map (
      I0 => state_FSM_FFd5_243,
      I1 => NlwRenamedSig_OI_FIFO_DO(1),
      I2 => Go,
      I3 => Address(1),
      O => sregOut_mux0000_1_2_213
    );
  sregOut_mux0000_1_f5 : MUXF5
    port map (
      I0 => sregOut_mux0000_1_2_213,
      I1 => sregOut_mux0000_1_1_212,
      S => N01,
      O => sregOut_mux0000(1)
    );
  Mcount_cntBytes_xor_3_111 : LUT4_D
    generic map(
      INIT => X"FFFE"
    )
    port map (
      I0 => cntBytes(2),
      I1 => cntBytes(3),
      I2 => cntBytes(0),
      I3 => cntBytes(1),
      LO => N1111,
      O => N12
    );
  SDAout_mux0003412 : LUT4_D
    generic map(
      INIT => X"0001"
    )
    port map (
      I0 => cntSCL(2),
      I1 => cntSCL(4),
      I2 => cntSCL(6),
      I3 => cntSCL(5),
      LO => N112,
      O => SDAout_mux0003412_135
    );
  SDAout_mux0003425 : LUT4_D
    generic map(
      INIT => X"0001"
    )
    port map (
      I0 => cntSCL(7),
      I1 => cntSCL(3),
      I2 => cntSCL(0),
      I3 => cntSCL(1),
      LO => N113,
      O => SDAout_mux0003425_136
    );
  SDAout_mux000337 : LUT2_L
    generic map(
      INIT => X"B"
    )
    port map (
      I0 => sregOut(7),
      I1 => N01,
      LO => SDAout_mux000337_134
    );
  SDAout_mux000388 : LUT2_L
    generic map(
      INIT => X"8"
    )
    port map (
      I0 => cntSCL(5),
      I1 => state_FSM_FFd2_235,
      LO => SDAout_mux000388_140
    );
  SDAout_mux0003107 : LUT2_L
    generic map(
      INIT => X"7"
    )
    port map (
      I0 => cntSCL(4),
      I1 => cntSCL(1),
      LO => SDAout_mux0003107_126
    );
  state_FSM_FFd3_In_SW0 : LUT3_L
    generic map(
      INIT => X"F1"
    )
    port map (
      I0 => RdNotWr_96,
      I1 => NlwRenamedSig_OI_i_FIFO_iEmpty,
      I2 => N01,
      LO => N57
    );
  sregOut_not0001_SW1 : LUT4_L
    generic map(
      INIT => X"C404"
    )
    port map (
      I0 => NlwRenamedSig_OI_i_FIFO_iEmpty,
      I1 => state_FSM_FFd3_239,
      I2 => N01,
      I3 => N14,
      LO => N62
    );
  SDAout_mux000332 : LUT3_D
    generic map(
      INIT => X"08"
    )
    port map (
      I0 => N15,
      I1 => cntSCL(6),
      I2 => cntSCL(1),
      LO => N114,
      O => N111
    );
  NACK_and000011 : LUT4_D
    generic map(
      INIT => X"4000"
    )
    port map (
      I0 => cntSCL(7),
      I1 => cntSCL(3),
      I2 => cntSCL(2),
      I3 => cntSCL(4),
      LO => N115,
      O => N15
    );
  i_FIFO_DoPop_SW1 : LUT2_D
    generic map(
      INIT => X"D"
    )
    port map (
      I0 => FIFO_Pop,
      I1 => NlwRenamedSig_OI_i_FIFO_iEmpty,
      LO => N116,
      O => N65
    );
  i_FIFO_DoPush13_SW0 : LUT4_L
    generic map(
      INIT => X"FF7F"
    )
    port map (
      I0 => cntBits(0),
      I1 => state_FSM_FFd1_233,
      I2 => RdNotWr_96,
      I3 => state_FSM_FFd5_243,
      LO => N73
    );
  SDAout_mux000358 : LUT4_L
    generic map(
      INIT => X"1000"
    )
    port map (
      I0 => state_FSM_FFd4_241,
      I1 => state_FSM_FFd2_235,
      I2 => SDAout_mux0003412_135,
      I3 => SDAout_mux0003425_136,
      LO => SDAout_mux000358_138
    );
  i_FIFO_DoPush0 : LUT3_D
    generic map(
      INIT => X"C4"
    )
    port map (
      I0 => RdNotWr_96,
      I1 => FIFO_Push,
      I2 => state_FSM_FFd5_243,
      LO => N117,
      O => i_FIFO_DoPush0_163
    );
  i_FIFO_DoPop_SW0 : LUT4_D
    generic map(
      INIT => X"FFFD"
    )
    port map (
      I0 => N15,
      I1 => N71,
      I2 => N75,
      I3 => N01,
      LO => N118,
      O => N64
    );
  SDAout_mux0003157 : LUT4_L
    generic map(
      INIT => X"FFFE"
    )
    port map (
      I0 => SDAout_mux0003139_128,
      I1 => cntSCL(5),
      I2 => cntSCL(3),
      I3 => N82,
      LO => SDAout_mux0003157_129
    );
  i_FIFO_iEmpty_and0000102_SW0 : LUT4_L
    generic map(
      INIT => X"0990"
    )
    port map (
      I0 => i_FIFO_Result(3),
      I1 => i_FIFO_addrWr(3),
      I2 => i_FIFO_addrRd(0),
      I3 => i_FIFO_addrWr(0),
      LO => N77
    );

end STRUCTURE;

