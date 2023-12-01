----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/23/2023 04:07:42 PM
-- Design Name: 
-- Module Name: TB_Microprocessor - Behavioral
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

entity TB_Microprocessor is
--  Port ( );
end TB_Microprocessor;

architecture Behavioral of TB_Microprocessor is

component Microprocessor
    Port ( Reset : in STD_LOGIC;
           Clk : in STD_LOGIC;
           Led_7_Seg : out STD_LOGIC_VECTOR (6 downto 0);
           AN : out STD_LOGIC_VECTOR (3 downto 0);
           Overflow : out STD_LOGIC;
           Zero : out STD_LOGIC);
end component;

signal Reset,Clk,Overflow,Zero : STD_LOGIC;
signal AN : STD_LOGIC_VECTOR (3 downto 0);
signal Led_7_Seg : STD_LOGIC_VECTOR (6 downto 0);

begin
UUT : Microprocessor
port map(
Reset => Reset,
Clk => Clk,
Led_7_Seg => Led_7_Seg,
AN => AN,
Overflow => Overflow,
Zero => Zero

);

Clock : process
    begin
        Clk <='0';
            wait for 1ns;
            Clk <='1';
            wait for 1ns;
    
            Clk <='1';
end process;

process 
    begin 
        Reset<='0';
        wait for 1000ns;
        Reset<='1';
        wait for 100ns;
        Reset<='0';
        wait;
        
end process;



end Behavioral;
