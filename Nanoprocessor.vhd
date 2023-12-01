----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/07/2022 04:06:39 PM
-- Design Name: 
-- Module Name: NanoProcessor - Behavioral
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

--entity NanoProcessor is
--  Port ( Clk: in STD_LOGIC;
--         Res : in STD_LOGIC;
----         Load : in STD_LOGIC;
--         Halt : in STD_LOGIC
--  );
--end NanoProcessor;

entity NanoProcessor is
  Port ( Clk: in STD_LOGIC;
         Res : in STD_LOGIC;
         Halt : in STD_LOGIC;
         Zero : out STD_LOGIC;
         Overflow : out STD_LOGIC;
         R0 : out STD_LOGIC_VECTOR (3 DOWNTO 0);
         R1 : out STD_LOGIC_VECTOR (3 DOWNTO 0);
         R2 : out STD_LOGIC_VECTOR (3 DOWNTO 0);
         R3 : out STD_LOGIC_VECTOR (3 DOWNTO 0);
         R4 : out STD_LOGIC_VECTOR (3 DOWNTO 0);
         R5 : out STD_LOGIC_VECTOR (3 DOWNTO 0);
         R6 : out STD_LOGIC_VECTOR (3 DOWNTO 0);
         R7 : out STD_LOGIC_VECTOR (3 DOWNTO 0)
  );
end NanoProcessor;

architecture Behavioral of NanoProcessor is

component Adder_3_Bit
    Port ( A : in STD_LOGIC_VECTOR (2 downto 0);
           C_in : in STD_LOGIC;
           S : out STD_LOGIC_VECTOR (2 downto 0);
           C_out : out STD_LOGIC
           );
end component;

component ProgramCounter
    Port ( D : in STD_LOGIC_VECTOR (2 downto 0);
           Clk : in STD_LOGIC;
           Res: in STD_LOGIC;  -- SIGNAL TO RESET
           Load : in STD_LOGIC; -- SIGNAL TO LOAD 
           Q : out STD_LOGIC_VECTOR (2 downto 0));
end component;

component twoWay_3Bit_Mux
    Port ( AdderIn : in STD_LOGIC_VECTOR (2 downto 0);
           JumpAdd : in STD_LOGIC_VECTOR (2 downto 0);
           Jump : in STD_LOGIC;
           PC_in : out STD_LOGIC_VECTOR (2 downto 0));
end component;

--component Slow_Clk is
--    Port ( Clk_in : in STD_LOGIC;
--           Clk_out : out STD_LOGIC);
--end component;

component Reg_Bank
  Port (
        Reg_En: in STD_LOGIC_VECTOR (2 DOWNTO 0);
        EN : in STD_LOGIC;
        A : in STD_LOGIC_VECTOR (3 DOWNTO 0);
        Clk : in STD_LOGIC;
        RESET_REG_BANK : in STD_LOGIC;
        B0 : out STD_LOGIC_VECTOR (3 DOWNTO 0);
        B1 : out STD_LOGIC_VECTOR (3 DOWNTO 0);
        B2 : out STD_LOGIC_VECTOR (3 DOWNTO 0);
        B3 : out STD_LOGIC_VECTOR (3 DOWNTO 0);
        B4 : out STD_LOGIC_VECTOR (3 DOWNTO 0);
        B5 : out STD_LOGIC_VECTOR (3 DOWNTO 0);
        B6 : out STD_LOGIC_VECTOR (3 DOWNTO 0);
        B7 : out STD_LOGIC_VECTOR (3 DOWNTO 0) 
  );
end component;

component Mux_2_to_4
    Port ( 
        S : in STD_LOGIC;
        D_0: in STD_LOGIC_VECTOR (3 downto 0);
        D_1: in STD_LOGIC_VECTOR (3 downto 0);
        Y: out STD_LOGIC_VECTOR (3 downto 0);
        EN : in STD_LOGIC
    );
end component;

--component Program_ROM
--    Port ( Mem_address : in STD_LOGIC_VECTOR (2 downto 0);
--       Instruction : out STD_LOGIC_VECTOR (11 downto 0));
--end component;

component ProgramRomAdd
    Port ( Mem_address : in STD_LOGIC_VECTOR (2 downto 0);
       Instruction : out STD_LOGIC_VECTOR (11 downto 0));
end component;

component Instruction_decoder
    Port ( Instruction : in STD_LOGIC_VECTOR (11 downto 0);
           Reg_en : out STD_LOGIC_VECTOR (2 downto 0);
           Load_sel : out STD_LOG…