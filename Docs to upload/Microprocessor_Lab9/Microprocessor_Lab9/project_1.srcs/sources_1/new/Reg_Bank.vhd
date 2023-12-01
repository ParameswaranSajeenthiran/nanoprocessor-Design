----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/18/2023 11:16:11 PM
-- Design Name: 
-- Module Name: Reg_Bank - Behavioral
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

entity Reg_Bank is
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
end Reg_Bank;

architecture Behavioral of Reg_Bank is

component Reg
    Port ( D : in STD_LOGIC_VECTOR (3 downto 0);
           En : in STD_LOGIC;
           Res : in STD_LOGIC;
           Clk : in STD_LOGIC;
           Q : out STD_LOGIC_VECTOR (3 downto 0));
end component;

component Decoder_3_to_8
    Port ( I : in STD_LOGIC_VECTOR (2 downto 0);
           EN : in STD_LOGIC;
           Y : out STD_LOGIC_VECTOR (7 downto 0));
end component;

signal RegENBus : STD_LOGIC_VECTOR (7 downto 0);

begin

Decoder_3_8_0 : Decoder_3_to_8
 port map(
 I => RegEn,
 EN => '1',
 Y => RegENBus
 );
 
 Reg_0 : Reg
 port map(
 D => "0000",
 EN => '1',
 Res => Reset,
 Clk => Clk,
 Q => Reg0
 );
 
 Reg_1 : Reg
  port map(
  D => I,
  EN => RegENBus(1),
  Res => Reset,
  Clk => Clk,
  Q => Reg1
  );
  
  Reg_2 : Reg
   port map(
   D => I,
   EN => RegENBus(2), 
   Res => Reset,
   Clk => Clk,
   Q => Reg2
   );
   
   Reg_3 : Reg
    port map(
    D => I,
    EN => RegENBus(3),
    Res => Reset,
    Clk => Clk,
    Q => Reg3
    );
    
    Reg_4 : Reg
     port map(
     D => I,
     EN => RegENBus(4),
     Res => Reset,
     Clk => Clk,
     Q => Reg4
     );
     
     Reg_5 : Reg
      port map(
      D => I,
      EN => RegENBus(5),
      Res => Reset,
      Clk => Clk,
      Q => Reg5
      );
      
      Reg_6 : Reg
       port map(
       D => I,
       EN => RegENBus(6),
       Res => Reset,
       Clk => Clk,
       Q => Reg6
       );
       
       Reg_7 : Reg
        port map(
        D => I,
        EN => RegENBus(7),
        Res => Reset,
        Clk => Clk,
        Q => Reg7
        );
  


end Behavioral;
