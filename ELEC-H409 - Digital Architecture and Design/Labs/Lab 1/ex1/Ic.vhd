library ieee;
use ieee.std_logic_1164.all;

entity ex1 is port (
    a : in std_logic;
    b : in std_logic;
    c : in std_logic;
    d : in std_logic;
    e : in std_logic;
    o : out std_logic
); end ex1;

architecture arch of ex1 is
begin
    o <= a and b and c and d and e;
end arch;