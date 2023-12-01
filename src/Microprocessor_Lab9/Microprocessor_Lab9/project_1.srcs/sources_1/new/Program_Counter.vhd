----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/23/2023 01:53:48 PM
-- Design Name: 
-- Module Name: Program_Counter - Behavioral
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

entity Program_Counter is
    Port ( Res : in STD_LOGIC;
           Clk : in STD_LOGIC;
           D_IN : in STD_LOGIC_VECTOR (2 downto 0);
           Q : out STD_LOGIC_VECTOR (2 downto 0):= "000");
end Program_Counter;

architecture Behavioral of Program_Counter is

COMPONENT D_FF
        PORT(D : IN STD_LOGIC;
             Res : IN STD_LOGIC;
             Clk : IN STD_LOGIC;
             Q : OUT STD_LOGIC ;
             Qbar : OUT STD_LOGIC );
    END COMPONENT;
    
        

    
    SIGNAL Q0, Q1, Q2 : STD_LOGIC;
    SIGNAL D0, D1, D2 : STD_LOGIC;
    SIGNAL Clk_slow : STD_LOGIC;  -- INTERNAL CLOCK
    SIGNAL D  : STD_LOGIC_VECTOR (2 downto 0) := "000";
    SIGNAL count : integer :=0;

begin

--begin
process (Clk) begin 
    if(rising_edge(Clk)) then
   
    if(Res='1')
        then 
        Q<="000";
        count<=0;
        
        else 
        if (D_IN="000") then 
           
         else 
         if(count=1)then 
            count<=0;
            Q<=D_IN;
            
         else 
            count<=1;
         end if;       

        end if;
        end if;
        
    end if ;
end process;

end Behavioral;
