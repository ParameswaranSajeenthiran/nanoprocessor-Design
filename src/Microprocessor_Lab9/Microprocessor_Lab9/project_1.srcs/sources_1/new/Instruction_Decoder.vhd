----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/23/2023 01:32:28 PM
-- Design Name: 
-- Module Name: Instruction_Decoder - Behavioral
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

entity Instruction_Decoder is
    Port ( instruction : in STD_LOGIC_VECTOR (11 downto 0);
           register_check_for_jump : in STD_LOGIC_VECTOR (3 downto 0);
           load_select : out STD_LOGIC;
           immediate_value : out STD_LOGIC_VECTOR (3 downto 0);
           register_enable : out STD_LOGIC_VECTOR (2 downto 0);
           register_select_mux_1 : out STD_LOGIC_VECTOR (2 downto 0);
           register_select_mux_2 : out STD_LOGIC_VECTOR (2 downto 0);
           add_or_subtract : out STD_LOGIC;
           jump_flag : out STD_LOGIC;
           address_to_jump : out STD_LOGIC_VECTOR (2 downto 0));
end Instruction_Decoder;

architecture Behavioral of Instruction_Decoder is

begin

process (instruction,register_check_for_jump) is
begin
  if (instruction(11 downto 10 )="10") then
    register_enable<=instruction(9 downto 7 );
    immediate_value<=instruction (3 downto 0);
    load_select<='0'; -- we define this , when load_slect =0 chose intermidiate value ;
    register_select_MUX_1<=instruction(9 downto 7 );--default , no need for this case ,ignore it;
    register_select_mux_2<=instruction(9 downto 7 );--default , no need for this case ,ignore it;
    add_or_subtract<='0'; --default , no need for this case ,ignore it;
    jump_flag<='0';
         
  elsif ((instruction(11 downto 10 )="00")) then -- add and store 
    register_enable<=instruction(9 downto 7 );    
    immediate_value<=instruction (3 downto 0);
    load_select<='1'; -- we define this , when load_slect =0 chose intermidiate value ;
    register_select_MUX_1<=instruction(9 downto 7 );--default , no need for this case ,ignore it;
    register_select_mux_2<=instruction(6 downto 4 );--default , no need for this case ,ignore it;
    add_or_subtract<='0'; --select add operation 
    jump_flag<='0';

  elsif ((instruction(11 downto 10 )="01")) then -- complement case 
    register_enable<=instruction(9 downto 7 );-- fetch register address;
    immediate_value<=instruction (3 downto 0);--default , no need for this case ,ignore it;
    load_select<='1'; --default , no need for this case ,ignore it;
    register_select_MUX_1<= "000";--default , no need for this case ,ignore it;
    register_select_mux_2<= instruction( 9 downto 7);--default , no need for this case ,ignore it;
    add_or_subtract<='1'; --default , no need for this case ,ignore it;
    jump_flag<='0';
    
    

   else --"11" -- jump case 
   
    register_enable<=instruction(9 downto 7 );
   
    immediate_value<=instruction (3 downto 0);
    load_select<='1'; --default , no need for this case ,ignore it;
    register_select_MUX_1<=instruction(9 downto 7 );--default , no need for this case ,ignore it;
    register_select_mux_2<="000";--default , no need for this case ,ignore it;
    add_or_subtract<='0'; --default , no need for this case ,ignore it;
    if ( register_check_for_jump ="0000") then 
        address_to_jump<=instruction(2 downto 0 );
        jump_flag<='1';
     else 
        jump_flag<='0';
        address_to_jump<="000"; --default , no need for this case ,ignore it;
        
      end if ;
    
    
   
  end if;
 
end process;




end Behavioral;
