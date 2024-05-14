---------------------------------------------------------------------------------------------------
--
-- Title       : signex
-- Design      : design7
-- Author      : HP
-- Company     : HP lnc
--
---------------------------------------------------------------------------------------------------
--
-- File        : signex.vhd
-- Generated   : Tue May 14 02:09:29 2024
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
--{entity {signex} architecture {signex}}

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity signex is 
	port(  
	instruction :in std_logic_vector( 15 downto 0);
	output: out std_logic_vector(31 downto 0)
	);
	
end signex;


architecture signex of signex is
begin
	 
	output <= std_logic_vector(resize(signed(instruction), output'length));	
	--output<= x"0000"&instruction when (instruction(15)='0') else  x"ffff"&instruction;
		
		   
end signex;
