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
    type RAM_16_X_32 is array (0 to 15) of std_logic_vector(31 downto 0);
    signal IM : RAM_16_X_32 := (
        "00000000000000010001000000000000",		--00011000										   --0
		"00000000001000100001100000000010",		--00221802										   --1
		"00000000000000100001100000000101",		--00021805										   --2
		"00000000001000000001100000000001", 	--00201801										   --3
        "00001000000000010000000000000000", --sw, address: 0 + 0, data: from 1		--08010000	   --4
        "00000100000000100000000000000000", --lw, address: 0 + 0, data: to 2		--04020000	   --5
        "00000000101001100001100000000101", --sub 5, 6 => 3							--00A61805	   --6
        "00000000101001000000100000000001", --5 or 4 > 1							--00A40801	   --7
        "00000000111001000000100000000010", --add 7 , 4 > 1							--00E40802	   --8
        "00001000000000110000000000000000", --sw, address: 0 + 0, data: from 3		--08030000	   --9
        "00000000111001000001100000000010", --add 7 , 4 > 3							--00E41802	   --10
        "00000000011001000001000000000001", --or 3, 4 > 2							--00641001	   --11
        "00001000000000100000000000000000", --sw, address: 0 + 0, data: from 2		--08020000	   --12
        "00000000101001100001100000000000", --and 5, 6 => 3							--00A61800	   --13
        "00000000111001000001100000000000", --and 7, 4 > 3							--00E41800	   --14
        "00000000111000110010100000000010"  --add 7, 4 > 3							--00E41802	   --15
    );
begin
    Instruction <= IM(to_integer(unsigned(ReadAddress(3 downto 0))));
end architecture behavioral;
