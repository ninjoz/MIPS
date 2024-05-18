library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity reg_mux is
	Generic( N: integer :=5 );
	port(  Mux_in0:in std_logic_vector(N-1 downto 0);
	       Mux_in1:in std_logic_vector(N-1 downto 0);	
	       --control input 
	       Mux_ctl:in std_logic;
	       Mux_out:out std_logic_vector(N-1 downto 0)
		   );
end reg_mux;

architecture behavioral of reg_mux is
begin

	Mux_out<=Mux_in0 when Mux_ctl='0' else 
		Mux_in1;

end behavioral;