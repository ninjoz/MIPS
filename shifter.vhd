---------------------------------------------------------------------------------------------------
--
-- Title       : shifter
-- Design      : design7
-- Author      : HP
-- Company     : HP lnc
--
---------------------------------------------------------------------------------------------------
--
-- File        : shifter.vhd
-- Generated   : Fri May 17 19:13:39 2024
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
--{entity {shifter} architecture {shifter}}

library IEEE;
use IEEE.STD_LOGIC_1164.all;   
use IEEE.numeric_std.all;


entity shifter is	  
	   generic (n1: natural:= 32; n2: natural:= 32; k: natural:= 2);
	port (
		x: in std_logic_vector(n1-1 downto 0);
		y: out std_logic_vector(n2-1 downto 0)
	);
	
end shifter;

--}} End of automatically maintained section

architecture shifter of shifter is

	signal temp: std_logic_vector(n2-1 downto 0);

	begin
	temp <= std_logic_vector(resize(unsigned(x), n2)); 
	y <= std_logic_vector(shift_left(signed(temp), k));

end shifter;
