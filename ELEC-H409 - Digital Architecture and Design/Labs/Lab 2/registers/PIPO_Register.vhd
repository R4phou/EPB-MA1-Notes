library ieee;
use ieee.std_logic_1164.all;


entity PIPO_Register is 
    generic (N : integer); -- Number of bits of the register
    port(
        Clk : in std_logic;  -- Clock
        RST : in std_logic; -- Reset
        LOAD : in std_logic; -- LOAD
        D : in std_logic_vector(N-1 downto 0); -- Input D
        Q : out std_logic_vector(N-1 downto 0) -- Output Q
    ); 
end PIPO_Register;


architecture arch of PIPO_Register is
    begin 
        process(Clk, RST)
            begin
                if (RST = '1') then -- Reset
                    Q <= (others => '0');
                elsif (rising_edge(Clk)) then -- When clock rises
                    if (LOAD = '1') then -- if load is on
                        Q <= D; -- Q takes the value of D
                    end if;
                end if;
        end process;

end arch;