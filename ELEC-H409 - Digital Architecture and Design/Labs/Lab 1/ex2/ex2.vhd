library ieee;
use ieee.std_logic_1164.all;

entity ex2 is port (
    a : in std_logic;
    b : in std_logic;
    c : in std_logic;
    d : in std_logic;
    e : in std_logic;
    o1 : out std_logic;
    o2 : out std_logic;
    o3 : out std_logic
); end ex2;

architecture arch of ex2 is
begin
    o1 <= a and b and c and d and e;
    o2 <= (a and b) or c;
    o3 <= a;
end arch;