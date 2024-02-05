library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.all;


entity BCD_7SEG_TOP is Port (
    CLK_100MHZ : in std_logic; -- 100 MHz clock
    BCD_SW: in std_logic_vector (15 downto 0); -- 16 switches
    SEG_OUT: out std_logic_vector (6 downto 0); -- 7 segment display
    ANODE_ACT: out std_logic_vector (3 downto 0) -- 4 anodes
); end BCD_7SEG_TOP;



architecture Behavioral of BCD_7SEG_TOP is
    component Anode_Activate_SEG is Port (
        CLK_100MHZ : in std_logic;
        BCD_SW: in std_logic_vector (15 downto 0);


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

begin
    uu1: Anode_Activate_SEG Port map( CLK_100MHZ => CLK_100MHZ, BCD_SW=>BCD_SW, SEG_BCD=>BCD_CODE, Anode_Activate=>ANODE_ACT );
    uu2: BCD_Deccoder Port map(SEG_BCD => BCD_CODE, SEG_OUT => SEG_OUT ); -- print BCD_CODE to 7 segment display
end Behavioral;
