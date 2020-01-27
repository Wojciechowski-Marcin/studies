<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="spartan3e" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="Reset" />
        <signal name="XLXN_22" />
        <signal name="XLXN_24" />
        <signal name="XLXN_25(7:0)" />
        <signal name="XLXN_26(7:0)" />
        <signal name="XLXN_27" />
        <signal name="XLXN_28" />
        <signal name="XLXN_29" />
        <signal name="XLXN_30" />
        <signal name="SDA" />
        <signal name="SCL" />
        <signal name="LED7" />
        <signal name="Clk" />
        <signal name="XLXN_43(7:0)" />
        <signal name="XLXN_44" />
        <signal name="XLXN_45" />
        <signal name="XLXN_46" />
        <signal name="XLXN_47(3:0)" />
        <signal name="XLXN_48(3:0)" />
        <signal name="XLXN_49(3:0)" />
        <signal name="XLXN_50(3:0)" />
        <signal name="XLXN_51(7:0)" />
        <signal name="PS2_Clk" />
        <signal name="PS2_Data" />
        <signal name="XLXN_57(3:0)" />
        <signal name="XLXN_58(3:0)" />
        <signal name="XLXN_59" />
        <signal name="XLXN_60(7:0)" />
        <port polarity="Input" name="Reset" />
        <port polarity="BiDirectional" name="SDA" />
        <port polarity="BiDirectional" name="SCL" />
        <port polarity="Output" name="LED7" />
        <port polarity="Input" name="Clk" />
        <port polarity="Input" name="PS2_Clk" />
        <port polarity="Input" name="PS2_Data" />
        <blockdef name="OLED_Ctrl">
            <timestamp>2019-3-11T8:46:20</timestamp>
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
        <blockdef name="I2C_Master">
            <timestamp>2019-3-11T8:43:34</timestamp>
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
        <blockdef name="constant">
            <timestamp>2006-1-1T10:10:10</timestamp>
            <rect width="112" x="0" y="0" height="64" />
            <line x2="112" y1="32" y2="32" x1="144" />
        </blockdef>
        <blockdef name="PS2_Kbd">
            <timestamp>2019-5-20T7:12:29</timestamp>
            <line x2="384" y1="-160" y2="-160" x1="320" />
            <line x2="384" y1="-96" y2="-96" x1="320" />
            <line x2="0" y1="-224" y2="-224" x1="64" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <line x2="384" y1="-32" y2="-32" x1="320" />
            <rect width="64" x="320" y="-236" height="24" />
            <line x2="384" y1="-224" y2="-224" x1="320" />
            <rect width="256" x="64" y="-256" height="256" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
        </blockdef>
        <blockdef name="Stoper">
            <timestamp>2019-5-20T8:23:44</timestamp>
            <line x2="0" y1="32" y2="32" x1="64" />
            <line x2="0" y1="-224" y2="-224" x1="64" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <rect width="64" x="0" y="-44" height="24" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <rect width="64" x="352" y="-236" height="24" />
            <line x2="416" y1="-224" y2="-224" x1="352" />
            <rect width="64" x="352" y="-172" height="24" />
            <line x2="416" y1="-160" y2="-160" x1="352" />
            <rect width="64" x="352" y="-108" height="24" />
            <line x2="416" y1="-96" y2="-96" x1="352" />
            <rect width="64" x="352" y="-44" height="24" />
            <line x2="416" y1="-32" y2="-32" x1="352" />
            <rect width="288" x="64" y="-256" height="320" />
        </blockdef>
        <blockdef name="Selector">
            <timestamp>2019-5-20T8:26:42</timestamp>
            <rect width="64" x="0" y="20" height="24" />
            <line x2="0" y1="32" y2="32" x1="64" />
            <rect width="64" x="0" y="84" height="24" />
            <line x2="0" y1="96" y2="96" x1="64" />
            <rect width="64" x="0" y="148" height="24" />
            <line x2="0" y1="160" y2="160" x1="64" />
            <rect width="64" x="0" y="212" height="24" />
            <line x2="0" y1="224" y2="224" x1="64" />
            <line x2="0" y1="-416" y2="-416" x1="64" />
            <line x2="0" y1="-352" y2="-352" x1="64" />
            <line x2="0" y1="-288" y2="-288" x1="64" />
            <line x2="384" y1="-416" y2="-416" x1="320" />
            <rect width="64" x="320" y="-44" height="24" />
            <line x2="384" y1="-32" y2="-32" x1="320" />
            <rect width="256" x="64" y="-448" height="704" />
        </blockdef>
        <block symbolname="OLED_Ctrl" name="XLXI_6">
            <blockpin signalname="Clk" name="Clk" />
            <blockpin signalname="Reset" name="Reset" />
            <blockpin signalname="XLXN_24" name="WriteByte" />
            <blockpin signalname="XLXN_30" name="I2C_FIFO_Full" />
            <blockpin signalname="XLXN_29" name="I2C_Busy" />
            <blockpin signalname="XLXN_60(7:0)" name="Byte(7:0)" />
            <blockpin signalname="XLXN_59" name="Busy" />
            <blockpin signalname="XLXN_28" name="I2C_Go" />
            <blockpin signalname="XLXN_27" name="I2C_FIFO_Push" />
            <blockpin signalname="XLXN_26(7:0)" name="I2C_FIFO_DI(7:0)" />
        </block>
        <block symbolname="I2C_Master" name="XLXI_7">
            <blockpin signalname="XLXN_28" name="Go" />
            <blockpin signalname="XLXN_25(7:0)" name="Address(7:0)" />
            <blockpin name="ReadCnt(3:0)" />
            <blockpin signalname="SDA" name="SDA" />
            <blockpin signalname="SCL" name="SCL" />
            <blockpin name="FIFO_Pop" />
            <blockpin signalname="XLXN_27" name="FIFO_Push" />
            <blockpin signalname="XLXN_26(7:0)" name="FIFO_DI(7:0)" />
            <blockpin name="FIFO_Empty" />
            <blockpin signalname="XLXN_30" name="FIFO_Full" />
            <blockpin name="FIFO_DO(7:0)" />
            <blockpin signalname="Reset" name="Reset" />
            <blockpin signalname="Clk" name="Clk" />
            <blockpin signalname="XLXN_29" name="Busy" />
            <blockpin signalname="LED7" name="NACK" />
        </block>
        <block symbolname="constant" name="XLXI_8">
            <attr value="78" name="CValue">
                <trait delete="all:1 sym:0" />
                <trait editname="all:1 sch:0" />
                <trait valuetype="BitVector 32 Hexadecimal" />
            </attr>
            <blockpin signalname="XLXN_25(7:0)" name="O" />
        </block>
        <block symbolname="PS2_Kbd" name="XLXI_9">
            <blockpin signalname="PS2_Clk" name="PS2_Clk" />
            <blockpin signalname="PS2_Data" name="PS2_Data" />
            <blockpin signalname="Clk" name="Clk_50MHz" />
            <blockpin signalname="XLXN_44" name="E0" />
            <blockpin signalname="XLXN_45" name="F0" />
            <blockpin signalname="XLXN_46" name="DO_Rdy" />
            <blockpin signalname="XLXN_43(7:0)" name="DO(7:0)" />
            <blockpin signalname="Clk" name="Clk_Sys" />
        </block>
        <block symbolname="Stoper" name="XLXI_10">
            <blockpin signalname="XLXN_44" name="E0" />
            <blockpin signalname="XLXN_45" name="F0" />
            <blockpin signalname="Clk" name="Clk" />
            <blockpin signalname="XLXN_46" name="DO_Rdy" />
            <blockpin signalname="XLXN_43(7:0)" name="DO(7:0)" />
            <blockpin signalname="XLXN_47(3:0)" name="First_digit(3:0)" />
            <blockpin signalname="XLXN_48(3:0)" name="Second_digit(3:0)" />
            <blockpin signalname="XLXN_49(3:0)" name="Third_digit(3:0)" />
            <blockpin signalname="XLXN_50(3:0)" name="Fourth_digit(3:0)" />
        </block>
        <block symbolname="Selector" name="XLXI_14">
            <blockpin signalname="Clk" name="Clk" />
            <blockpin signalname="Reset" name="Reset" />
            <blockpin signalname="XLXN_59" name="Busy" />
            <blockpin signalname="XLXN_47(3:0)" name="First_number(3:0)" />
            <blockpin signalname="XLXN_48(3:0)" name="Second_number(3:0)" />
            <blockpin signalname="XLXN_49(3:0)" name="Third_number(3:0)" />
            <blockpin signalname="XLXN_50(3:0)" name="Fourth_number(3:0)" />
            <blockpin signalname="XLXN_24" name="WriteByte" />
            <blockpin signalname="XLXN_60(7:0)" name="Result(7:0)" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="3520" height="2720">
        <instance x="1456" y="2432" name="XLXI_6" orien="R0">
        </instance>
        <branch name="XLXN_24">
            <wire x2="1312" y1="1904" y2="1904" x1="1296" />
            <wire x2="1312" y1="1904" y2="2208" x1="1312" />
            <wire x2="1456" y1="2208" y2="2208" x1="1312" />
        </branch>
        <instance x="2464" y="2480" name="XLXI_7" orien="R0">
        </instance>
        <branch name="XLXN_25(7:0)">
            <wire x2="2464" y1="2064" y2="2064" x1="2384" />
        </branch>
        <branch name="XLXN_26(7:0)">
            <wire x2="2192" y1="2368" y2="2368" x1="1936" />
            <wire x2="2192" y1="2352" y2="2368" x1="2192" />
            <wire x2="2464" y1="2352" y2="2352" x1="2192" />
        </branch>
        <branch name="XLXN_27">
            <wire x2="1936" y1="2272" y2="2288" x1="1936" />
            <wire x2="2464" y1="2288" y2="2288" x1="1936" />
        </branch>
        <branch name="XLXN_28">
            <wire x2="2016" y1="2176" y2="2176" x1="1936" />
            <wire x2="2016" y1="2000" y2="2176" x1="2016" />
            <wire x2="2464" y1="2000" y2="2000" x1="2016" />
        </branch>
        <instance x="2240" y="2032" name="XLXI_8" orien="R0">
        </instance>
        <branch name="XLXN_29">
            <wire x2="1456" y1="2336" y2="2336" x1="1376" />
            <wire x2="1376" y1="2336" y2="2592" x1="1376" />
            <wire x2="2992" y1="2592" y2="2592" x1="1376" />
            <wire x2="2992" y1="2448" y2="2448" x1="2928" />
            <wire x2="2992" y1="2448" y2="2592" x1="2992" />
        </branch>
        <branch name="XLXN_30">
            <wire x2="1456" y1="2272" y2="2272" x1="1344" />
            <wire x2="1344" y1="2272" y2="2624" x1="1344" />
            <wire x2="3040" y1="2624" y2="2624" x1="1344" />
            <wire x2="3040" y1="2288" y2="2288" x1="2928" />
            <wire x2="3040" y1="2288" y2="2624" x1="3040" />
        </branch>
        <branch name="SDA">
            <wire x2="3296" y1="2000" y2="2000" x1="2928" />
        </branch>
        <branch name="SCL">
            <wire x2="3264" y1="2064" y2="2064" x1="2928" />
        </branch>
        <branch name="LED7">
            <wire x2="3264" y1="2512" y2="2512" x1="2928" />
        </branch>
        <iomarker fontsize="28" x="3296" y="2000" name="SDA" orien="R0" />
        <iomarker fontsize="28" x="3264" y="2064" name="SCL" orien="R0" />
        <iomarker fontsize="28" x="3264" y="2512" name="LED7" orien="R0" />
        <branch name="Reset">
            <wire x2="400" y1="1728" y2="1728" x1="128" />
            <wire x2="1392" y1="1728" y2="1728" x1="400" />
            <wire x2="2064" y1="1728" y2="1728" x1="1392" />
            <wire x2="2064" y1="1728" y2="2448" x1="2064" />
            <wire x2="2464" y1="2448" y2="2448" x1="2064" />
            <wire x2="1392" y1="1728" y2="2144" x1="1392" />
            <wire x2="1456" y1="2144" y2="2144" x1="1392" />
            <wire x2="400" y1="1728" y2="1968" x1="400" />
            <wire x2="912" y1="1968" y2="1968" x1="400" />
        </branch>
        <instance x="1584" y="912" name="XLXI_10" orien="R0">
        </instance>
        <branch name="XLXN_43(7:0)">
            <wire x2="1456" y1="688" y2="688" x1="1344" />
            <wire x2="1456" y1="688" y2="880" x1="1456" />
            <wire x2="1584" y1="880" y2="880" x1="1456" />
        </branch>
        <branch name="XLXN_47(3:0)">
            <wire x2="2080" y1="1648" y2="1648" x1="784" />
            <wire x2="784" y1="1648" y2="2352" x1="784" />
            <wire x2="912" y1="2352" y2="2352" x1="784" />
            <wire x2="2080" y1="688" y2="688" x1="2000" />
            <wire x2="2080" y1="688" y2="1648" x1="2080" />
        </branch>
        <branch name="XLXN_48(3:0)">
            <wire x2="2064" y1="1616" y2="1616" x1="752" />
            <wire x2="752" y1="1616" y2="2416" x1="752" />
            <wire x2="912" y1="2416" y2="2416" x1="752" />
            <wire x2="2064" y1="752" y2="752" x1="2000" />
            <wire x2="2064" y1="752" y2="1616" x1="2064" />
        </branch>
        <branch name="XLXN_49(3:0)">
            <wire x2="2048" y1="1584" y2="1584" x1="720" />
            <wire x2="720" y1="1584" y2="2480" x1="720" />
            <wire x2="912" y1="2480" y2="2480" x1="720" />
            <wire x2="2048" y1="816" y2="816" x1="2000" />
            <wire x2="2048" y1="816" y2="1584" x1="2048" />
        </branch>
        <branch name="XLXN_50(3:0)">
            <wire x2="2032" y1="1552" y2="1552" x1="688" />
            <wire x2="688" y1="1552" y2="2544" x1="688" />
            <wire x2="912" y1="2544" y2="2544" x1="688" />
            <wire x2="2032" y1="880" y2="880" x1="2000" />
            <wire x2="2032" y1="880" y2="1552" x1="2032" />
        </branch>
        <iomarker fontsize="28" x="192" y="752" name="PS2_Data" orien="R180" />
        <instance x="960" y="912" name="XLXI_9" orien="R0">
        </instance>
        <branch name="XLXN_44">
            <wire x2="1472" y1="752" y2="752" x1="1344" />
            <wire x2="1472" y1="688" y2="752" x1="1472" />
            <wire x2="1584" y1="688" y2="688" x1="1472" />
        </branch>
        <branch name="XLXN_45">
            <wire x2="1488" y1="816" y2="816" x1="1344" />
            <wire x2="1488" y1="752" y2="816" x1="1488" />
            <wire x2="1584" y1="752" y2="752" x1="1488" />
        </branch>
        <branch name="XLXN_46">
            <wire x2="1408" y1="880" y2="880" x1="1344" />
            <wire x2="1408" y1="880" y2="960" x1="1408" />
            <wire x2="1504" y1="960" y2="960" x1="1408" />
            <wire x2="1504" y1="816" y2="960" x1="1504" />
            <wire x2="1584" y1="816" y2="816" x1="1504" />
        </branch>
        <branch name="Clk">
            <wire x2="864" y1="816" y2="816" x1="112" />
            <wire x2="864" y1="816" y2="880" x1="864" />
            <wire x2="960" y1="880" y2="880" x1="864" />
            <wire x2="864" y1="880" y2="992" x1="864" />
            <wire x2="864" y1="992" y2="1680" x1="864" />
            <wire x2="1456" y1="1680" y2="1680" x1="864" />
            <wire x2="2128" y1="1680" y2="1680" x1="1456" />
            <wire x2="2128" y1="1680" y2="2512" x1="2128" />
            <wire x2="2464" y1="2512" y2="2512" x1="2128" />
            <wire x2="1456" y1="1680" y2="2080" x1="1456" />
            <wire x2="864" y1="1680" y2="1904" x1="864" />
            <wire x2="912" y1="1904" y2="1904" x1="864" />
            <wire x2="1584" y1="992" y2="992" x1="864" />
            <wire x2="960" y1="816" y2="816" x1="864" />
            <wire x2="1584" y1="944" y2="992" x1="1584" />
        </branch>
        <branch name="PS2_Clk">
            <wire x2="960" y1="688" y2="688" x1="176" />
        </branch>
        <branch name="PS2_Data">
            <wire x2="960" y1="752" y2="752" x1="192" />
        </branch>
        <iomarker fontsize="28" x="128" y="1728" name="Reset" orien="R180" />
        <iomarker fontsize="28" x="112" y="816" name="Clk" orien="R180" />
        <iomarker fontsize="28" x="176" y="688" name="PS2_Clk" orien="R180" />
        <instance x="912" y="2320" name="XLXI_14" orien="R0">
        </instance>
        <branch name="XLXN_59">
            <wire x2="1984" y1="1776" y2="1776" x1="816" />
            <wire x2="1984" y1="1776" y2="2080" x1="1984" />
            <wire x2="816" y1="1776" y2="2032" x1="816" />
            <wire x2="912" y1="2032" y2="2032" x1="816" />
            <wire x2="1984" y1="2080" y2="2080" x1="1936" />
        </branch>
        <branch name="XLXN_60(7:0)">
            <wire x2="1360" y1="2288" y2="2288" x1="1296" />
            <wire x2="1360" y1="2288" y2="2400" x1="1360" />
            <wire x2="1456" y1="2400" y2="2400" x1="1360" />
        </branch>
    </sheet>
</drawing>