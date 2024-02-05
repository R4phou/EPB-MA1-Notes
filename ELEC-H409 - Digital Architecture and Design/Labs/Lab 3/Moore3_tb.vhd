library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.math_real.all;


entity Moore3_tb is
end entity;

architecture ben of Moore3_tb is
    component Moore3 is
        port(
            EN, RST, UP, Clk : in std_logic; -- Clock
            o : out std_logic_vector(1 downto 0)
            );
    end component;
    
    signal Clk : std_logic:='0';
    signal EN : std_logic:='0';
    signal RST : std_logic:='0';
    signal UP : std_logic:='1';
    signal o : std_logic_vector(1 downto 0):="00";

    begin  
        uut: Moore3 port map(EN => EN, RST => RST, UP => UP, Clk => Clk, o => o);
        clock_process : process 
        begin
            Clk <= not Clk;
            wait for 2 ns;
        end process;

        EN_process : process
        begin
            EN <= not EN;
            wait for 30 ns;
        end process;

        UP_process : process
        begin
            UP <= not UP;
            wait for 50 ns;
        end process;
        
        RST_process : process
        begin 
            RST <= not RST;
            wait for 1 ns;
            RST <= not RST;
            wait for 130 ns;
        end process;
end architecture ben;