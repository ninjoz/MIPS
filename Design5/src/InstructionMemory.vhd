library IEEE;
use IEEE.STD_LOGIC_1164.all;
use ieee.numeric_std.all;

entity InstructionMemory is
    port (
        ReadAddress : in std_logic_vector(31 downto 0);
        Instruction : out std_logic_vector(31 downto 0)
    );
end InstructionMemory;

architecture arch of InstructionMemory is
    type RAM_16_X_32 is array (15 downto 0) of std_logic_vector(31 downto 0);
    signal IM : RAM_16_X_32 := (
        x"01234567", --0x0040	  0000	  and
        x"89ABCDEF", --0x0040	  0004	  or
        x"FEDCBA98", --0x0040	  0008	  add
        x"76543210", --0x0040	  000c	  sub
        x"13579BDF", --0x0040	  0010	  slt
        x"2468ACE0", --0x0040	  0014	  beg
        x"A5A5A5A5", --0x0040	  0018	  and
        x"5A5A5A5A", --0x0040	  001c	  or
        x"01234567", --0x0040	  0020	  add
        x"89ABCDEF", --0x0040	  0024	  sub
        x"FEDCBA98", --0x0040	  0028	  slt
        x"76543210", --0x0040	  002c	  j
        x"13579BDF", --0x0040
        x"2468ACE0", --0x0040
        x"A5A5A5A5", --0x0040
        x"5A5A5A5A"  --0x0040
    );
begin
    Instruction <= IM(to_integer(unsigned(ReadAddress(3 downto 0))));
end architecture arch;

