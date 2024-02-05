library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;


entity FullAdder_tb is
end entity;

architecture ben of FullAdder_tb is
    component FullAdder is port(
        a,b,ci    : in  std_logic;
        s,co    : out std_logic);
    end component;
    -- These are the internal wires
    signal a,b,ci,s,co : std_logic;
begin
    uut : FullAdder port map(a => a, b => b, s => s, co => co, ci => ci);


    stim : process
    variable inputs : std_logic_vector(2 downto 0);
    begin
        for i in 0 to 2**inputs'length - 1 loop
            inputs := std_logic_vector(to_unsigned(i, inputs'length));
            (a, b, ci) <= inputs;
            wait for 10 ns;
            report "inputs: " & std_logic'image(a) & std_logic'image(b);
            report "outputs: " & std_logic'image(s) & std_logic'image(co);
        end loop;
    end process;
end ben;