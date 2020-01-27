<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="spartan3e" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="SDA" />
        <signal name="SCL" />
        <signal name="XLXN_95(7:0)" />
        <signal name="LED7" />
        <signal name="btn_south" />
        <signal name="SW(3:0)" />
        <signal name="XLXN_167" />
        <signal name="XLXN_181" />
        <signal name="XLXN_182(3:0)" />
        <signal name="XLXN_187(3:0)" />
        <signal name="XLXN_190(3:0)" />
        <signal name="Byte(7:0)" />
        <signal name="Byte(7:4)" />
        <signal name="Byte(3:0)" />
        <signal name="XLXN_192" />
        <signal name="LED0" />
        <signal name="XLXN_194" />
        <signal name="XLXN_195" />
        <signal name="XLXN_196" />
        <signal name="XLXN_197" />
        <signal name="XLXN_198(7:0)" />
        <signal name="XLXN_199(7:0)" />
        <signal name="XLXN_200" />
        <signal name="XLXN_201" />
        <signal name="XLXN_202" />
        <signal name="XLXN_203" />
        <signal name="XLXN_204">
        </signal>
        <signal name="ROT_B" />
        <signal name="ROT_A" />
        <signal name="XLXN_176" />
        <signal name="XLXN_177" />
        <signal name="XLXN_221" />
        <signal name="XLXN_222" />
        <signal name="Clk_50MHz" />
        <signal name="XLXN_224" />
        <signal name="XLXN_225" />
        <signal name="XLXN_226" />
        <signal name="XLXN_227" />
        <signal name="XLXN_228" />
        <signal name="XLXN_229" />
        <signal name="XLXN_230" />
        <signal name="XLXN_231" />
        <signal name="XLXN_232" />
        <signal name="XLXN_233" />
        <signal name="XLXN_234" />
        <signal name="XLXN_235" />
        <signal name="XLXN_236" />
        <signal name="XLXN_237" />
        <signal name="XLXN_238(7:0)" />
        <signal name="XLXN_240" />
        <port polarity="BiDirectional" name="SDA" />
        <port polarity="BiDirectional" name="SCL" />
        <port polarity="Output" name="LED7" />
        <port polarity="Input" name="btn_south" />
        <port polarity="Input" name="SW(3:0)" />
        <port polarity="Output" name="LED0" />
        <port polarity="Input" name="ROT_B" />
        <port polarity="Input" name="ROT_A" />
        <port polarity="Input" name="Clk_50MHz" />
        <blockdef name="I2C_Master">
            <timestamp>2015-11-24T13:12:50</timestamp>
            <rect width="336" x="64" y="-512" height="572" />
            <line x2="0" y1="-480" y2="-480" x1="64" />
            <rect width="64" x="0" y="-428" height="24" />
            <line x2="0" y1="-416" y2="-416" x1="64" />
            <rect width="64" x="0" y="-364" height="24" />
            <line x2="0" y1="-352" y2="-352" x1="64" />
            <line x2="464" y1="-480" y2="-480" x1="400" />
            <line x2="464" y1="-416" y2="-416" x1="400" />
            <line x2="0" y1="-256" y2="-256" x1="64" />
            <line x2="0" y1="-192" y2="-192" x1="64" />
            <rect width="64" x="0" y="-140" height="24" />
            <line x2="0" y1="-128" y2="-128" x1="64" />
            <line x2="464" y1="-256" y2="-256" x1="400" />
            <line x2="464" y1="-192" y2="-192" x1="400" />
            <rect width="64" x="400" y="-140" height="24" />
            <line x2="464" y1="-128" y2="-128" x1="400" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <line x2="0" y1="32" y2="32" x1="64" />
            <line x2="464" y1="-32" y2="-32" x1="400" />
            <line x2="464" y1="32" y2="32" x1="400" />
        </blockdef>
        <blockdef name="ifd">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <rect width="256" x="64" y="-320" height="256" />
            <line x2="64" y1="-128" y2="-140" x1="84" />
            <line x2="84" y1="-116" y2="-128" x1="64" />
            <line x2="64" y1="-128" y2="-128" x1="0" />
            <line x2="64" y1="-256" y2="-256" x1="0" />
            <line x2="320" y1="-256" y2="-256" x1="384" />
        </blockdef>
        <blockdef name="constant">
            <timestamp>2006-1-1T10:10:10</timestamp>
            <rect width="112" x="0" y="0" height="64" />
            <line x2="112" y1="32" y2="32" x1="144" />
        </blockdef>
        <blockdef name="OLED_Ctrl">
            <timestamp>2019-3-11T7:46:20</timestamp>
            <rect width="352" x="64" y="-384" height="384" />
            <line x2="0" y1="-352" y2="-352" x1="64" />
            <line x2="0" y1="-288" y2="-288" x1="64" />
            <line x2="0" y1="-224" y2="-224" x1="64" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <rect width="64" x="0" y="-44" height="24" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <line x2="480" y1="-352" y2="-352" x1="416" />
            <line x2="480" y1="-256" y2="-256" x1="416" />
            <line x2="480" y1="-160" y2="-160" x1="416" />
            <rect width="64" x="416" y="-76" height="24" />
            <line x2="480" y1="-64" y2="-64" x1="416" />
        </blockdef>
        <blockdef name="buf">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-32" y2="-32" x1="0" />
            <line x2="128" y1="-32" y2="-32" x1="224" />
            <line x2="128" y1="0" y2="-32" x1="64" />
            <line x2="64" y1="-32" y2="-64" x1="128" />
            <line x2="64" y1="-64" y2="0" x1="64" />
        </blockdef>
        <blockdef name="or2">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-64" y2="-64" x1="0" />
            <line x2="64" y1="-128" y2="-128" x1="0" />
            <line x2="192" y1="-96" y2="-96" x1="256" />
            <arc ex="192" ey="-96" sx="112" sy="-48" r="88" cx="116" cy="-136" />
            <arc ex="48" ey="-144" sx="48" sy="-48" r="56" cx="16" cy="-96" />
            <line x2="48" y1="-144" y2="-144" x1="112" />
            <arc ex="112" ey="-144" sx="192" sy="-96" r="88" cx="116" cy="-56" />
            <line x2="48" y1="-48" y2="-48" x1="112" />
        </blockdef>
        <blockdef name="RotaryEnc">
            <timestamp>2008-8-28T17:16:17</timestamp>
            <rect width="256" x="64" y="-256" height="192" />
            <line x2="0" y1="-224" y2="-224" x1="64" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <line x2="384" y1="-224" y2="-224" x1="320" />
            <line x2="384" y1="-160" y2="-160" x1="320" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
        </blockdef>
        <block symbolname="constant" name="XLXI_7">
            <attr value="78" name="CValue">
                <trait delete="all:1 sym:0" />
                <trait editname="all:1 sch:0" />
                <trait valuetype="BitVector 32 Hexadecimal" />
            </attr>
            <blockpin signalname="XLXN_95(7:0)" name="O" />
        </block>
        <block symbolname="I2C_Master" name="XLXI_1">
            <blockpin signalname="XLXN_195" name="Go" />
            <blockpin signalname="XLXN_95(7:0)" name="Address(7:0)" />
            <blockpin name="ReadCnt(3:0)" />
            <blockpin signalname="SDA" name="SDA" />
            <blockpin signalname="SCL" name="SCL" />
            <blockpin name="FIFO_Pop" />
            <blockpin signalname="XLXN_196" name="FIFO_Push" />
            <blockpin signalname="XLXN_198(7:0)" name="FIFO_DI(7:0)" />
            <blockpin name="FIFO_Empty" />
            <blockpin signalname="XLXN_228" name="FIFO_Full" />
            <blockpin name="FIFO_DO(7:0)" />
            <blockpin signalname="XLXN_224" name="Reset" />
            <blockpin signalname="Clk_50MHz" name="Clk" />
            <blockpin signalname="XLXN_232" name="Busy" />
            <blockpin signalname="LED7" name="NACK" />
        </block>
        <block symbolname="OLED_Ctrl" name="XLXI_8">
            <blockpin signalname="Clk_50MHz" name="Clk" />
            <blockpin signalname="XLXN_224" name="Reset" />
            <blockpin signalname="XLXN_226" name="WriteByte" />
            <blockpin signalname="XLXN_228" name="I2C_FIFO_Full" />
            <blockpin signalname="XLXN_232" name="I2C_Busy" />
            <blockpin signalname="Byte(7:0)" name="Byte(7:0)" />
            <blockpin signalname="LED0" name="Busy" />
            <blockpin signalname="XLXN_195" name="I2C_Go" />
            <blockpin signalname="XLXN_196" name="I2C_FIFO_Push" />
            <blockpin signalname="XLXN_198(7:0)" name="I2C_FIFO_DI(7:0)" />
        </block>
        <block symbolname="ifd" name="XLXI_3">
            <blockpin signalname="Clk_50MHz" name="C" />
            <blockpin signalname="btn_south" name="D" />
            <blockpin signalname="XLXN_224" name="Q" />
        </block>
        <block symbolname="buf" name="XLXI_10(3:0)">
            <blockpin signalname="SW(3:0)" name="I" />
            <blockpin signalname="Byte(3:0)" name="O" />
        </block>
        <block symbolname="buf" name="XLXI_9(3:0)">
            <blockpin signalname="SW(3:0)" name="I" />
            <blockpin signalname="Byte(7:4)" name="O" />
        </block>
        <block symbolname="RotaryEnc" name="XLXI_24">
            <blockpin signalname="ROT_A" name="ROT_A" />
            <blockpin signalname="ROT_B" name="ROT_B" />
            <blockpin signalname="XLXN_177" name="RotL" />
            <blockpin signalname="XLXN_176" name="RotR" />
            <blockpin signalname="Clk_50MHz" name="Clk" />
        </block>
        <block symbolname="or2" name="XLXI_25">
            <blockpin signalname="XLXN_176" name="I0" />
            <blockpin signalname="XLXN_177" name="I1" />
            <blockpin signalname="XLXN_226" name="O" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="3520" height="2720">
        <branch name="SDA">
            <wire x2="3408" y1="400" y2="400" x1="2560" />
        </branch>
        <branch name="SCL">
            <wire x2="3408" y1="464" y2="464" x1="2560" />
        </branch>
        <branch name="XLXN_95(7:0)">
            <wire x2="2096" y1="464" y2="464" x1="2048" />
        </branch>
        <branch name="LED7">
            <wire x2="3392" y1="912" y2="912" x1="2560" />
        </branch>
        <branch name="btn_south">
            <wire x2="272" y1="1648" y2="1648" x1="176" />
        </branch>
        <branch name="SW(3:0)">
            <wire x2="416" y1="608" y2="608" x1="160" />
            <wire x2="416" y1="608" y2="656" x1="416" />
            <wire x2="432" y1="656" y2="656" x1="416" />
            <wire x2="432" y1="560" y2="560" x1="416" />
            <wire x2="416" y1="560" y2="608" x1="416" />
        </branch>
        <instance x="432" y="688" name="XLXI_10(3:0)" orien="R0" />
        <instance x="432" y="592" name="XLXI_9(3:0)" orien="R0" />
        <bustap x2="688" y1="656" y2="656" x1="880" />
        <bustap x2="704" y1="560" y2="560" x1="880" />
        <branch name="Byte(7:0)">
            <wire x2="896" y1="560" y2="560" x1="880" />
            <wire x2="896" y1="560" y2="608" x1="896" />
            <wire x2="896" y1="608" y2="656" x1="896" />
            <wire x2="896" y1="608" y2="784" x1="896" />
            <wire x2="1264" y1="784" y2="784" x1="896" />
            <wire x2="896" y1="656" y2="656" x1="880" />
        </branch>
        <branch name="Byte(7:4)">
            <wire x2="704" y1="560" y2="560" x1="656" />
        </branch>
        <branch name="Byte(3:0)">
            <wire x2="688" y1="656" y2="656" x1="656" />
        </branch>
        <iomarker fontsize="28" x="160" y="608" name="SW(3:0)" orien="R180" />
        <branch name="LED0">
            <wire x2="1760" y1="464" y2="464" x1="1744" />
            <wire x2="3408" y1="208" y2="208" x1="1760" />
            <wire x2="1760" y1="208" y2="464" x1="1760" />
        </branch>
        <branch name="XLXN_195">
            <wire x2="1776" y1="560" y2="560" x1="1744" />
            <wire x2="1776" y1="400" y2="560" x1="1776" />
            <wire x2="2096" y1="400" y2="400" x1="1776" />
        </branch>
        <instance x="1264" y="816" name="XLXI_8" orien="R0">
        </instance>
        <branch name="XLXN_198(7:0)">
            <wire x2="2096" y1="752" y2="752" x1="1744" />
        </branch>
        <branch name="ROT_B">
            <wire x2="272" y1="1296" y2="1296" x1="144" />
        </branch>
        <branch name="ROT_A">
            <wire x2="272" y1="1232" y2="1232" x1="144" />
        </branch>
        <branch name="XLXN_176">
            <wire x2="672" y1="1296" y2="1296" x1="656" />
        </branch>
        <branch name="XLXN_177">
            <wire x2="672" y1="1232" y2="1232" x1="656" />
        </branch>
        <iomarker fontsize="28" x="144" y="1232" name="ROT_A" orien="R180" />
        <iomarker fontsize="28" x="144" y="1296" name="ROT_B" orien="R180" />
        <iomarker fontsize="28" x="176" y="1648" name="btn_south" orien="R180" />
        <branch name="Clk_50MHz">
            <wire x2="224" y1="912" y2="912" x1="176" />
            <wire x2="224" y1="912" y2="1360" x1="224" />
            <wire x2="272" y1="1360" y2="1360" x1="224" />
            <wire x2="224" y1="1360" y2="1776" x1="224" />
            <wire x2="272" y1="1776" y2="1776" x1="224" />
            <wire x2="2096" y1="912" y2="912" x1="224" />
            <wire x2="224" y1="464" y2="912" x1="224" />
            <wire x2="1264" y1="464" y2="464" x1="224" />
        </branch>
        <branch name="XLXN_224">
            <wire x2="240" y1="528" y2="848" x1="240" />
            <wire x2="960" y1="848" y2="848" x1="240" />
            <wire x2="960" y1="848" y2="1648" x1="960" />
            <wire x2="2096" y1="848" y2="848" x1="960" />
            <wire x2="1264" y1="528" y2="528" x1="240" />
            <wire x2="960" y1="1648" y2="1648" x1="656" />
        </branch>
        <branch name="XLXN_226">
            <wire x2="928" y1="592" y2="1264" x1="928" />
            <wire x2="1264" y1="592" y2="592" x1="928" />
        </branch>
        <branch name="XLXN_228">
            <wire x2="1248" y1="288" y2="656" x1="1248" />
            <wire x2="1264" y1="656" y2="656" x1="1248" />
            <wire x2="2624" y1="288" y2="288" x1="1248" />
            <wire x2="2624" y1="288" y2="688" x1="2624" />
            <wire x2="2624" y1="688" y2="688" x1="2560" />
        </branch>
        <branch name="XLXN_232">
            <wire x2="2640" y1="272" y2="272" x1="1216" />
            <wire x2="2640" y1="272" y2="848" x1="2640" />
            <wire x2="1216" y1="272" y2="720" x1="1216" />
            <wire x2="1264" y1="720" y2="720" x1="1216" />
            <wire x2="2640" y1="848" y2="848" x1="2560" />
        </branch>
        <instance x="272" y="1456" name="XLXI_24" orien="R0">
        </instance>
        <instance x="272" y="1904" name="XLXI_3" orien="R0" />
        <instance x="672" y="1360" name="XLXI_25" orien="R0" />
        <iomarker fontsize="28" x="3408" y="208" name="LED0" orien="R0" />
        <instance x="2096" y="880" name="XLXI_1" orien="R0">
        </instance>
        <branch name="XLXN_196">
            <wire x2="1760" y1="656" y2="656" x1="1744" />
            <wire x2="1760" y1="656" y2="688" x1="1760" />
            <wire x2="2096" y1="688" y2="688" x1="1760" />
        </branch>
        <instance x="1904" y="432" name="XLXI_7" orien="R0">
        </instance>
        <iomarker fontsize="28" x="3392" y="912" name="LED7" orien="R0" />
        <iomarker fontsize="28" x="3408" y="464" name="SCL" orien="R0" />
        <iomarker fontsize="28" x="3408" y="400" name="SDA" orien="R0" />
        <iomarker fontsize="28" x="176" y="912" name="Clk_50MHz" orien="R180" />
    </sheet>
</drawing>