library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.all;

entity Anode_Activate_SEG is Port (
    -- module that activates the anode of the 7-segment display
    -- and selects the BCD value to be displayed
    -- this is done
    -- CLK_100MHZ: clock input
    CLK_100MHZ : in std_logic;
    BCD_SW: in std_logic_vector (15 downto 0);


    Anode_Activate: out std_logic_vector (3 downto 0); -- 4-bit output that activates the anode of the 7-segment display
    SEG_BCD : out std_logic_vector (3 downto 0) -- 4-bit output that selects the BCD value to be displayed
    );
end Anode_Activate_SEG;


architecture Behavioral of Anode_Activate_SEG is
    signal refresh_counter: std_logic_vector(19 downto 0);
    signal SEG_active_Count: std_logic_vector(1 downto 0);
    begin
        process(CLK_100MHZ)
        begin
            if(rising_edge(CLK_100MHZ)) then
            refresh_counter <= refresh_counter + 1;
            end if;
        end process;

        SEG_active_Count <= refresh_counter(19 downto 18);

        process(SEG_active_Count)
        -- process that activates the anode of the 7-segment display
        -- and selects the BCD value to be displayed
        -- this is done by using the refresh_counter
        -- the refresh_counter is a 20-bit counter that counts up to 1 million
        begin
            case SEG_active_Count is
                when "00" =>
                    Anode_Activate <= "0111";
                    SEG_BCD <= BCD_SW(15 downto 12);
                when "01" =>
                    Anode_Activate <= "1011";
                    SEG_BCD <= BCD_SW(11 downto 8);
                when "10" =>
                    Anode_Activate <= "1101";
                    SEG_BCD <= BCD_SW(7 downto 4);
                when "11" =>
                    Anode_Activate <= "1110";
                    SEG_BCD <= BCD_SW(3 downto 0);
            end case;
        end process;
end Behavioral;
