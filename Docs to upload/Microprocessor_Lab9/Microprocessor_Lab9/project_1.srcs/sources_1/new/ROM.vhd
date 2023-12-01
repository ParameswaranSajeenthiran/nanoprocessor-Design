----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/17/2023 02:54:57 PM
-- Design Name: 
-- Module Name: ROM - Behavioral
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
use ieee.numeric_std.all; 

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ROM is
    Port ( address : in STD_LOGIC_VECTOR (2 downto 0);
           instruction : out STD_LOGIC_VECTOR (11 downto 0));
end ROM;

architecture Behavioral of ROM is

type rom_type is array (0 to 7) of std_logic_vector(11 downto 0);

--signal ROM : rom_type := (

--"100010001010", --MOVI R1, 10
--"100100000001", --MOVI R2, 1
--"010100000000", --NEG R2 
--"000010100000", --ADD R1, R2
--"110010000111", --JZR R1, 7
--"110000000011"  --JZR R0, 3 
--);

signal ROM : rom_type := (
"101110000011", --MOVI R7, 3    -0
"100010000011", --MOVI R1, 3    -1
"100100000001", --MOVI R2, 1    -2
"010100000000", --NEG R2        -3
"000010100000", --ADD R1, R2    -4
"001110010000", --ADD R7, R1    -5
"110010000110", --JZR R1, 6     -6
"110000000100" --JZR R0, 4      -7
);

--optimzed assembly program
--signal ROM : rom_type := (
--"101110000011", --MOVI R7, 3    -0
--"100010000001", --MOVI R1, 1    -1
--"100100000010", --MOVI R2, 2    -2

--"001110100000", --ADD R7, R2    -4
--"001110010000", --ADD R7, R1    -4
--"000000000000",
--"000000000000",
--"000000000000"

--);

begin
instruction <= ROM(to_integer(unsigned(address)));


end Behavioral;
