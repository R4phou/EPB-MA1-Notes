library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.all;

entity Anode_Activate_SEG is Port (
    -- module that activates the anode of the 7-segment display
    -- and selects the BCD value to be displayed
    -- this is done 
    -- CLK_100MHZ: clock input
    CLK_100MHZ : in std_logic;
    MESSAGE: in std_logic_vector (15 downto 0);
    Anode_Activate: out std_logic_vector (3 downto 0); -- 4-bit output that activates the anode of the 7-segment display
    SEG_BCD : out std_logic_vector (3 downto 0) -- 4-bit output that selects the BCD value to be displayed
    );
end Anode_Activate_SEG;


architecture Behavioral of Anode_Activate_SEG is
    signal refresh_counter: std_logic_vector(19 downto 0) := (others => '0');
    signal SEG_active_Count: std_logic_vector(1 downto 0) := "00";
    begin
        process(CLK_100MHZ)
        begin
            if(rising_edge(CLK_100MHZ)) then
            refresh_counter <= refresh_counter + 1;
            end if;
        end process;

        SEG_active_Count <= refresh_counter(19 downto 18);

        process(SEG_active_Count)
        begin
            case SEG_active_Count is
                when "00" => -- 1st 4 bits of the message on the first 7-segment display
                    Anode_Activate <= "0111";
                    SEG_BCD <= MESSAGE(15 downto 12);
                when "01" =>  -- 2nd 4 bits of the message on the second 7-segment display
                    Anode_Activate <= "1011";
                    SEG_BCD <= MESSAGE(11 downto 8);
                when "10" => -- 3rd 4 bits of the message on the third 7-segment display
                    Anode_Activate <= "1101";
                    SEG_BCD <= MESSAGE(7 downto 4);
                when "11" => -- 4th 4 bits of the message on the fourth 7-segment display
                    Anode_Activate <= "1110";
                    SEG_BCD <= MESSAGE(3 downto 0);
                when others =>
                    Anode_Activate <= "1111";
                    SEG_BCD <= "1111";
            end case;
        end process;
end Behavioral;
