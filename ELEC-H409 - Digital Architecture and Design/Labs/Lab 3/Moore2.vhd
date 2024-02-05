library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;


entity Moore2 is 
    port(
       EN, RST, Clk: in std_logic;
       o : out std_logic_vector(1 downto 0)
    ); 
end entity Moore2;

architecture arch of Moore2 is
    type statetype is (c0, c1, c2, c3); -- define the type of state
    signal currentstate, nextstate : statetype; -- define the current and next state
begin
    fsm1 : process(EN, Clk)
    begin
        case currentstate is
            when c0 => o <= "00";
                if EN = '1' then nextstate <= c1; else nextstate <= c0; end if; -- if EN = 1 -> increment state, else stay in current state
            when c1 => o <= "01";
                if EN = '1' then nextstate <= c2; else nextstate <= c1; end if;
            when c2 => o <= "10";
                if EN = '1' then nextstate <= c3; else nextstate <= c2; end if;
            when c3 => o <= "11";
                if EN = '1' then nextstate <= c0; else nextstate <= c3; end if;
        end case;
    end process fsm1;

    fsm2 : process(Clk, RST)
    begin
        if (Clk'event) and (Clk='0') then
            if RST = '1' then 
                currentstate <= c0; 
            else
                currentstate <= nextstate;
            end if;
        end if;
    end process fsm2;
    
end architecture arch;