library ieee;
use ieee.std_logic_1164.all;

entity sincrono4 is
	port (reset,clk: in std_logic; q0, q1, q2, q3: inout std_logic);
end entity sincrono4;

architecture behave of sincrono4 is
component ffjk is
	port (j, k, clk, reset: in std_logic; Q: out std_logic);
end component ffjk;
	
signal temp1,temp2, temp3: std_logic;
begin
temp1 <= Q0;
temp2<= Q1 and Q0;
temp3<= Q0 and Q1 and Q2;
	
	
uu1: ffjk port map (j => '1', k => '1', reset => reset,clk => clk, q => q0 );
uu2: ffjk port map (j => temp1, K => temp1, reset => reset, Clk => Clk, q => q1);
uu3: ffjk port map (J => temp2, K => temp2, reset => reset, Clk => Clk, q => q2);
uu4: ffjk port map (J => temp3, K => temp3, reset => reset, Clk => Clk, q=> q3);
	
end architecture behave;

