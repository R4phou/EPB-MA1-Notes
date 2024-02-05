library ieee;
use ieee.std_logic_1164.all;

entity ex3 is port (
    a : in std_logic;
    b : in std_logic;
    c : in std_logic;
    o1 : out std_logic;
    o2 : out std_logic;
    o3 : out std_logic
); end ex3;

architecture arch of ex3 is
    component ex3a is port (
        a : in std_logic;
        b : in std_logic;
        c : in std_logic;
        o1 : out std_logic;
        o2 : out std_logic;
        o3 : out std_logic);
    end component;
    
    signal m1,m2,m3 : std_logic;
begin
    uut1 : ex3a port map(a => a,b => b,c => c,o1 => m1,o2 => m2,o3 => m3);
    uut2 : ex3a port map(a => m1,b => m2,c => m3,o1 => o1,o2 => o2,o3 => o3);
end arch;