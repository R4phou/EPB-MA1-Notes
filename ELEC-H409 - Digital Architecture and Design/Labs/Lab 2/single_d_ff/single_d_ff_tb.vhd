library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;


entity D_FF_tb is
end entity;

architecture ben of D_FF_tb is
component D_FF is port(
    D : in std_logic;
    Clk : in std_logic;
    Q : out std_logic);
end component;

signal D : std_logic:='0';
signal Clk : std_logic:='0';
signal Q : std_logic;

begin
    dff : D_FF port map(D => D, Clk => Clk, Q => Q);

    clock_process : process -- Change the value of the clock every 7ns
    begin
        Clk <= not Clk;
        wait for 7ns;
    end process;

    D_process : process -- Change the value of D every 11ns
    begin
        D <= not D;
        wait for 11ns;
    end process;
end ben;