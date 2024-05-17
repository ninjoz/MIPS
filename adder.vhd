---------------------------------------------------------------------------------------------------
--
-- Title       : adder
-- Design      : design7
-- Author      : HP
-- Company     : HP lnc
--
---------------------------------------------------------------------------------------------------
--
-- File        : adder.vhd
-- Generated   : Fri May 17 19:27:31 2024
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
--{entity {adder} architecture {adder}}

library IEEE;
use IEEE.STD_LOGIC_1164.all; 
use IEEE.std_logic_arith.all;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity adder is	
	port (
		input1,input2: in std_logic_vector(31 downto 0);
		output: out std_logic_vector(31 downto 0)
	);
end adder;

--}} End of automatically maintained section

architecture adder of adder is
begin

	 output<=input1+input2;

end adder;
