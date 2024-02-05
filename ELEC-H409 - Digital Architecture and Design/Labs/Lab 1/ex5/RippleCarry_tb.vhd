library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;


entity AdderRC_tb is
end entity;


architecture ben of AdderRC_tb is
component AdderRC is generic (N : integer); port(
    a : in std_logic_vector(N-1 downto 0);
    b : in std_logic_vector(N-1 downto 0);
    o : out std_logic_vector(N-1 downto 0);
    co : out std_logic);
end component;


signal a,b,o : std_logic_vector(7 downto 0);
signal co : std_logic;
begin
    AdderRC_8 : AdderRC
    generic map(N => 8) port map(a => a, b => b, o => o, co => co);
    stim : process
    variable inputs : std_logic_vector(7 downto 0);
    variable inputs2 : std_logic_vector(7 downto 0);
    begin
        for i in 0 to 2**inputs'length - 1 loop
            for j in 0 to 2**inputs'length - 1 loop
                inputs := std_logic_vector(to_unsigned(i, inputs'length));
                inputs2 := std_logic_vector(to_unsigned(j, inputs'length));
                a <= inputs; b <= inputs2 ;
                wait for 10 ns;
            end loop;
        end loop;
    end process;
end ben;
