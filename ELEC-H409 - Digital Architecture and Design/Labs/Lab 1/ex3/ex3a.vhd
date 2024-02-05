library ieee;
use ieee.std_logic_1164.all;

entity ex3a is port (
    a : in std_logic;
    b : in std_logic;
    c : in std_logic;
    o1 : out std_logic;
    o2 : out std_logic;
    o3 : out std_logic
); end ex3a;

architecture arch of ex3a is
begin
    o1 <= a and b and c;
    o2 <= (a and b) or c;
    o3 <= a;
end arch;