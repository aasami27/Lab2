----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09/23/2025 03:47:10 PM
-- Design Name: 
-- Module Name: ALU_tb - Behavioral
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

entity ALU_tb is
--  Port ( );
end ALU_tb;

architecture Behavioral of ALU_tb is 

component ALU
    port (
     A : in STD_LOGIC_VECTOR (1 downto 0);
     B : in STD_LOGIC_VECTOR (1 downto 0);
     S : in STD_LOGIC_VECTOR (3 downto 0);
     Y : out STD_LOGIC_VECTOR(3 downto 0)
    );
end component;

signal A_tb : STD_LOGIC_VECTOR(1 downto 0);
signal B_tb : STD_LOGIC_VECTOR(1 downto 0);
signal S_tb : STD_LOGIC_VECTOR(3 downto 0);
signal Y_tb : STD_LOGIC_VECTOR(3 downto 0);

begin

uut: ALU
    port map(
        A=>A_tb,
        B=>B_tb,
        S=>S_tb,
        Y=>Y_tb
        
    );
    
stim_proc: process

begin
wait for 100ns;

A_tb<="01";
B_tb<="01";
S_tb<="0001";

wait for 100ns;

    A_tb <= "10";
    B_tb <= "01"; 
    S_tb <= "0010"; 
    
wait for 100ns;
    A_tb <= "10";
    B_tb <= "10"; 
    S_tb <= "0100"; 
    
wait for 100ns;
    A_tb <= "10";
    B_tb <= "10"; 
    S_tb <= "1000"; 
    
wait for 100ns;
    A_tb <= "10";
    B_tb <= "00"; 
    S_tb <= "0000";    

wait;

end process stim_proc;

end Behavioral;
