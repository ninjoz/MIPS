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
        x"13579BDF", 
        x"2468ACE0", 
        x"A5A5A5A5", 
        x"5A5A5A5A", 
        x"01234567", 
        x"89ABCDEF", 
        x"FEDCBA98", 
        x"76543210", 
        x"13579BDF", 
        x"2468ACE0", 
        x"A5A5A5A5", 
        x"5A5A5A5A"  
    );
begin
    Instruction <= IM(to_integer(unsigned(ReadAddress(3 downto 0))));
end architecture behavioral;
