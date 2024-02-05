library ieee;
use ieee.std_logic_1164.all;


entity SISO_shiftRegister is 
    generic (N : integer); -- Number of bits of the register
    port(
        EN : in std_logic; -- Enable
        Clk : in std_logic;  -- Clock
        D : in std_logic; -- Input D
        RST : in std_logic; -- Reset
        Q : out std_logic -- Output Q
    ); 
end SISO_shiftRegister;

architecture arch of SISO_shiftRegister is 
    signal registers: std_logic_vector(N-1 downto 0);
    
    begin -- behavioral style
        Q <= registers(N-1);
        process(Clk, RST)  
            begin
                if (RST = '1') then -- Reset
                    registers(N-1) <= '0'; -- Put the output to 0
                elsif (rising_edge(Clk)) then -- rising edge of the clock
                    if (EN = '1') then -- Enable
                        registers(0) <= D; -- Put the input to the first bit of the register
                        for i in 1 to N-1 loop
                            registers(i) <= registers(i-1); -- Shift the register
                        end loop;
                    end if;
                end if;
    end process;

    -- Example of structural style
    -- flip1 : D_FF port map(Clk => Clk, D => D, Q => s(0));
    -- Dloop: for i in 1 to N-1 generate
    --     flip : D_FF port map(Clk => Clk, D => s(i-1), Q => s(i));
    -- end generate;
    -- Q <= s(N-1) and not RST;
end arch;
