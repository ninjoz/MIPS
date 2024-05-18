library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Clock_Generator_tb is  
end Clock_Generator_tb;

architecture Behavioral of Clock_Generator_tb is
    
    signal clk_out : STD_LOGIC;
    signal current_address_tb : STD_LOGIC_VECTOR (31 downto 0) := (others => '0'); -- Initialize current_address

    component mips is
        Port ( 
            clk_out : out STD_LOGIC
        );
    end component;

begin
    
    uut: mips
        Port map (
            clk_out => clk_out															 
        );

    tb_process : process
    begin
        
        -- Initialize current_address_tb here if needed
        
        wait for 100 ns;
        assert false report "Simulation Finished" severity note;
        wait;
    end process;
end Behavioral;
