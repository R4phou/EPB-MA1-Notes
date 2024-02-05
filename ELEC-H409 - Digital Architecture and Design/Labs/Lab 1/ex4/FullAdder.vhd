library ieee;
use ieee.std_logic_1164.all;

entity FullAdder is port(
    a,b,ci    : in std_logic;
    s, co     : out std_logic
);end FullAdder;

architecture beh of FullAdder is begin
    s <= a xor b xor ci;  -- sum bit
    co <= (a and b) or ((a xor b) and ci); -- carry bit
end beh;