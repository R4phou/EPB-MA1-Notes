library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.all;


entity TopModule is Port (
    CLK_100MHZ : in std_logic; -- 100 MHz clock
    SEG_OUT: out std_logic_vector (6 downto 0); -- 7 segment display
    ANODE_ACT: out std_logic_vector (3 downto 0) -- 4 anodes
); end TopModule;


architecture Behavioral of TopModule is
    component Anode_Activate_SEG is Port (
        CLK_100MHZ : in std_logic;
        MESSAGE: in std_logic_vector (15 downto 0);
        Anode_Activate: out std_logic_vector (3 downto 0);
        SEG_BCD : out std_logic_vector (3 downto 0)
    );
    end component;

    component BCD_Deccoder is Port (
        SEG_BCD : in std_logic_vector (3 downto 0);
        SEG_OUT: out std_logic_vector (6 downto 0)
    ); 
    end component;

signal BCD_CODE : std_logic_vector (3 downto 0);
signal MESSAGE1 : std_logic_vector (15 downto 0);


begin
    MESSAGE1 <= "0000000000000000"; -- 16 bit message
    uu1: Anode_Activate_SEG Port map( CLK_100MHZ => CLK_100MHZ, MESSAGE=>MESSAGE1, SEG_BCD=>BCD_CODE, Anode_Activate=>ANODE_ACT );
    uu2: BCD_Deccoder Port map(SEG_BCD => BCD_CODE, SEG_OUT => SEG_OUT ); -- print BCD_CODE to 7 segment display
end Behavioral;
