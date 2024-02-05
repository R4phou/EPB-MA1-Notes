library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.math_real.all;


entity Moore1_tb is
end entity;

architecture ben of Moore1_tb is
    component Moore1 is
        port(
            switch, Clk : in std_logic; -- Clock
            o : out std_logic
            );
    end component;
    
    signal Clk : std_logic:='0';
    signal switch : std_logic:='0';
    signal o : std_logic:='0';

    begin  
        uut: Moore1 port map(switch => switch, Clk => Clk, o => o);
        clock_process : process 
        begin
            Clk <= not Clk;
            wait for 5 ns;
        end process;

        switch_process : process
        begin
            switch <= not switch;
            wait for 30 ns;
        end process;

end architecture ben;