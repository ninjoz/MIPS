library ieee;							   
use ieee.std_logic_1164.all; 
use ieee.numeric_std.all;	 
use ieee.std_logic_signed.all; 
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all; 

entity mips is
	port(
		clk: in std_logic
	);
end mips;

architecture behavioral of mips	is	

component control_unit 
		port(	opcode : in std_logic_vector(5 downto 0);
				alufunc : in std_logic_vector(5 downto 0); 
				zeroflag : in std_logic;  
				aluop : out std_logic_vector(2 downto 0);
				regdst, branch, memread, memtoreg, memwrite, alusrc, regwrite : out std_logic
		 );
end component;

component signex  
	port(  
	instruction :in std_logic_vector( 15 downto 0);
	output: out std_logic_vector(31 downto 0)
	);
end component;	

component ALU   
    port (
        a1: in std_logic_vector(31 downto 0);
        a2: in std_logic_vector(31 downto 0);
        alu_controller: in std_logic_vector(2 downto 0);
        alu_result: out std_logic_vector(31 downto 0);
        zero: out std_logic 
    ); 
end component;

component InstructionMemory 
    port (
        ReadAddress : in std_logic_vector(31 downto 0);
        Instruction : out std_logic_vector(31 downto 0)
    );
end component; 				

component Mux 
	Generic( N: integer := 32 );
	port(  Mux_in0:in std_logic_vector(N-1 downto 0);
	       Mux_in1:in std_logic_vector(N-1 downto 0);	
	       Mux_ctl:in std_logic;
	       Mux_out:out std_logic_vector(N-1 downto 0)
		   );
end component; 	

component PC is  
	Port ( clk : in  STD_LOGIC;	 
           address_to_load : in  STD_LOGIC_VECTOR (31 downto 0);
           current_address : out  STD_LOGIC_VECTOR (31 downto 0));
end component;

component RegisterFile 
    Port ( clk : in  STD_LOGIC;
           reg_write : in  STD_LOGIC;
           read_reg1, read_reg2, write_reg : in  STD_LOGIC_VECTOR(4 downto 0);
           write_data : in  STD_LOGIC_VECTOR(31 downto 0);
           read_data1, read_data2 : out  STD_LOGIC_VECTOR(31 downto 0));
end component; 	 

component adder 	
	port (
		input1,input2: in std_logic_vector(31 downto 0);
		output: out std_logic_vector(31 downto 0)
	);
end component;

component shifter 	  
	   generic (n1: natural:= 32; n2: natural:= 32; k: natural:= 2);
	port (
		x: in std_logic_vector(n1-1 downto 0);
		y: out std_logic_vector(n2-1 downto 0)
	);
	
end component; 

component dmem  
	port(clk, we, re: in STD_LOGIC;
	a, wd: in STD_LOGIC_VECTOR (31 downto 0);
	rd: out STD_LOGIC_VECTOR (31 downto 0));
end component;	 

component reg_mux is
	Generic( N: integer :=5 );
	port(  Mux_in0:in std_logic_vector(N-1 downto 0);
	       Mux_in1:in std_logic_vector(N-1 downto 0);	
	       --control input 
	       Mux_ctl:in std_logic;
	       Mux_out:out std_logic_vector(N-1 downto 0)
		   );
end component;
					
signal Instruction: std_logic_vector(31 downto 0) := x"00000000";	-- InstructionMemory, control_unit								 													 										  				   													 										  	  		  		 	  
signal alu_op : std_logic_vector(2 downto 0);  -- control_unit, main_alu
signal regdst, branch, memread, memtoreg, memwrite, alusrc, regwrite, zero: std_logic; -- control_unit	
signal regwritedst : STD_LOGIC_VECTOR(4 downto 0) := "00000";	-- reg_mux, registerfile1 
signal writedata : STD_LOGIC_VECTOR(31 downto 0) := x"00000000";  -- memory_mux, registerfile1
signal readdata1, readdata2 : STD_LOGIC_VECTOR(31 downto 0) := x"00000000";  -- registerfile1, alu_mux, alu	
signal outputextend : std_logic_vector(31 downto 0) := x"00000000";  -- signex, alu_mux
signal aluinput2 : std_logic_vector(31 downto 0) := x"00000000";  -- alu_mux, alu
signal aluresult : std_logic_vector(31 downto 0) := x"00000000";  -- main_alu, data_memory	 
signal address_to_load : std_logic_vector(31 downto 0) := x"00000000";
signal current_address : std_logic_vector(31 downto 0) := x"00000000";  -- pc, dir_adder
signal dir_address : std_logic_vector(31 downto 0) := x"00000000"; -- dir_adder   
signal shifted_extend : std_logic_vector(31 downto 0) := x"00000000"; -- main_shifter, shifted_adder
signal shifted_output : std_logic_vector(31 downto 0) := x"00000000"; -- shifted_adder	
signal mem_read : std_logic_vector(31 downto 0) := x"00000000"; -- memory, mem_mux

begin  	
	
	process (clk)
	begin
	if rising_edge(clk) then
		current_address <= address_to_load;
	end if;
	end process;
	
	control_unit1 : control_unit port map( 
		Instruction(31 downto 26), Instruction(5 downto 0), zero, alu_op, regdst, branch, memread, memtoreg, memwrite, 
		alusrc, regwrite
	); 
	
	register1 : registerFile port map( 
		clk, regwrite, Instruction(25 downto 21), Instruction(20 downto 16), regwritedst, writedata, 
		readdata1, readdata2
	); 
	
	reg_mux1 : reg_mux port map(
		Instruction(20 downto 16), Instruction(15 downto 11), regdst, regwritedst	
	);
	
	inst_mem : InstructionMemory port map( 
		current_address, Instruction(31 downto 0)	
	);	 
	
	sign_ex : signex port map(
		Instruction(15 downto 0), outputextend
	);	
	
	alu_mux : mux port map(
		readdata2, outputextend, alusrc, aluinput2 
	);
	
	main_alu : alu port map(
	  	readdata1, aluinput2, alu_op, aluresult, zero
	);	
	
	--main_pc : PC port map( 
	--	clk, address_to_load, current_address
	--);
	
	dir_adder : adder port map(
		current_address, x"00000004", dir_address
	); 
	
	main_shifter : shifter port map(
		outputextend, shifted_extend
	);
	
	shifted_adder : adder port map(
		dir_address, shifted_extend, shifted_output
	); 	 
	
	pc_mux : mux port map(
		dir_address, shifted_output, branch, address_to_load
	);		  
	
	mem_mux : mux port map(
		aluresult, mem_read, memtoreg, writedata
	);
	
	main_mem : dmem port map(
		clk, memwrite, memread, aluresult, readdata2, mem_read
	);
	
end behavioral;	   
