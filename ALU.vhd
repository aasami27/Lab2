----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09/15/2025 08:00:55 AM
-- Design Name: 
-- Module Name: ALU - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ALU is
    Port ( A : in STD_LOGIC_VECTOR (1 downto 0);
           B : in STD_LOGIC_VECTOR (1 downto 0);
           S : in STD_LOGIC_VECTOR (3 downto 0);
           Y : out STD_LOGIC_VECTOR (3 downto 0));
end ALU;

architecture Behavioral of ALU is

signal A_signed : signed(2 downto 0);
signal B_signed : signed(2 downto 0);
signal A_unsigned : unsigned(1 downto 0);
signal B_unsigned : unsigned(1 downto 0);

begin

A_signed<= A(1)& signed(A);
A_unsigned<= unsigned(A);
B_signed<= B(1)& signed(B);
B_unsigned<= unsigned(B);


Y <= "0"& std_logic_vector(A_signed+B_signed) when S="0001" else
A(1) & std_logic_vector(shift_right(A_signed,to_integer(B_unsigned))) when S="0010" else
std_logic_vector(A_unsigned*B_unsigned) when S="0100" else
"00" & std_logic_vector(A xor B) when S="1000" else
"0001" when to_integer(A_unsigned) > to_integer(B_unsigned) else "0000";

end Behavioral;
