----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/23/2023 02:32:24 PM
-- Design Name: 
-- Module Name: Microprocessor - Behavioral
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

entity Microprocessor is
    Port ( Reset : in STD_LOGIC;
           Clk : in STD_LOGIC;
           Led_7_Seg : out STD_LOGIC_VECTOR (6 downto 0);
           AN : out STD_LOGIC_VECTOR (3 downto 0);
           Overflow : out STD_LOGIC;
           Zero : out STD_LOGIC;
           Reg_7_output : out STD_LOGIC_VECTOR(3 downto 0));
           
end Microprocessor;

architecture Behavioral of Microprocessor is

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

component ROM
    Port ( address : in STD_LOGIC_VECTOR (2 downto 0);
           instruction : out STD_LOGIC_VECTOR (11 downto 0));
end component;

component Instruction_Decoder
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
end component;

component Program_Counter
    Port ( Res : in STD_LOGIC;
           Clk : in STD_LOGIC;
           D_IN : in STD_LOGIC_VECTOR (2 downto 0);
           Q : out STD_LOGIC_VECTOR (2 downto 0));
end component;



component Add_Sub_4bit
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           B : in STD_LOGIC_VECTOR (3 downto 0);
           Cin : in STD_LOGIC;
           M : in STD_LOGIC;
           S : out STD_LOGIC_VECTOR (3 downto 0);
           Cout : out STD_LOGIC;
           Zero : out STD_LOGIC);
end component;

component Add_3bit
    Port ( A : in STD_LOGIC_VECTOR (2 downto 0);
           B : in STD_LOGIC_VECTOR (2 downto 0);
           Cin : in STD_LOGIC;
           S : out STD_LOGIC_VECTOR (2 downto 0);
           Cout : out STD_LOGIC);
end component;

component MUX_8_to_1_4bit
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
end component;

component MUX_2_to_1_4bit
    Port ( load_select : in STD_LOGIC;
           D0 : in STD_LOGIC_VECTOR (3 downto 0);
           D1 : in STD_LOGIC_VECTOR (3 downto 0);
           Y : out STD_LOGIC_VECTOR (3 downto 0));

end component;

component MUX_2_to_1_3bit
    Port ( D0 : in STD_LOGIC_VECTOR (2 downto 0);
           D1 : in STD_LOGIC_VECTOR (2 downto 0);
           S : in STD_LOGIC;
           Y : out STD_LOGIC_VECTOR (2 downto 0));
end component;

component Slow_Clk
        Port ( Clk_in : in STD_LOGIC;
               Clk_out : out STD_LOGIC);     
end component;

component LUT_16_7
    Port ( address : in STD_LOGIC_VECTOR (3 downto 0);
           data : out STD_LOGIC_VECTOR (6 downto 0));
end component;
    
signal data: STD_LOGIC_VECTOR (6 downto 0);
signal Reg_In,Reg0,Reg1,Reg2,Reg3,Reg4,Reg5,Reg6,Reg7,immediate_value,add_sub_output,Y0,Y1,address: STD_LOGIC_VECTOR (3 downto 0);
signal RegEn,memory_select,Program_Counter_In,address_to_jump,Add_3bit_output,A,B : STD_LOGIC_VECTOR (2 downto 0);
signal instruction : STD_LOGIC_VECTOR (11 downto 0);
signal load_select,add_or_subtract,jump_flag,Cout,slow_clock : STD_LOGIC;


begin

Reg_Bank_0 : Reg_Bank
port map(
I => Reg_In,
RegEn => RegEn,
Clk => slow_clock,
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

ROM_0 : ROM
port map(
address => memory_select,
instruction => instruction
);

Program_Counter_0 : Program_Counter
port map(
Res => Reset,
Clk => slow_clock,
D_IN => Program_Counter_In,
Q => memory_select
);

Instruction_Decoder_0 : Instruction_Decoder
port map(
instruction => instruction,
register_check_for_jump => Y0,
load_select => load_select,
immediate_value => immediate_value,
register_enable => RegEn,
register_select_mux_1 => A,
register_select_mux_2 => B,
add_or_subtract => add_or_subtract,
jump_flag => jump_flag,
address_to_jump => address_to_jump

);

Add_3bit_0 : Add_3bit
port map(
A => memory_select,
B => "001",
Cin => '0',
S => Add_3bit_output,
Cout => Cout
);

MUX_2_to_1_3bit_0 : MUX_2_to_1_3bit
port map(
D0 => Add_3bit_output,
D1 => address_to_jump,
S => jump_flag,
Y => Program_Counter_In
);

MUX_2_TO_1_4bit_0: MUX_2_TO_1_4bit
port map(
load_select => load_select,
D0 => immediate_value,
D1 => add_sub_output,
Y => Reg_In
);

Add_Sub_4bit_0: Add_Sub_4bit
port map(
A => Y0,
B => Y1,
Cin => add_or_subtract,
M => add_or_subtract,
S => add_sub_output,
Cout => Overflow,
Zero => Zero

);

MUX_8_to_1_4bit_0 : MUX_8_to_1_4bit
port map(
D0 => Reg0,
D1 => Reg1,
D2 => Reg2,
D3 => Reg3,
D4 => Reg4,
D5 => Reg5,
D6 => Reg6,
D7 => Reg7,
S => A,
Y => Y0

);

MUX_8_to_1_4bit_1 : MUX_8_to_1_4bit
port map(
D0 => Reg0,
D1 => Reg1,
D2 => Reg2,
D3 => Reg3,
D4 => Reg4,
D5 => Reg5,
D6 => Reg6,
D7 => Reg7,
S => B,
Y => Y1
);

Slow_Clk_0 : Slow_Clk 
    port map (
        Clk_in => Clk,
        Clk_out => slow_clock);
            
LUT_16_7_0 : LUT_16_7
                Port map(
                    address => Reg7,
                    data => Led_7_Seg
                );     
           
AN <= "1110";
Reg_7_output <= Reg7;

end Behavioral;
