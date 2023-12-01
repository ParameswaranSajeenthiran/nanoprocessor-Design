----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/19/2023 01:57:17 PM
-- Design Name: 
-- Module Name: Add_Sub_4bit - Behavioral
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

entity Add_Sub_4bit is
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           B : in STD_LOGIC_VECTOR (3 downto 0);
           Cin : in STD_LOGIC;
           M : in STD_LOGIC;
           S : out STD_LOGIC_VECTOR (3 downto 0);
           Cout : out STD_LOGIC;
           Zero : out STD_LOGIC);
end Add_Sub_4bit;

architecture Behavioral of Add_Sub_4bit is

component FA 
 port ( 
 A: in std_logic; 
 B: in std_logic; 
 C_in: in std_logic; 
 S: out std_logic; 
 C_out: out std_logic); 
 end component; 
 
 SIGNAL FA0_S, FA0_C, FA1_S, FA1_C, FA2_S, FA2_C, FA3_S, FA3_C : std_logic;
 SIGNAL BFAin,SUM : STD_LOGIC_VECTOR (3 downto 0);

begin
BFAin(0) <= B(0) XOR M;
BFAin(1) <= B(1) XOR M;
BFAin(2) <= B(2) XOR M;
BFAin(3) <= B(3) XOR M;


FA_0 : FA 
 port map ( 
 A => A(0), 
 B => BFAin(0), 
 C_in => M, 
 S => SUM(0), 
 C_Out => FA0_C); 
 
 FA_1 : FA 
 port map ( 
 A => A(1), 
 B => BFAin(1), 
 C_in => FA0_C, 
 S => SUM(1), 
 C_Out => FA1_C); 

 FA_2 : FA 
 port map ( 
 A => A(2), 
 B => BFAin(2), 
 C_in => FA1_C, 
 S => SUM(2), 
 C_Out => FA2_C); 
 
 FA_3 : FA 
 port map ( 
 A => A(3), 
 B => BFAin(3), 
 C_in => FA2_C, 
 S => SUM(3), 
 C_Out => Cout);
 
 S <= SUM;
 zero<='1' when (SUM ="0000") else '0';
 
end Behavioral;
