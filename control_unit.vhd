library ieee;							   
use ieee.std_logic_1164.all;   

entity control_unit is
	port(	opcode : in std_logic_vector(5 downto 0);
			alufunc : in std_logic_vector(5 downto 0); 
			zeroflag : in std_logic;  
			aluop : out std_logic_vector(2 downto 0);
			regdst, branch, memread, memtoreg, memwrite, alusrc, regwrite : out std_logic
		 );
end control_unit;	   

architecture behavioral of control_unit is 
begin 
process(opcode, alufunc, zeroflag)
begin
	case opcode is
		when "000000" => -- r type	
	    	regdst <= '1';
		    memtoreg <= '0';
		    aluop <= alufunc(2 downto 0);	
		    branch <= '0';
		    memread <= '0';
		    memwrite <= '0';
		    alusrc <= '0';
		    regwrite <= '1'; 
		
		when "000001" => -- lw	
	    	regdst <= '0';
		    memtoreg <= '1';
		    aluop <= alufunc(2 downto 0);	
		    branch <= '0';
		    memread <= '1';
		    memwrite <= '0';
		    alusrc <= '1';
		    regwrite <= '1'; 	
		
		when "000010" => -- sw	
	    	regdst <= '0'; -- don't care
		    memtoreg <= '0';
		    aluop <= alufunc(2 downto 0);	
		    branch <= '0';
		    memread <= '0';
		    memwrite <= '1';
		    alusrc <= '1';
		    regwrite <= '0'; 	
			
		when "000100" => -- branching 	
	    	regdst <= '0'; -- don't care
		    memtoreg <= '0';
		    aluop <= "101"; -- subtraction code	
		    branch <= zeroflag;	--
		    memread <= '0';
		    memwrite <= '0';
		    alusrc <= '0'; --
		    regwrite <= '0';  
			
		when others =>
		    regdst <= '0';
		    memtoreg <= '0';
		    aluop <= "000";	
		    branch <= '0';
		    memread <= '0';
		    memwrite <= '0';
		    alusrc <= '0';
		    regwrite <= '0'; 
		end case;
end process;
	
end behavioral;





-- 