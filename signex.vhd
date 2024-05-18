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
		   
end signex;