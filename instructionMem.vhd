library IEEE;
use IEEE.STD_LOGIC_1164.all;
use ieee.numeric_std.all;

entity InstructionMemory is
    port (
        ReadAddress : in std_logic_vector(31 downto 0);
        Instruction : out std_logic_vector(31 downto 0)
    );
end InstructionMemory;

architecture behavioral of InstructionMemory is
    type RAM_16_X_32 is array (15 downto 0) of std_logic_vector(31 downto 0);
    signal IM : RAM_16_X_32 := (
        "00000000000000010001000000000000",
	"00000000001000100001100000000010",
	"00000000000000100001100000000101",
	"00000000001000000001100000000001", 
        "00001000000000010000000000000000", --sw, address: 0 + 0, data: from 1
        "00000100000000100000000000000000", --lw, address: 0 + 0, data: to 2
        "00000000101001100001100000000101", --sub 5, 6 => 3
        "00000000101001000000100000000001", --5 or 4 > 1
        "00000000111001000000100000000010", --add 7 , 4 > 1
        "00001000000000110000000000000000", --sw, address: 0 + 0, data: from 3
        "00000000111001000001100000000010", --add 7 , 4 > 3
        "00000000011001000001000000000001", --or 3, 4 > 2
        "00001000000000100000000000000000", --sw, address: 0 + 0, data: from 2
        "00000000101001100001100000000000", --and 5, 6 => 3
        "00000000111001000001100000000000", --and 7, 4 > 3
        "00000000111001000001100000000010"  --add 7, 4 > 3
    );
begin
    Instruction <= IM(to_integer(unsigned(ReadAddress(3 downto 0))));
end architecture behavioral;
