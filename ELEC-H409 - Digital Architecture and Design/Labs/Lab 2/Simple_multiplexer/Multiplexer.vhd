library ieee;
use ieee.std_logic_1164.all;


entity Multiplexer is port(
    D : in std_logic_vector(3 downto 0); -- 4 bit input
    SEL : in std_logic_vector(1 downto 0); -- Select input (2 bits)
    Q : out std_logic -- Output Q
); end Multiplexer;

architecture arch of Multiplexer is begin
    with SEL select Q <=
        D(0) when "00",
        D(1) when "01",
        D(2) when "10",
        D(3) when "11",
        '0' when others;
end arch;
