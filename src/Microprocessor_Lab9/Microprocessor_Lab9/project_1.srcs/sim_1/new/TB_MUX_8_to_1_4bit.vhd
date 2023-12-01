----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/23/2023 02:06:59 PM
-- Design Name: 
-- Module Name: TB_MUX_8_to_1_4bit - Behavioral
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

entity TB_MUX_8_to_1_4bit is
--  Port ( );
end TB_MUX_8_to_1_4bit;

architecture Behavioral of TB_MUX_8_to_1_4bit is

component MUX_8_to_1_4bit 
Port ( D0 : in STD_LOGIC_VECTOR (3 downto 0);
           D1 : in STD_LOGIC_VECTOR (3 downto 0);
           D2 : in STD_LOGIC_VECTOR (3 downto 0);
           D3 : in STD_LOGIC_VECTOR (3 downto 0);
           D4 : in STD_LOGIC_VECTOR (3 downto 0);
           D5 : in STD_LOGIC_VECTOR (3 downto 0);
           D6 : in STD_LOGIC_VECTOR (3 downto 0);
           D7 : in STD_LOGIC_VECTOR (3 downto 0);
           Y : out STD_LOGIC_VECTOR (3 downto 0);
           S : in STD_LOGIC_VECTOR ( 2 downto 0)); 
end component;
signal D0,D1,D2,D3,D4,D5,D6,D7 : std_logic_vector ( 3 downto 0);
signal Y : std_logic_vector (3 downto 0);
signal S : std_logic_vector (2 downto 0);
begin
UUT : MUX_8_to_1_4_bit port map(
    D0=>D0,
    D1=>D1,
    D2=>D2,
    D3=>D3,
    D4=>D4,
    D5=>D5,
    D6=>D6,
    D7=>D7,
    Y=>Y,
    S=>S);
    
    process
    begin 
    wait for 100 ns;
    D0<="0000";
    D1<="0010";
    D2<="0110";
    D3<="1100";
    D4<="0001";
    D5<="0010";
    D6<="1000";
    D7<="1000";
    
    S<="000";
    
    end process;


end Behavioral;
