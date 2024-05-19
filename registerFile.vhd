
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
    signal registers : reg_array := (
		"00000000000000000000000000000000", -- $zero
		"00000000110000010001110000100101", -- mem 1
        "11111100111111110000000001100010",
        x"00000003",
        "00011100000011110000000000111000",
        "00000000000000000000000000001110",
        "00000000000000000000000000001110",
        x"00000007",
        "00000000011000110000001110111100", 
        "00110000001111100000111000000011",
        "00000001111000000001110000001110", -- mem 10 
        "00001100001110001100001100111110", 
        "11000111110000000111111001110000",
        "01100000011100011110001111100001",
        "11000011111111110000000001111111",
        "01111110000000011111101000111000",
        "00000011111110000000111110000111",
        "11001100110011001100110000110010",
        "00001101101110010111011101100001",
        "00001110011110111111011101100100",  
        "00001100010110000111100111101101", -- mem 20
        "00001101111110110111000011111010",
        "00001100110110111111000011111010",
        "00001101101110111111100111110100",
        "00001110100110000111101001100001", 
        "00001100001110110011000011100001",
        "00001101101110000111011011100001",
        "00001100010110000111000101100001",
        "00001111010110111111110101101111",
        "00001100100110111111001001101111", 
        "00001100001110110011010011100001", -- mem 30
        "00001100001110010111100111101000" );
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
end Behavioral;
