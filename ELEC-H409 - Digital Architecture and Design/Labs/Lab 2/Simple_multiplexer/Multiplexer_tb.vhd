library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;


entity Multiplexer_tb is
end entity;

architecture ben of Multiplexer_tb is
component Multiplexer is port(
    D : in std_logic_vector(3 downto 0);
    SEL : in std_logic_vector(1 downto 0);
    Q : out std_logic);
end component;
signal D : std_logic_vector(3 downto 0);
signal SEL : std_logic_vector(1 downto 0);
signal Q : std_logic;
begin
    mult : Multiplexer port map(D => D, SEL => SEL, Q => Q);
    stim : process
    variable Dinputs : std_logic_vector(3 downto 0);
    variable SELinputs : std_logic_vector(1 downto 0);
    begin
        for i in 0 to 2**Dinputs'length-1 loop
            Dinputs := std_logic_vector(to_unsigned(i, Dinputs'length));
            D <= Dinputs;
            for j in 0 to 2**SELinputs'length-1 loop
                SELinputs := std_logic_vector(to_unsigned(j, SELinputs'length));
                SEL <= SELinputs;
                wait for 10 ns;
            end loop;
        end loop;
    end process;
end ben;