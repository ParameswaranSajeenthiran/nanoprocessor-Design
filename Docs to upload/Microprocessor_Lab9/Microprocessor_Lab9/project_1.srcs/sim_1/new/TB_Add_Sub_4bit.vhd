----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/19/2023 02:29:00 PM
-- Design Name: 
-- Module Name: TB_Add_Sub_4bit - Behavioral
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

entity TB_Add_Sub_4bit is
--  Port ( );
end TB_Add_Sub_4bit;

architecture Behavioral of TB_Add_Sub_4bit is
    component Add_Sub_4bit
        Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
               B : in STD_LOGIC_VECTOR (3 downto 0);
               Cin : in STD_LOGIC;
               M : in STD_LOGIC;
               S : out STD_LOGIC_VECTOR (3 downto 0);
               Cout : out STD_LOGIC;
               Zero : out STD_LOGIC);
               
    end component;
    
signal A,B,S : STD_LOGIC_VECTOR (3 downto 0);
signal Cin,AddSubSel,Overflow,Zero : STD_LOGIC;

begin

UUT: Add_Sub_4bit
port map(
    A => A,
    B => B,
    Cin => Cin,
    M => AddSubSel,
    S => S,
    Cout => Overflow,
    Zero => Zero
    );
    
process
begin
Cin <= '0';
A <= "0001";
B <= "0010";
AddSubSel <= '0';

wait for 100ns;
A <= "0010";
B <= "0001";
AddSubSel <= '1';

wait ;

end process;


end Behavioral;
