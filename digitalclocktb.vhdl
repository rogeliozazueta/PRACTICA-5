LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY digitalclock  IS
END digitalclock ;
 
ARCHITECTURE x OF digitalclock  IS 
 
    COMPONENT contador
    PORT(
     CLK : in  BIT;
     Mu : out  BIT_VECTOR(3 downto 0);
     Md : out  BIT_VECTOR(3 downto 0);
     Hu : out  BIT_VECTOR(3 downto 0);
     Hd : out  BIT);
    END COMPONENT;
    
   signal CLK : Bit ;
   signal mu : Bit_vector(3 downto 0) 
   signal md : Bit_vector(3 downto 0) 
   signal hu : Bit_vector(3 downto 0) 
   constant CLK_period : time := 10 ns;
 
BEGIN
   count1: contador PORT MAP (
          CLK => CLK,
          mu => mu,
          md => md,
          hu => hu,
          hd => hd
        );

 CLK_process :process
        begin
             CLK <= '0';
             wait for CLK_period/2;
             CLK <= '1';
             wait for CLK_period/2;
        end process;


END;