library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;


entity ex3a_tb is
end entity;

architecture ben of ex3a_tb is
component ex3a is port(
    a,b,c    : in  std_logic;
    o1, o2, o3    : out std_logic);
end component;
-- These are the internal wires
signal a,b,c,o1,o2,o3 : std_logic;
begin
    uut : ex3a port map(a => a, b => b, c => c,o1 => o1, o2 => o2, o3 => o3);
    stim : process
    variable inputs : std_logic_vector(2 downto 0);
    begin
        for i in 0 to 2**inputs'length - 1 loop
            inputs := std_logic_vector(to_unsigned(i, inputs'length));
            (a, b, c) <= inputs;
            wait for 10 ns;
            report "inputs: " & std_logic'image(a) & std_logic'image(b) & std_logic'image(c);
            report "outputs: " & std_logic'image(o1) & std_logic'image(o2) & std_logic'image(o3);
        end loop;
    end process;
end ben;