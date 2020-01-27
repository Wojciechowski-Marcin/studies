----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    09:19:21 03/11/2019 
-- Design Name: 
-- Module Name:    x - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity x is
    Port ( SW : in  STD_LOGIC_VECTOR (3 downto 0);
           ROT_A : in  STD_LOGIC;
           ROT_B : in  STD_LOGIC;
           btn_south : in  STD_LOGIC;
           Clk_50MHz : in  STD_LOGIC;
           SDA : inout  STD_LOGIC;
           SCL : inout  STD_LOGIC;
           LED7 : out  STD_LOGIC;
           LED0 : out  STD_LOGIC);
end x;

architecture Behavioral of x is

begin


end Behavioral;

