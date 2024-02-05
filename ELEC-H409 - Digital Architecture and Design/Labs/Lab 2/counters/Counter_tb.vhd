library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.math_real.all;


entity Counter_tb is
end entity;

architecture ben of Counter_tb is
    component Counter is
        generic(N: integer);
        port(
            Clk : in std_logic; -- Clock
            UP : in std_logic; -- Sens du counter
            Q : out signed(N-1 downto 0) -- Output
        );
    end component;
    
    signal Clk : std_logic:='0';
    signal UP : std_logic:='0';
    signal Q : signed(7 downto 0);

    begin 
        cntr : Counter generic map (N => 8) port map(UP => UP, Clk => Clk, Q => Q);
        
        clock_process : process 
        begin
            Clk <= not Clk;
            wait for 1 ns;
        end process;

        UP_process : process
        begin
            UP <= not UP;
            wait for 50 ns;
        end process;

end architecture ben;