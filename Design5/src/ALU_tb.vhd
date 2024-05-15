library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

entity ALU_TB is
end ALU_TB;

architecture testbench of ALU_TB is
    -- Declare signals for testbench
    signal a1_tb       : std_logic_vector(31 downto 0) := (others => '0');
    signal a2_tb       : std_logic_vector(31 downto 0) := (others => '0');
    signal alu_control : std_logic_vector(2 downto 0) := (others => '0');
    signal alu_res     : std_logic_vector(31 downto 0);	
	
    
    -- Constants for ALU operation codes
    constant AND_OP    : std_logic_vector(2 downto 0) := "000";
    constant OR_OP     : std_logic_vector(2 downto 0) := "001";
    constant ADD_OP    : std_logic_vector(2 downto 0) := "010";
    constant SUB_OP    : std_logic_vector(2 downto 0) := "101";
    constant SLT_OP    : std_logic_vector(2 downto 0) := "011";
    constant NOR_OP    : std_logic_vector(2 downto 0) := "111";
    constant NOP_OP    : std_logic_vector(2 downto 0) := (others => '0');

begin

    -- Instantiate the ALU
    uut: entity work.ALU
        port map (
            a1              => a1_tb,
            a2              => a2_tb,
            alu_controller  => alu_control,
            alu_result      => alu_res
        );

    -- Stimulus process
    stimulus : process
    begin
        -- Test case 1: Bitwise AND
        a1_tb <= x"AAAAAAAA";  -- Input A
        a2_tb <= x"55555555";  -- Input B
        alu_control <= AND_OP; -- AND operation
        wait for 10 ns;
        
        -- Test case 2: Bitwise OR
        a1_tb <= x"AAAAAAAA";  -- Input A
        a2_tb <= x"55555555";  -- Input B
        alu_control <= OR_OP;  -- OR operation
        wait for 10 ns;
        
        -- Test case 3: Addition
        a1_tb <= x"AAAAAAAA";  -- Input A
        a2_tb <= x"55555555";  -- Input B
        alu_control <= ADD_OP; -- Addition operation
        wait for 10 ns;
        
        -- Test case 4: Subtraction
        a1_tb <= x"AAAAAAAA";  -- Input A
        a2_tb <= x"55555555";  -- Input B
        alu_control <= SUB_OP; -- Subtraction operation
        wait for 10 ns;
        
        -- Test case 5: Set Less Than
        a1_tb <= x"AAAAAAAA";  -- Input A
        a2_tb <= x"55555555";  -- Input B
        alu_control <= SLT_OP; -- Set Less Than operation
        wait for 10 ns;
        
        -- Test case 6: Logical NOR
        a1_tb <= x"AAAAAAAA";  -- Input A
        a2_tb <= x"55555555";  -- Input B
        alu_control <= NOR_OP; -- NOR operation
        wait for 10 ns;
        
        -- Test case 7: NOP
        a1_tb <= x"AAAAAAAA";  -- Input A
        a2_tb <= x"55555555";  -- Input B
        alu_control <= NOP_OP; -- NOP operation
        wait for 10 ns;
        
        wait;
    end process stimulus;

end testbench;
