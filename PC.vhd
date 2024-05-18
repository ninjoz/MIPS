library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity PC is  
	Port ( clk : in  STD_LOGIC;	 
           address_to_load : in  STD_LOGIC_VECTOR (31 downto 0);
           current_address : out  STD_LOGIC_VECTOR (31 downto 0));
end PC;										 

architecture behavioral of PC is
begin

	process(clk)
	begin
		if(clk'event and clk='1') then
			current_address<=address_to_load;
		end if;
	end process;

end behavioral;