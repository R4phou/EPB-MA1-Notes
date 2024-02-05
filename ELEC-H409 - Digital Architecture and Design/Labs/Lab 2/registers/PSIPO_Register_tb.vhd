library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;


entity PSIPO_Register_tb is
end entity;


architecture ben of PSIPO_Register_tb is
    component PSIPO_Register is
        generic (N: integer);
        port(
            Clk : in std_logic;  -- Clock
            RST : in std_logic; -- Reset
            LOAD : in std_logic; -- LOAD
            SERIAL : in std_logic; -- allows to choose between PIPO (0) or SISO (1)
            D : in std_logic_vector(N-1 downto 0); -- Input D
            Q : out std_logic_vector(N-1 downto 0) -- Output Q
        );
    end component;

    signal Clk : std_logic:='1';
    signal RST : std_logic:='1';
    signal LOAD : std_logic:='1';
    signal SERIAL : std_logic;
    signal D : std_logic_vector(7 downto 0);
    signal Q : std_logic_vector(7 downto 0);
    
    begin 
        psipo_req: PSIPO_Register generic map (N => 8)
                                port map(Clk => Clk, RST => RST, SERIAL => SERIAL, LOAD => LOAD, D => D, Q => Q);
        
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
            wait for 100 ns;
            LOAD <= '0';
        end process;

        RST_process : process
        begin
            wait for 5 ns;
            RST <= '0';
            wait for 140 ns;
            RST <= '1';
        end process;    

        SERIAL_process: process
        begin
            SERIAL <= '0';
            wait for 50 ns;
            SERIAL <= '1';
            wait for 50 ns;
        end process;
end ben;