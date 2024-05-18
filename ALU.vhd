library IEEE;
use IEEE.STD_LOGIC_1164.all;
use ieee.numeric_std.all;	 

entity ALU is  
    port (
        a1: in std_logic_vector(31 downto 0);
        a2: in std_logic_vector(31 downto 0);
        alu_controller: in std_logic_vector(2 downto 0);
        alu_result: out std_logic_vector(31 downto 0);
        zero: out std_logic
    ); 
end ALU;

architecture arch of ALU is  
    signal resultX: std_logic_vector(31 downto 0);
    signal zero_internal: std_logic;
begin  
    process (a1, a2, alu_controller)  
    begin 
        case alu_controller is
            when "000" =>    -- bitwise And 
                resultX <= a1 and a2;
            when "001" =>    -- bitwise Or 
                resultX <= a1 or a2;
            when "010" =>    -- addition 	 
                resultX <= std_logic_vector(unsigned(a1) + unsigned(a2));
            when "101" =>    -- Subtract 
                resultX <= std_logic_vector(unsigned(a1) - unsigned(a2));
            when "011" =>    -- Set less than 
                if unsigned(a1) < unsigned(a2) then
                    resultX <= x"00000001";
                else 
                    resultX <= x"00000000";
                end if;
            when "111" =>    -- logical Nor
                resultX <= not (a1 or a2);
            when others =>   -- Nop
                resultX <= x"00000000";
        end case;
    end process;

    -- Calculate 'zero' outside the process
    zero_internal <= '1' when resultX = x"00000000" else '0';
    
    alu_result <= resultX;
    zero <= zero_internal;  -- Assign the internal 'zero' signal to the output 'zero'
end arch;
