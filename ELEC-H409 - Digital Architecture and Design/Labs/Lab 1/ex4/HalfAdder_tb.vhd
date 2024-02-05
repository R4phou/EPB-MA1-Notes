library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;


entity HalfAdder_tb is
end entity;

architecture ben of HalfAdder_tb is
component HalfAdder is port(
    a,b    : in  std_logic;
    s,co    : out std_logic);
end component;
-- These are the internal wires
signal a,b,s,co : std_logic;
begin
    uut : HalfAdder port map(a => a, b => b, s => s, co => co);
    stim : process
    variable inputs : std_logic_vector(1 downto 0);
    begin
        for i in 0 to 2**inputs'length - 1 loop
            inputs := std_logic_vector(to_unsigned(i, inputs'length));
            (a, b) <= inputs;
            wait for 10 ns;
            report "inputs: " & std_logic'image(a) & std_logic'image(b);
            report "outputs: " & std_logic'image(s) & std_logic'image(co);
        end loop;
    end process;
end ben;