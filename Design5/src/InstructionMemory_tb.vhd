
		   library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity InstructionMemory_tb is
end InstructionMemory_tb;

architecture behavior of InstructionMemory_tb is

    -- Component Declaration for the Unit Under Test (UUT)
    component InstructionMemory
        port(
            ReadAddress : in std_logic_vector(31 downto 0);
            Instruction : out std_logic_vector(31 downto 0)
        );
    end component;

    -- Inputs
    signal ReadAddress : std_logic_vector(31 downto 0) := (others => '0');

    -- Outputs
    signal Instruction : std_logic_vector(31 downto 0);

begin

    -- Instantiate the Unit Under Test (UUT)
    uut: InstructionMemory
        port map (
            ReadAddress => ReadAddress,
            Instruction => Instruction
        );

    -- Stimulus process
    stim_proc: process
    begin
        -- Hold reset state for 100 ns.
        wait for 100 ns;

        -- Test different read addresses
        ReadAddress <= x"00000000";
        wait for 10 ns;
        assert Instruction = x"01234567" report "Test failed for address 0x00000000" severity error;

        ReadAddress <= x"00000004";
        wait for 10 ns;
        assert Instruction = x"89ABCDEF" report "Test failed for address 0x00000004" severity error;

        ReadAddress <= x"00000008";
        wait for 10 ns;
        assert Instruction = x"FEDCBA98" report "Test failed for address 0x00000008" severity error;

        ReadAddress <= x"0000000C";
        wait for 10 ns;
        assert Instruction = x"76543210" report "Test failed for address 0x0000000C" severity error;

        ReadAddress <= x"00000010";
        wait for 10 ns;
        assert Instruction = x"13579BDF" report "Test failed for address 0x00000010" severity error;

        ReadAddress <= x"00000014";
        wait for 10 ns;
        assert Instruction = x"2468ACE0" report "Test failed for address 0x00000014" severity error;

        ReadAddress <= x"00000018";
        wait for 10 ns;
        assert Instruction = x"A5A5A5A5" report "Test failed for address 0x00000018" severity error;

        ReadAddress <= x"0000001C";
        wait for 10 ns;
        assert Instruction = x"5A5A5A5A" report "Test failed for address 0x0000001C" severity error;

        ReadAddress <= x"00000020";
        wait for 10 ns;
        assert Instruction = x"01234567" report "Test failed for address 0x00000020" severity error;

        ReadAddress <= x"00000024";
        wait for 10 ns;
        assert Instruction = x"89ABCDEF" report "Test failed for address 0x00000024" severity error;

        ReadAddress <= x"00000028";
        wait for 10 ns;
        assert Instruction = x"FEDCBA98" report "Test failed for address 0x00000028" severity error;

        ReadAddress <= x"0000002C";
        wait for 10 ns;
        assert Instruction = x"76543210" report "Test failed for address 0x0000002C" severity error;

        -- Test done
        wait;
    end process;

end behavior;
