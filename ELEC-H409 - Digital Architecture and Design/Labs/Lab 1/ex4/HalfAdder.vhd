library ieee;
use ieee.std_logic_1164.all;

entity HalfAdder is port(
    a, b     : in std_logic;
    s, co    : out std_logic
);end HalfAdder;

architecture beh of HalfAdder is begin
    s <= a xor b;
    co <= a and b;
end beh;