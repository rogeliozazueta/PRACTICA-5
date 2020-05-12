----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:10:05 05/11/2020 
-- Design Name: 
-- Module Name:    divisorfrecuencia - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;

entity divisorfrecuencia is
    port(
        clk : in  std_logic := '0';
        clk2 : out std_logic := '0'
    );
end entity;

architecture behavior of divisorfrecuencia is

component contador is
 port(clk   : in  std_logic;
      clear : in  std_logic;
      q     : out std_logic_vector(3 downto 0)
      );
end component;
signal qtemp, qtemp2 : std_logic_vector(3 downto 0) := "0000";
    signal clear  : std_logic                    := '0';
begin
    
    clear <= qtemp(3) and qtemp(2) and qtemp(1) and qtemp(0);
        uut : contador port map(clk, clear, qtemp);
        uut1 : contador port map(qtemp(3), '0', qtemp2);
    clk2 <= qtemp2(1);
end architecture;