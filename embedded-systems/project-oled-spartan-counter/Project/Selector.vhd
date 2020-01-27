library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use std.textio.all;

entity Selector is
    generic (
--    DATA_WIDTH : integer := 32;
--    IMAGE_SIZE : integer := 64;
    DATA_WIDTH : integer := 64;
    IMAGE_SIZE : integer := 32;
    IMAGE0 : string :="MIF/0.MIF";
    IMAGE1 : string :="MIF/1.MIF";
    IMAGE2 : string :="MIF/2.MIF";
    IMAGE3 : string :="MIF/3.MIF";
    IMAGE4 : string :="MIF/4.MIF";
    IMAGE5 : string :="MIF/5.MIF";
    IMAGE6 : string :="MIF/6.MIF";
    IMAGE7 : string :="MIF/7.MIF";
    IMAGE8 : string :="MIF/8.MIF";
    IMAGE9 : string :="MIF/9.MIF"
    );
    Port ( Clk : in  STD_LOGIC;
           Reset : in  STD_LOGIC;
           Busy: in STD_LOGIC;
           First_number : in  STD_LOGIC_VECTOR (3 downto 0);
           Second_number : in  STD_LOGIC_VECTOR (3 downto 0);
           Third_number : in  STD_LOGIC_VECTOR (3 downto 0);
           Fourth_number : in  STD_LOGIC_VECTOR (3 downto 0);
           WriteByte : out  STD_LOGIC;
           Result : out  STD_LOGIC_VECTOR (7 downto 0)); 
end Selector;

architecture Behavioral of Selector is

type state_type is (WRITE_FIRST, WRITE_SECOND, WRITE_THIRD, WRITE_FOURTH );
TYPE mem_type IS ARRAY(0 TO IMAGE_SIZE-1) OF std_logic_vector((DATA_WIDTH-1) DOWNTO 0);
signal state, next_state : state_type;
signal tmpBitmap: mem_type;

impure function init_mem(mif_file_name : in string) return mem_type is
    file mif_file : text open read_mode is mif_file_name;
    variable mif_line : line;
    variable temp_bv : bit_vector(DATA_WIDTH-1 downto 0);
    variable temp_mem : mem_type;
begin
    for i in mem_type'range loop
        readline(mif_file, mif_line);
        read(mif_line, temp_bv);
        temp_mem(i) := to_stdlogicvector(temp_bv);
    end loop;
    return temp_mem;
end function;

constant ram_block0: mem_type := init_mem(IMAGE0);
constant ram_block1: mem_type := init_mem(IMAGE1);
constant ram_block2: mem_type := init_mem(IMAGE2);
constant ram_block3: mem_type := init_mem(IMAGE3);
constant ram_block4: mem_type := init_mem(IMAGE4);
constant ram_block5: mem_type := init_mem(IMAGE5);
constant ram_block6: mem_type := init_mem(IMAGE6);
constant ram_block7: mem_type := init_mem(IMAGE7);
constant ram_block8: mem_type := init_mem(IMAGE8);
constant ram_block9: mem_type := init_mem(IMAGE9);
signal lineNumber:INTEGER :=0;
signal blockNumber:INTEGER :=0;
signal writeByteBusy:STD_LOGIC :='0';
signal chunk:STD_LOGIC_VECTOR(7 downto 0);
impure function SELECT_BITMAP(number : STD_LOGIC_VECTOR (3 downto 0)) return mem_type is
begin
  if number = X"0" then
    return ram_block0;
  elsif  number = X"1" then
    return ram_block1;
  elsif  number = X"2" then
    return ram_block2;
  elsif  number = X"3" then
    return ram_block3;
  elsif  number = X"4" then
    return ram_block4;
  elsif  number = X"5" then
    return ram_block5;
  elsif  number = X"6" then
    return ram_block6;
  elsif  number = X"7" then
    return ram_block7;
  elsif  number = X"8" then
    return ram_block8;
  else
    return ram_block9;
  end if;
end SELECT_BITMAP;

begin

process1 : process( Clk )
begin
   if rising_edge( Clk ) then
      if Busy = '1' then
         WriteByte<='0';
         writeByteBusy<='0';
      end if;
      if lineNumber=32 then
         lineNumber<=0;
      end if;
      if Reset = '1' then
         state <= WRITE_FIRST;
      else
         state <= next_state;
      end if;
      if (Busy= '0') and (state = WRITE_FIRST or state = WRITE_SECOND or state = WRITE_THIRD or state = WRITE_FOURTH) and blockNumber<8 and lineNumber<IMAGE_SIZE and writeByteBusy='0' then
         chunk <= tmpBitmap(lineNumber)(7+8*blockNumber downto 8*blockNumber);
         blockNumber<=blockNumber+1;
         WriteByte<='1';
         writeByteBusy<='1';
         if blockNumber = 7 then
            blockNumber<=0;
            lineNumber<=lineNumber+1;
         end if;
      end if;
   end if;
end process process1;

process2 : process( state,First_number,Second_number,Third_number,Fourth_number,lineNumber)
begin
   next_state <= state; 
case state is
   when WRITE_FIRST =>
      tmpBitmap <= SELECT_BITMAP(First_number);
      if lineNumber=32 then
         next_state <= WRITE_SECOND;
      end if;
   when WRITE_SECOND =>
      tmpBitmap <= SELECT_BITMAP(Second_number);
      if lineNumber=32 then
         next_state <= WRITE_THIRD;
      end if;
   when WRITE_THIRD =>
      tmpBitmap <= SELECT_BITMAP(Third_number);
     if lineNumber=32 then
         next_state <= WRITE_FOURTH;
     end if;
   when WRITE_FOURTH =>
      tmpBitmap <= SELECT_BITMAP(Fourth_number);
      if lineNumber=32 then
         next_state <= WRITE_FIRST;
      end if;
end case;
end process process2;

Result <= chunk;

end Behavioral;

