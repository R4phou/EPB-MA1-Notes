library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;


entity PIPO_Register_tb is
end entity;

architecture ben of PIPO_Register_tb is
    component PIPO_Register is
        generic (N: integer);
        port(
            Clk : in std_logic;  -- Clock
            RST : in std_logic; -- Reset
            LOAD : in std_logic; -- LOAD
            D : in std_logic_vector(N-1 downto 0); -- Input D
            Q : out std_logic_vector(N-1 downto 0) -- Output Q
        );
    end component;

    signal Clk : std_logic:='1';
    signal RST : std_logic:='1';
    signal LOAD : std_logic:='1';
    signal D : std_logic_vector(7 downto 0);
    signal Q : std_logic_vector(7 downto 0);
    
    begin
        pipo_reg : PIPO_Register generic map (N=>8) port map (Clk => Clk, RST => RST, LOAD => LOAD, D => D, Q => Q);

        clock_process : process
        begin
            Clk <= not Clk;
            wait for 5 ns;
        end process;

        D_process : process
        begin 
            D <= "00100100";
            wait for 12 ns;
            D <= "11111111";
            wait for 12 ns;
            D <= "01010110";
            wait for 12 ns;
        end process;

        LOAD_process : process
        begin 
            -- Load is already to 1
            wait for 50 ns;
            LOAD <= '0';
        end process;

        RST_process : process
        begin
            wait for 5 ns;
            RST <= '0';
            wait for 70 ns;
            RST <= '1';
        end process;    
end ben;