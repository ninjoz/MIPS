---------------------------------------------------------------------------------------------------
--
-- Title       : PC
-- Design      : design7
-- Author      : HP
-- Company     : HP lnc
--
---------------------------------------------------------------------------------------------------
--
-- File        : PC.vhd
-- Generated   : Fri May 17 19:21:21 2024
-- From        : interface description file
-- By          : Itf2Vhdl ver. 1.20
--
---------------------------------------------------------------------------------------------------
--
-- Description : 
--
---------------------------------------------------------------------------------------------------

--{{ Section below this comment is automatically maintained
--   and may be overwritten
--{entity {PC} architecture {PC}}

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity PC is  
	Port ( clk : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           address_to_load : in  STD_LOGIC_VECTOR (31 downto 0);
           current_address : out  STD_LOGIC_VECTOR (31 downto 0));
end PC;

--}} End of automatically maintained section

architecture PC of PC is
begin

	 process(clk,reset)
	begin
		if(reset='1') then
				current_address <= (others=>'0');
		elsif(clk'event and clk='1') then
			current_address<=address_to_load;
		end if;
	end process;

end PC;
