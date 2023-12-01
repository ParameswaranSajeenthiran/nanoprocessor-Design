----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/23/2023 01:38:05 PM
-- Design Name: 
-- Module Name: TB_Instruction_Decoder - Behavioral
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

entity TB_Instruction_Decoder is
--  Port ( );
end TB_Instruction_Decoder;

architecture Behavioral of TB_Instruction_Decoder is



component Instruction_Decoder  port  
            ( instruction : in STD_LOGIC_VECTOR (11 downto 0);
           load_select : out STD_LOGIC;
           add_or_subtract : out STD_LOGIC ;
           intermidiate_value : out STD_LOGIC_VECTOR(3 downto 0);
           register_select_MUX_1 : out STD_LOGIC_VECTOR (2 downto 0);
           register_enable : out STD_LOGIC_VECTOR (2 downto 0);
           register_select_mux_2 : out STD_LOGIC_VECTOR (2 downto 0);
           disable_all_register : out STD_LOGIC ;
           address_to_jump : out STD_LOGIC_VECTOR (2 downto 0)  ;
           jump_flag : out STD_LOGIC;
           register_check_for_jump : in STD_LOGIC_VECTOR (3 downto 0));
           
end component;
signal instruction : STD_LOGIC_VECTOR (11 downto 0);
signal load_select,add_or_subtract,disable_all_register ,jump_flag: STD_LOGIC;
signal register_enable,register_select_mux_2,register_select_MUX_1,address_to_jump :STD_LOGIC_VECTOR (2 downto 0);
signal intermidiate_value ,register_check_for_jump :STD_LOGIC_VECTOR(3 downto 0);
 
begin
UUT : Instruction_Decoder  port map
( instruction=>instruction ,
           load_select=>load_select ,
           add_or_subtract=>add_or_subtract,
           intermidiate_value=>intermidiate_value,
           register_select_MUX_1=>register_select_MUX_1 ,
           register_enable=>register_enable ,
           register_select_mux_2=>register_select_mux_2 ,
           disable_all_register=>disable_all_register ,
           address_to_jump=>address_to_jump ,
           jump_flag=>jump_flag ,
           register_check_for_jump=>register_check_for_jump );
 process
  begin
  wait for 100ns;
  instruction <="100010001010";
  register_check_for_jump<="0000";
  wait for 100ns;
  wait for 100ns;
  instruction <="100100000001";
  register_check_for_jump<="0000";
  wait for 100ns;
  wait for 100ns;
  instruction <="010100000000";
  register_check_for_jump<="0000";
  wait for 100ns;
  wait for 100ns;
  instruction <="000010100000";
  register_check_for_jump<="0000";
  wait for 100ns;
  end process;


end Behavioral;
