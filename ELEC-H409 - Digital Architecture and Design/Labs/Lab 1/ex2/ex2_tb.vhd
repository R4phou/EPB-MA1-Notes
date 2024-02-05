library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;


entity ex2_tb is
end entity;

architecture ben of ex2_tb is
component ex2 is port(
    a,b,c,d,e     : in  std_logic;
    o1, o2, o3    : out std_logic);
end component;
-- These are the internal wires
signal a,b,c,d,e,o1,o2,o3 : std_logic;
begin
    uut : ex2 port map(a => a, b => b, c => c, d => d, e => e, o1 => o1, o2 => o2, o3 => o3);
    stim : process
    variable inputs : std_logic_vector(4 downto 0);
    begin
        for i in 0 to 2**inputs'length - 1 loop
            inputs := std_logic_vector(to_unsigned(i, inputs'length));
            (a, b, c, d, e) <= inputs;
            wait for 10 ns;
            report "inputs: " & std_logic'image(a) & std_logic'image(b) & std_logic'image(c) & std_logic'image(d) & std_logic'image(e);
            report "outputs: " & std_logic'image(o1) & std_logic'image(o2) & std_logic'image(o3);
        end loop;
    end process;
end ben;