----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/19/2023 04:03:48 PM
-- Design Name: 
-- Module Name: TB_Add_3bit - Behavioral
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

entity TB_Add_3bit is
--  Port ( );
end TB_Add_3bit;

architecture Behavioral of TB_Add_3bit is

component Add_3bit
    Port ( A : in STD_LOGIC_VECTOR (2 downto 0);
           B : in STD_LOGIC_VECTOR (2 downto 0);
           Cin : in STD_LOGIC;
           S : out STD_LOGIC_VECTOR (2 downto 0);
           Cout : out STD_LOGIC);
end component;

signal A,B,S : STD_LOGIC_VECTOR (2 downto 0);
signal Cin,Cout : STD_LOGIC;

begin
uut: Add_3bit
port map(
A => A,
B => B,
Cin => Cin,
S => S,
Cout => Cout
);

process
begin
B <= "001";
A <= "010";
wait for 100ns;

A <= "111";
wait for 100ns;

end process;


end Behavioral;
