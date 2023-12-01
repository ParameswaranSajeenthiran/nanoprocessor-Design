----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/19/2023 09:35:46 AM
-- Design Name: 
-- Module Name: TB_Reg_Bank - Behavioral
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

entity TB_Reg_Bank is
--  Port ( );
end TB_Reg_Bank;

architecture Behavioral of TB_Reg_Bank is
    component Reg_Bank
        Port ( I : in STD_LOGIC_VECTOR (3 downto 0);
               RegEn : in STD_LOGIC_VECTOR (2 downto 0);
               Clk : in STD_LOGIC;
               Reset : in STD_LOGIC;
               Reg0 : out STD_LOGIC_VECTOR (3 downto 0);
               Reg1 : out STD_LOGIC_VECTOR (3 downto 0);
               Reg2 : out STD_LOGIC_VECTOR (3 downto 0);
               Reg3 : out STD_LOGIC_VECTOR (3 downto 0);
               Reg4 : out STD_LOGIC_VECTOR (3 downto 0);
               Reg5 : out STD_LOGIC_VECTOR (3 downto 0);
               Reg6 : out STD_LOGIC_VECTOR (3 downto 0);
               Reg7 : out STD_LOGIC_VECTOR (3 downto 0));
    end component;

signal I : STD_LOGIC_VECTOR (3 downto 0); 
signal RegEn : STD_LOGIC_VECTOR (2 downto 0);
signal Clk : STD_LOGIC;
signal Reset : STD_LOGIC := '0';
signal Reg0,Reg1,Reg2,Reg3,Reg4,Reg5,Reg6,Reg7 : STD_LOGIC_VECTOR (3 downto 0);
    
begin

UUT: Reg_Bank
port map(
 I => I,
 RegEn => RegEn,
 Clk => Clk,
 Reset => Reset,
 Reg0 => Reg0,
 Reg1 => Reg1,
 Reg2 => Reg2,
 Reg3 => Reg3,
 Reg4 => Reg4,
 Reg5 => Reg5,
 Reg6 => Reg6,
 Reg7 => Reg7
);


Clock : process
    begin
        clk<='0';
wait for 10ns;
 clk<='1';
wait for 10ns;
end process;

process
begin
   I <= "0110";
   RegEn <= "000";
   wait for 100ns;
   
   I <= "0110";
   RegEn <= "001";
   wait for 100ns;
   
   I <= "0110";
   RegEn <= "010";
   wait for 100ns;
   
   I <= "0110";
   RegEn <= "011";
   wait for 100ns;
   
   I <= "0110";
   RegEn <= "100";
   wait for 100ns;
   
   I <= "0110";
   RegEn <= "101";
   wait for 100ns;
      
   I <= "0110";
   RegEn <= "110";
   wait for 100ns;
         
    I <= "0110";
    RegEn <= "111";
    wait;



end process;

end Behavioral;
