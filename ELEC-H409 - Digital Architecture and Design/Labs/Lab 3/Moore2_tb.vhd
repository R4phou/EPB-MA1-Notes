library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.math_real.all;


entity Moore2_tb is
end entity;

architecture ben of Moore2_tb is
    component Moore2 is
        port(
            EN, RST, Clk : in std_logic; -- Clock
            o : out std_logic_vector(1 downto 0)
            );
    end component;
    
    signal Clk : std_logic:='0';
    signal EN : std_logic:='0';
    signal RST : std_logic:='0';
    signal o : std_logic_vector(1 downto 0):="00";

    begin  
        uut: Moore2 port map(EN => EN, RST => RST, Clk => Clk, o => o);
        clock_process : process 
        begin
            Clk <= not Clk;
            wait for 2 ns;
        end process;

        EN_process : process
        begin
            EN <= not EN;
            wait for 15 ns;
        end process;
        
        RST_process : process
        begin 
            RST <= not RST;
            wait for 1 ns;
            RST <= not RST;
            wait for 50 ns;
        end process;
end architecture ben;