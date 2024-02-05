library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;


entity Moore1 is 
    port(
       switch, Clk: in std_logic;
       o : out std_logic
    ); 
end entity Moore1;

architecture arch of Moore1 is
    type statetype is (sON, sOFF); -- define the type of state
    signal currentstate, nextstate : statetype; -- define the current and next state
begin
    fsm1 : process(switch, Clk)
    begin
        case currentstate is
            when sON => o <= '1';
                if switch = '1' then nextstate <= sOFF;
                else nextstate <= sON; end if;
            when sOFF => o <= '0';
                if switch = '1' then nextstate <= sON;
                else nextstate <= sOFF; end if;
        end case;
    end process fsm1;

    fsm2 : process(Clk)
    begin
        if (Clk'event) and (Clk='1') then
            currentstate <= nextstate;
        end if;
    end process fsm2;
    
end architecture arch;