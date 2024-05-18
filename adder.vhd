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

architecture adder of adder is
begin

	 output<=input1+input2;

end adder;