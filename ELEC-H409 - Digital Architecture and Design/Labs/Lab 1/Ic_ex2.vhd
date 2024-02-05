library ieee;
use ieee.std_logic_1164.all;

entity myLogicFunctionEx1 is port (
    a : in std_logic;
    b : in std_logic;
    c : in std_logic;
    d : in std_logic;
    e : in std_logic;
    o : out std_logic
); end myLogicFunctionEx1;

architecture arch of myLogicFunctionEx1 is
begin
    o <= a and b and c and d and e;
end arch;