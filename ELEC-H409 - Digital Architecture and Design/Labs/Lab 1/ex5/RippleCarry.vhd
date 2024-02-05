library ieee;
use ieee.std_logic_1164.all;


entity AdderRC is generic(N : integer);
port (
    a : in std_logic_vector(N-1 downto 0);
    b : in std_logic_vector(N-1 downto 0);
    o : out std_logic_vector(N-1 downto 0);
    co : out std_logic
); end AdderRC;

architecture arch of AdderRC is
    component HalfAdder is port(
        a, b : in std_logic;
        s, co: out std_logic);
    end component;
    component FullAdder is port(
        a, b, ci : in std_logic;
        s, co : out std_logic);
    end component;
    signal m1 : std_logic_vector(N-1 downto 0);
begin
    uut : HalfAdder port map(a => a(0), b => b(0), s => o(0), co => m1(0));
    lop : for i in 1 to N-1 generate
        uut2 :FullAdder port map (a => a(i), b => b(i), ci => m1(i-1) ,s => o(i), co => m1(i));
    end generate lop;
    co <= m1(N-1);
end arch;