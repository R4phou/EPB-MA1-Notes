library ieee;
use ieee.std_logic_1164.all;


entity PSIPO_Register is 
    generic (N : integer := 4); -- Number of bits of the register
    port(
        Clk : in std_logic;  -- Clock
        RST : in std_logic; -- Reset
        LOAD : in std_logic; -- LOAD
        SERIAL : in std_logic; -- allows to choose between PIPO (0) or SISO (1)
        D : in std_logic_vector(N-1 downto 0); -- Input D
        Q : out std_logic_vector(N-1 downto 0) -- Output Q
    ); 
end entity PSIPO_Register;


architecture arch of PSIPO_Register is
    signal registers: std_logic_vector(N-1 downto 0);

    begin
        Q <= registers; -- parallel output

        proc : process(Clk, RST)
            begin
                if (RST = '1') then
                    registers <= (others => '0');
                
                elsif (rising_edge(Clk)) then

                    if (LOAD = '1') then
                        if (SERIAL = '0') then -- PIPO
                            registers <= D;

                        elsif(SERIAL = '1') then -- SISO

                            for i in 1 to N-1 loop
                                registers(i) <= registers(i-1);
                            end loop;

                            registers(0) <= D(0); -- serial input
                        end if;
                    end if;
                end if;
        end process proc;    
        
end architecture arch;
