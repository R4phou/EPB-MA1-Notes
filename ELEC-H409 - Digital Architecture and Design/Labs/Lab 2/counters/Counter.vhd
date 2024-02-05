library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;


entity Counter is 
    generic (N : integer); -- Number of bits of the register
    port(
        Clk: in std_logic;
        UP : in std_logic; -- counting direction UP(1) DOWN(0)
        Q : out signed(N-1 downto 0)
    ); 
end entity Counter;

architecture arch of Counter is
    
begin
    
    proc: process(Clk)
    variable i: signed(N-1 downto 0) := (others =>'0');
    begin 
        if rising_edge(Clk) then 
            if (UP = '1') then 
                i <= i + 1;
            else
                i <= i - 1;
            end if;
            Q <= i
        end if;
    end process;
end architecture arch;