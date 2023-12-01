----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/23/2023 02:03:15 PM
-- Design Name: 
-- Module Name: MUX_8_to_1_4bit - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
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
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity MUX_8_to_1_4bit is
    Port ( D0 : in STD_LOGIC_VECTOR (3 downto 0);
           D1 : in STD_LOGIC_VECTOR (3 downto 0);
           D2 : in STD_LOGIC_VECTOR (3 downto 0);
           D3 : in STD_LOGIC_VECTOR (3 downto 0);
           D4 : in STD_LOGIC_VECTOR (3 downto 0);
           D5 : in STD_LOGIC_VECTOR (3 downto 0);
           D6 : in STD_LOGIC_VECTOR (3 downto 0);
           D7 : in STD_LOGIC_VECTOR (3 downto 0);
           S : in STD_LOGIC_VECTOR (2 downto 0);
           Y : out STD_LOGIC_VECTOR (3 downto 0));
end MUX_8_to_1_4bit;

architecture Behavioral of MUX_8_to_1_4bit is

begin

--with S select
--    Y <= D0 when "000",
--         D1 when  "001",
--         D2 when "010",
--         D3 when "011",
--         D4 when "100",
--         D5 when "101",
--         D6 when "110",
--         D7 when "111",      
--         "000"  when others;

process (D0,D1,D2,D3,D4,D5,D6,D7,S) is
begin
  if (S="000") then
      Y <= D0;
       elsif (S="001") then
      Y <= D1;
       elsif (S="010") then
      Y <= D2;
       elsif (S="011") then
      Y <= D3;
       elsif (S="100") then
      Y <= D4;
       elsif (S="101") then
      Y <= D5;
       elsif (S="110") then
      Y <= D6;
       elsif (S="111") then
      Y <= D7;
             
    
  else
      Y <= D0;
  end if;
 
end process;



end Behavioral;