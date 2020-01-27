<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="spartan3e" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="State(1)" />
        <signal name="State(3)" />
        <signal name="XLXN_16" />
        <signal name="XLXN_17" />
        <signal name="XLXN_19" />
        <signal name="XLXN_20" />
        <signal name="XLXN_21" />
        <signal name="XLXN_22" />
        <signal name="State(3:0)" />
        <signal name="Inc" />
        <signal name="State(0)" />
        <signal name="XLXN_28" />
        <signal name="XLXN_29" />
        <signal name="Clk" />
        <signal name="XLXN_34" />
        <signal name="XLXN_35" />
        <signal name="XLXN_38" />
        <signal name="XLXN_39" />
        <signal name="XLXN_40" />
        <signal name="XLXN_41" />
        <signal name="State(2)" />
        <signal name="XLXN_44" />
        <signal name="XLXN_45" />
        <signal name="XLXN_49" />
        <signal name="Reset" />
        <signal name="XLXN_51" />
        <signal name="XLXN_52" />
        <signal name="XLXN_53" />
        <signal name="XLXN_54" />
        <signal name="XLXN_55" />
        <port polarity="Output" name="State(3:0)" />
        <port polarity="Input" name="Inc" />
        <port polarity="Input" name="Clk" />
        <port polarity="Input" name="Reset" />
        <blockdef name="inv">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-32" y2="-32" x1="0" />
            <line x2="160" y1="-32" y2="-32" x1="224" />
            <line x2="128" y1="-64" y2="-32" x1="64" />
            <line x2="64" y1="-32" y2="0" x1="128" />
            <line x2="64" y1="0" y2="-64" x1="64" />
            <circle r="16" cx="144" cy="-32" />
        </blockdef>
        <blockdef name="and4">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-112" y2="-112" x1="144" />
            <arc ex="144" ey="-208" sx="144" sy="-112" r="48" cx="144" cy="-160" />
            <line x2="144" y1="-208" y2="-208" x1="64" />
            <line x2="64" y1="-64" y2="-256" x1="64" />
            <line x2="192" y1="-160" y2="-160" x1="256" />
            <line x2="64" y1="-256" y2="-256" x1="0" />
            <line x2="64" y1="-192" y2="-192" x1="0" />
            <line x2="64" y1="-128" y2="-128" x1="0" />
            <line x2="64" y1="-64" y2="-64" x1="0" />
        </blockdef>
        <blockdef name="fdre">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-128" y2="-128" x1="0" />
            <line x2="64" y1="-192" y2="-192" x1="0" />
            <line x2="64" y1="-256" y2="-256" x1="0" />
            <line x2="320" y1="-256" y2="-256" x1="384" />
            <line x2="64" y1="-32" y2="-32" x1="0" />
            <rect width="256" x="64" y="-320" height="256" />
            <line x2="192" y1="-64" y2="-32" x1="192" />
            <line x2="64" y1="-32" y2="-32" x1="192" />
            <line x2="80" y1="-112" y2="-128" x1="64" />
            <line x2="64" y1="-128" y2="-144" x1="80" />
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
        <block symbolname="inv" name="XLXI_2">
            <blockpin signalname="State(0)" name="I" />
            <blockpin signalname="XLXN_19" name="O" />
        </block>
        <block symbolname="inv" name="XLXI_4">
            <blockpin signalname="State(1)" name="I" />
            <blockpin signalname="XLXN_20" name="O" />
        </block>
        <block symbolname="inv" name="XLXI_6">
            <blockpin signalname="State(2)" name="I" />
            <blockpin signalname="XLXN_21" name="O" />
        </block>
        <block symbolname="inv" name="XLXI_8">
            <blockpin signalname="State(3)" name="I" />
            <blockpin signalname="XLXN_22" name="O" />
        </block>
        <block symbolname="and4" name="XLXI_25">
            <blockpin signalname="XLXN_28" name="I0" />
            <blockpin signalname="State(1)" name="I1" />
            <blockpin signalname="XLXN_29" name="I2" />
            <blockpin signalname="State(3)" name="I3" />
            <blockpin signalname="XLXN_51" name="O" />
        </block>
        <block symbolname="inv" name="XLXI_26">
            <blockpin signalname="State(2)" name="I" />
            <blockpin signalname="XLXN_29" name="O" />
        </block>
        <block symbolname="inv" name="XLXI_27">
            <blockpin signalname="State(0)" name="I" />
            <blockpin signalname="XLXN_28" name="O" />
        </block>
        <block symbolname="fdre" name="XLXI_28">
            <blockpin signalname="Clk" name="C" />
            <blockpin signalname="Inc" name="CE" />
            <blockpin signalname="XLXN_19" name="D" />
            <blockpin signalname="XLXN_54" name="R" />
            <blockpin signalname="State(0)" name="Q" />
        </block>
        <block symbolname="fdre" name="XLXI_29">
            <blockpin signalname="Clk" name="C" />
            <blockpin signalname="XLXN_19" name="CE" />
            <blockpin signalname="XLXN_20" name="D" />
            <blockpin signalname="XLXN_54" name="R" />
            <blockpin signalname="State(1)" name="Q" />
        </block>
        <block symbolname="fdre" name="XLXI_31">
            <blockpin signalname="Clk" name="C" />
            <blockpin signalname="XLXN_21" name="CE" />
            <blockpin signalname="XLXN_22" name="D" />
            <blockpin signalname="XLXN_54" name="R" />
            <blockpin signalname="State(3)" name="Q" />
        </block>
        <block symbolname="fdre" name="XLXI_30">
            <blockpin signalname="Clk" name="C" />
            <blockpin signalname="XLXN_20" name="CE" />
            <blockpin signalname="XLXN_21" name="D" />
            <blockpin signalname="XLXN_54" name="R" />
            <blockpin signalname="State(2)" name="Q" />
        </block>
        <block symbolname="or2" name="XLXI_33">
            <blockpin signalname="XLXN_51" name="I0" />
            <blockpin signalname="Reset" name="I1" />
            <blockpin signalname="XLXN_54" name="O" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="3520" height="2720">
        <instance x="608" y="1056" name="XLXI_2" orien="R0" />
        <instance x="1408" y="1088" name="XLXI_4" orien="R0" />
        <branch name="State(1)">
            <wire x2="1376" y1="864" y2="864" x1="1344" />
            <wire x2="1376" y1="864" y2="1056" x1="1376" />
            <wire x2="1408" y1="1056" y2="1056" x1="1376" />
            <wire x2="1376" y1="1056" y2="1168" x1="1376" />
            <wire x2="1456" y1="1168" y2="1168" x1="1376" />
            <wire x2="1456" y1="1168" y2="1632" x1="1456" />
            <wire x2="1376" y1="496" y2="864" x1="1376" />
        </branch>
        <instance x="2256" y="1104" name="XLXI_6" orien="R0" />
        <instance x="3072" y="1104" name="XLXI_8" orien="R0" />
        <branch name="State(3)">
            <wire x2="3040" y1="1184" y2="1184" x1="1584" />
            <wire x2="1584" y1="1184" y2="1632" x1="1584" />
            <wire x2="3040" y1="880" y2="880" x1="3008" />
            <wire x2="3040" y1="880" y2="1072" x1="3040" />
            <wire x2="3072" y1="1072" y2="1072" x1="3040" />
            <wire x2="3040" y1="1072" y2="1184" x1="3040" />
            <wire x2="3040" y1="496" y2="880" x1="3040" />
        </branch>
        <branch name="XLXN_19">
            <wire x2="896" y1="736" y2="736" x1="160" />
            <wire x2="896" y1="736" y2="928" x1="896" />
            <wire x2="896" y1="928" y2="1024" x1="896" />
            <wire x2="960" y1="928" y2="928" x1="896" />
            <wire x2="160" y1="736" y2="832" x1="160" />
            <wire x2="896" y1="1024" y2="1024" x1="832" />
        </branch>
        <branch name="XLXN_20">
            <wire x2="1712" y1="768" y2="768" x1="960" />
            <wire x2="1712" y1="768" y2="960" x1="1712" />
            <wire x2="1712" y1="960" y2="1056" x1="1712" />
            <wire x2="1808" y1="960" y2="960" x1="1712" />
            <wire x2="960" y1="768" y2="864" x1="960" />
            <wire x2="1712" y1="1056" y2="1056" x1="1632" />
        </branch>
        <branch name="XLXN_22">
            <wire x2="2560" y1="736" y2="880" x1="2560" />
            <wire x2="2624" y1="880" y2="880" x1="2560" />
            <wire x2="3296" y1="736" y2="736" x1="2560" />
            <wire x2="3296" y1="736" y2="1072" x1="3296" />
        </branch>
        <branch name="State(3:0)">
            <wire x2="608" y1="400" y2="400" x1="560" />
            <wire x2="1376" y1="400" y2="400" x1="608" />
            <wire x2="2224" y1="400" y2="400" x1="1376" />
            <wire x2="3040" y1="400" y2="400" x1="2224" />
            <wire x2="3088" y1="400" y2="400" x1="3040" />
        </branch>
        <iomarker fontsize="28" x="3088" y="400" name="State(3:0)" orien="R0" />
        <bustap x2="608" y1="400" y2="496" x1="608" />
        <bustap x2="1376" y1="400" y2="496" x1="1376" />
        <bustap x2="2224" y1="400" y2="496" x1="2224" />
        <bustap x2="3040" y1="400" y2="496" x1="3040" />
        <branch name="State(0)">
            <wire x2="576" y1="832" y2="832" x1="544" />
            <wire x2="576" y1="832" y2="1024" x1="576" />
            <wire x2="608" y1="1024" y2="1024" x1="576" />
            <wire x2="608" y1="832" y2="832" x1="576" />
            <wire x2="560" y1="1024" y2="1200" x1="560" />
            <wire x2="1392" y1="1200" y2="1200" x1="560" />
            <wire x2="1392" y1="1200" y2="1376" x1="1392" />
            <wire x2="576" y1="1024" y2="1024" x1="560" />
            <wire x2="608" y1="496" y2="832" x1="608" />
        </branch>
        <instance x="1328" y="1632" name="XLXI_25" orien="R90" />
        <branch name="XLXN_28">
            <wire x2="1392" y1="1600" y2="1632" x1="1392" />
        </branch>
        <instance x="1360" y="1376" name="XLXI_27" orien="R90" />
        <branch name="XLXN_29">
            <wire x2="1520" y1="1600" y2="1632" x1="1520" />
        </branch>
        <instance x="1488" y="1376" name="XLXI_26" orien="R90" />
        <instance x="160" y="1088" name="XLXI_28" orien="R0" />
        <iomarker fontsize="28" x="80" y="896" name="Inc" orien="R180" />
        <branch name="Inc">
            <wire x2="160" y1="896" y2="896" x1="80" />
        </branch>
        <instance x="960" y="1120" name="XLXI_29" orien="R0" />
        <instance x="2624" y="1136" name="XLXI_31" orien="R0" />
        <branch name="State(2)">
            <wire x2="1520" y1="1168" y2="1376" x1="1520" />
            <wire x2="2240" y1="1168" y2="1168" x1="1520" />
            <wire x2="2240" y1="896" y2="896" x1="2192" />
            <wire x2="2240" y1="896" y2="1072" x1="2240" />
            <wire x2="2256" y1="1072" y2="1072" x1="2240" />
            <wire x2="2240" y1="1072" y2="1168" x1="2240" />
            <wire x2="2224" y1="496" y2="688" x1="2224" />
            <wire x2="2240" y1="688" y2="688" x1="2224" />
            <wire x2="2240" y1="688" y2="896" x1="2240" />
        </branch>
        <branch name="Clk">
            <wire x2="128" y1="960" y2="960" x1="80" />
            <wire x2="160" y1="960" y2="960" x1="128" />
            <wire x2="128" y1="592" y2="960" x1="128" />
            <wire x2="928" y1="592" y2="592" x1="128" />
            <wire x2="1744" y1="592" y2="592" x1="928" />
            <wire x2="2528" y1="592" y2="592" x1="1744" />
            <wire x2="2528" y1="592" y2="1008" x1="2528" />
            <wire x2="2624" y1="1008" y2="1008" x1="2528" />
            <wire x2="1744" y1="592" y2="1024" x1="1744" />
            <wire x2="1808" y1="1024" y2="1024" x1="1744" />
            <wire x2="928" y1="592" y2="992" x1="928" />
            <wire x2="960" y1="992" y2="992" x1="928" />
        </branch>
        <branch name="XLXN_21">
            <wire x2="2480" y1="768" y2="768" x1="1760" />
            <wire x2="2480" y1="768" y2="944" x1="2480" />
            <wire x2="2624" y1="944" y2="944" x1="2480" />
            <wire x2="2480" y1="944" y2="1072" x1="2480" />
            <wire x2="1760" y1="768" y2="896" x1="1760" />
            <wire x2="1808" y1="896" y2="896" x1="1760" />
        </branch>
        <instance x="1808" y="1152" name="XLXI_30" orien="R0" />
        <iomarker fontsize="28" x="80" y="960" name="Clk" orien="R180" />
        <instance x="224" y="1312" name="XLXI_33" orien="R0" />
        <branch name="Reset">
            <wire x2="224" y1="1184" y2="1184" x1="112" />
        </branch>
        <iomarker fontsize="28" x="112" y="1184" name="Reset" orien="R180" />
        <branch name="XLXN_51">
            <wire x2="224" y1="1248" y2="1248" x1="176" />
            <wire x2="176" y1="1248" y2="1968" x1="176" />
            <wire x2="1488" y1="1968" y2="1968" x1="176" />
            <wire x2="1488" y1="1888" y2="1968" x1="1488" />
        </branch>
        <branch name="XLXN_54">
            <wire x2="160" y1="1056" y2="1104" x1="160" />
            <wire x2="544" y1="1104" y2="1104" x1="160" />
            <wire x2="544" y1="1104" y2="1216" x1="544" />
            <wire x2="928" y1="1104" y2="1104" x1="544" />
            <wire x2="960" y1="1104" y2="1104" x1="928" />
            <wire x2="928" y1="1104" y2="1152" x1="928" />
            <wire x2="1808" y1="1152" y2="1152" x1="928" />
            <wire x2="2624" y1="1152" y2="1152" x1="1808" />
            <wire x2="544" y1="1216" y2="1216" x1="480" />
            <wire x2="960" y1="1088" y2="1104" x1="960" />
            <wire x2="1808" y1="1120" y2="1152" x1="1808" />
            <wire x2="2624" y1="1104" y2="1152" x1="2624" />
        </branch>
    </sheet>
</drawing>