library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity RegisterFile is
    Port ( clk : in  STD_LOGIC;
           reg_write : in  STD_LOGIC;
           read_reg1, read_reg2, write_reg : in  STD_LOGIC_VECTOR(4 downto 0);
           write_data : in  STD_LOGIC_VECTOR(31 downto 0);
           read_data1, read_data2 : out  STD_LOGIC_VECTOR(31 downto 0));
end RegisterFile;

architecture Behavioral of RegisterFile is
    type reg_array is array (0 to 31) of STD_LOGIC_VECTOR(31 downto 0); -- 32 32-bit registers
    signal registers : reg_array := (others => (others => '0')); -- Initialize all registers to zero
begin
    process (clk)
    begin
        if (clk='1' and clk'event) then
            -- Write operation
            if reg_write = '1' then
                registers(conv_integer(write_reg)) <= write_data;
            end if;
        end if;
    end process;  
	process(read_reg1, read_reg2)
	begin
		if( conv_integer(read_reg1)=0) then read_data1<=x"00000000";
		else read_data1<=registers(conv_integer(read_reg1));
		end if;
		if(conv_integer(read_reg2)=0) then read_data2<=x"00000000";
		else read_data2<=registers(conv_integer(read_reg2));
		end if;
	end process;

    -- Read operation
    --read_data1 <= registers(conv_integer(read_reg1));
    --read_data2 <= registers(conv_integer(read_reg2));

end Behavioral;
