library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;


entity ex3_tb is
end entity;

architecture ben of ex3_tb is
component ex3 is port(
    a,b,c    : in  std_logic;
    o1, o2, o3    : out std_logic);
end component;
-- These are the internal wires
signal a,b,c,o1,o2,o3 : std_logic;
begin
    uut : ex3 port map(a => a, b => b, c => c, o1 => o1, o2 => o2, o3 => o3);
    stim : process
    begin
        a <= '0'; b <= '0'; c <= '0';
        wait for 10 ns;
        assert ((o1 = '0') and (o2 = '0') and (o3 = '0'))
        report "test failed for input combination 000" severity error;
        a <= '1'; b <= '1'; c <= '1';
        wait for 10 ns;
        assert ((o1 = '1') and (o2 = '1') and (o3 = '1'))
        report "test failed for input combination 111" severity error;
        a <= '0'; b <= '1'; c <= '0';
        wait for 10 ns;
        assert ((o1 = '0') and (o2 = '0') and (o3 = '0'))
        report "test failed for input combination 010" severity error;
    end process;
end ben;