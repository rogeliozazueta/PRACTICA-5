library ieee;
use ieee.std_logic_1164.all;

entity counter  is
    port ( clk : in  bit;
           mu : out  bit_vector(3 downto 0);
           md : out  bit_vector(3 downto 0);
           hu : out  bit_vector(3 downto 0):= "0001";
           hd : out  bit);
end entity;

architecture behavioral of contador is
component ffjk is 
port ( 
    clk : in bit;
    enable : in bit;
    j  : in  bit;
    k : in  bit;
    q : out  bit;
    qn : out  bit);
end component;

    signal qaux0,qaux1,qaux2,qaux3: bit;
    signal qaux0n,qaux1n,qaux2n,qaux3n: bit;
    signal j0,j1,j2,j3: bit;
    signal k0,k1,k2,k3: bit;

    signal decenasq,decenasq1,decenasq2,decenasq3: bit;
    signal decenasqn0,decenasqn1,decenasqn2,decenasqn3: bit;
    signal decenasffj0,decenasffj1,decenasffj2,decenasffj3: bit;
    signal decenasffk0,decenasffk1,decenasffk2,decenasffk3: bit;

    signal horasq0:bit :='1';
    signal horasq1,horasq2,horasq3: bit;
    signal horasqn0,horasqn1,horasqn2,horasqn3: bit;
    signal hj0,hj1,hj2,hj3: bit;
    signal hk0,hk1,hk2,hk3: bit;

    signal qtemp,qtempnegada,jenable,kenable: bit;

    signal enablem: bit;
    signal enableh: bit;
begin

  
    
jk11 : ffjk port map(clk,'1',j0,k0,qaux0,qaux0n);
jk12: ffjk port map(clk,'1',j1,k1,qaux1,qaux1n);
jk13: ffjk port map(clk,'1',j2,k2,qaux2,qaux2n);
jk14 : ffjk port map(clk,'1',j3,k3,qaux3,qaux3n);

mu(0) <= qaux0;
mu(1) <= qaux1;
mu(2) <= qaux2;
mu(3) <= qaux3;

 enablem <= (qaux0 and qaux1n and qaux2n and qaux3);

 decenasffj3 <= '0';
 decenasffk3 <= '1';
 decenasffj2 <= decenasq1 and decenasq;
 decenasffk2 <= decenasq;
 decenasffk1 <= decenasq;


 jk21 : ffjk port map(clk,enablem,decenasffj0,decenasffk0,decenasq,decenasqn0);
 jk22 : ffjk port map(clk,enablem,decenasffj1,decenasffk1,decenasq1,decenasqn1);
 jk23 : ffjk port map(clk,enablem,decenasffj2,decenasffk2,decenasq2,decenasqn2);
 jk24 : ffjk port map(clk,enablem,decenasffj3,decenasffk3,decenasq3,decenasqn3);

 md(0) <= decenasq;
 md(1) <= decenasq1;
 md(2) <= decenasq2;
 md(3) <= decenasq3;

 X
