library ieee;
use IEEE.STD_LOGIC_1164.all;

entity Mux_tb is
end Mux_tb;

architecture testbench of Mux_tb is
    -- Constants
    constant N : integer := 32;
    
    -- Signals
    signal Mux_in0_tb : std_logic_vector(N-1 downto 0);
    signal Mux_in1_tb : std_logic_vector(N-1 downto 0);
    signal Mux_ctl_tb : std_logic;
    signal Mux_out_tb : std_logic_vector(N-1 downto 0);
    
    -- Component declaration
    component Mux
        port (
            Mux_in0 : in std_logic_vector(N-1 downto 0);
            Mux_in1 : in std_logic_vector(N-1 downto 0);
            Mux_ctl : in std_logic;
            Mux_out : out std_logic_vector(N-1 downto 0)
        );
    end component;
    
begin
    
    -- Instantiate the Mux component
    UUT: Mux
        port map (
            Mux_in0 => Mux_in0_tb,
            Mux_in1 => Mux_in1_tb,
            Mux_ctl => Mux_ctl_tb,
            Mux_out => Mux_out_tb
        );
        
    -- Stimulus process
    stim_proc: process
    begin
        -- Test case 1: Mux_ctl = '0'
        Mux_ctl_tb <= '0';
        Mux_in0_tb <= (others => '0'); -- Set input 0 to all zeros
        Mux_in1_tb <= (others => '1'); -- Set input 1 to all ones
        wait for 10 ns;
        
        -- Test case 2: Mux_ctl = '1'
        Mux_ctl_tb <= '1';
        Mux_in0_tb <= (others => '1'); -- Set input 0 to all ones
        Mux_in1_tb <= (others => '0'); -- Set input 1 to all zeros
        wait for 10 ns;
        
        -- Additional test cases can be added here
        
        wait;
    end process;
    
end testbench;
