library ieee;
use ieee.std_logic_1164.all;

entity ffjk is
port(
   j: in std_logic;
   k: in std_logic;
   clk: in std_logic;
   reset: in std_logic;
     q: out std_logic;
     qn: out std_logic);
end ffjk;



architecture behave of jkff is
signal temporal : std_logic;
begin

process(j,k,clk,reset)
begin

if(reset='1') then
 temp <= '0';
elsif (rising_edge(clk)) then
 if(j/=k) then
  temp <= j;
 elsif(j='1' and k='1') then
  temp <= not temporal;
  elsif(j='0' and k='0') then
  temp <= temporal;
 end if;
end if;
end process;

q <= temporal;
qb <= not temporal;

end behave;