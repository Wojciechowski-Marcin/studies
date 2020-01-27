library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity OLED_Ctrl is
    Port ( Clk : in  STD_LOGIC;
           Reset : in  STD_LOGIC;
           Byte : in  STD_LOGIC_VECTOR(7 downto 0);
           WriteByte : in  STD_LOGIC;
           Busy : out  STD_LOGIC;
           I2C_Go : out  STD_LOGIC;
           I2C_FIFO_DI : out  STD_LOGIC_VECTOR (7 downto 0);
           I2C_FIFO_Push : out  STD_LOGIC;
           I2C_FIFO_Full : in   STD_LOGIC;
           I2C_Busy : in  STD_LOGIC);
end OLED_Ctrl;

architecture Behavioral of OLED_Ctrl is

   -- ROM with 1306 initialization bytes
   type t_byte_array is array ( NATURAL range <> ) of std_logic_vector( 7 downto 0 );
   constant ARR_LEN : NATURAL := 8; -- length of the initialization string
   constant ROM : t_byte_array( 0 to ARR_LEN - 1 ) := ( 
         -- Minimal initialization command bytes:
         X"00",            -- string prefix: commands (not data) will follow
         X"A1", X"C8",     -- set segment remap & reverse COM output scan direction
                           -- (this will rotate display upside-down; reset defaults: X"A0", X"C0")
         X"20", X"01",     -- set horizontal addressing mode (different mode can be used or, if omitted, the default page mode can be used)
         X"8D", X"14",     -- enable charge pump
         X"AF"             -- set display ON
         );
   -- Push counter:
   signal cntPush : unsigned( 2 downto 0 )   := ( others => '0' );

   -- FSM:
   type t_state is ( sReset,
                     sGo1, sPush1, sWait1,               -- config
                     sWaitWrite, sGo2, sPush2, sWait2    -- iteration: write data byte
                     );
   signal state, next_state : t_state;
   
begin

   -- The FSM - state register
   process( Clk )
   begin
      if rising_edge( Clk ) then
         if Reset = '1' then
            state <= sReset;
         else
            state <= next_state;
         end if;
      end if;
   end process;

   -- The FSM - transition function
   process( state, cntPush, I2C_Busy, I2C_FIFO_Full, WriteByte )
   begin
      next_state <= state;  -- default
      case state is
         when sReset =>
            next_state <= sGo1;

         -- Send command stream (initialization)
         when sGo1 =>
            next_state <= sPush1;
         when sPush1 =>
            if cntPush = ARR_LEN - 1 and I2C_FIFO_Full = '0' then 
               next_state <= sWait1;
            end if;

         -- Wait for Busy = '0'
         when sWait1 =>
            if I2C_Busy = '0' then 
               next_state <= sWaitWrite;
            end if;

         -- Wait for WriteByte input
         when sWaitWrite =>
            if WriteByte = '1' then 
               next_state <= sGo2;
            end if;

         -- Send one data byte (with an obligatory prefix)
         when sGo2 =>
            next_state <= sPush2;
         when sPush2 =>
            if cntPush = 1 and I2C_FIFO_Full = '0' then 
               next_state <= sWait2;
            end if;

         -- Wait for Busy = '0'
         when sWait2 =>
            if I2C_Busy = '0' then 
               next_state <= sWaitWrite;
            end if;

      end case;
   end process;

   -- ROM address
   process( Clk )
   begin
      if rising_edge( Clk ) then
         if state = sReset or state = sWaitWrite then
            cntPush <= ( others => '0' );
         elsif ( state = sPush1 or state = sPush2 ) and I2C_FIFO_Full = '0' then
            cntPush <= cntPush + 1;
         end if;
      end if;
   end process;

   -- Outputs
   I2C_FIFO_DI <= ROM( to_integer( cntPush ) ) when state = sPush1  else   -- initialization bytes from ROM
                  X"40" when state = sPush2 and cntPush = 0 else           -- WriteByte: prefix (data byte will follow)
                  Byte;                                                    -- WriteByte: pixel mask from the port

   I2C_FIFO_Push  <= '1' when ( state = sPush1 or state = sPush2 ) and I2C_FIFO_Full = '0'  else '0';

   I2C_Go <= '1' when state = sGo1 or state = sGo2  else '0';
   
   Busy <= '0' when state = sWaitWrite  else '1';

end Behavioral;
