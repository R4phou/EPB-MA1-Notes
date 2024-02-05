library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;


entity SISO_shiftRegister_tb is
end entity;

architecture ben of SISO_shiftRegister_tb is
    component SISO_shiftRegister is
        generic (N: integer);
        port(
            EN : in std_logic; -- Enable
            Clk : in std_logic;  -- Clock
            D : in std_logic; -- Input D
            RST : in std_logic; -- Reset
            Q : out std_logic -- Output Q
        );
    end component;

    signal Clk : std_logic:='0';
    signal RST : std_logic:='0';
    signal EN : std_logic:='1';
    signal D : std_logic;
    signal Q : std_logic;
    
    begin
        siso_reg : SISO_shiftRegister generic map (N=>8) port map (Clk => Clk, RST => RST, EN => EN, D => D, Q => Q);

        clock_process : process
        begin
            Clk <= not Clk;
            wait for 5 ns;
        end process;

        D_process : process
        begin 
            D <= '1';
            wait for 14 ns;
            D <= '0';
            wait for 7 ns;
        end process;

        EN_RST_process : process
        begin 
            -- Enable is already to 1
            wait for 210 ns;
            EN <= '0';

            -- RST is already to 0
            wait for 20 ns;
            RST <= '1';
        end process;    
end ben;