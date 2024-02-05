library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.all;

entity BCD_Deccoder is Port (
    -- Takes in a 4 bit BCD value and outputs a 7 bit value to display on a 7 segment display
    SEG_BCD : in std_logic_vector (3 downto 0);
    SEG_OUT: out std_logic_vector (6 downto 0)
    );
end BCD_Deccoder;


architecture Behavioral of BCD_Deccoder is
begin
    process(SEG_BCD)
    begin
        case SEG_BCD is
            when "0000" => SEG_OUT <= "1000000"; -- "0"
            when "0001" => SEG_OUT <= "1111001"; -- "1"
            when "0010" => SEG_OUT <= "0100100"; -- "2"
            when "0011" => SEG_OUT <= "0110000"; -- "3"
            when "0100" => SEG_OUT <= "0011001"; -- "4"
            when "0101" => SEG_OUT <= "0010010"; -- "5"
            when "0110" => SEG_OUT <= "1000010"; -- "6"
            when "0111" => SEG_OUT <= "1111000"; -- "7"
            when "1000" => SEG_OUT <= "0000000"; -- "8"
            when "1001" => SEG_OUT <= "0010000"; -- "9"
            when "1010" => SEG_OUT <= "0100000"; -- a
            when "1011" => SEG_OUT <= "0000011"; -- b
            when "1100" => SEG_OUT <= "1000110"; -- C
            when "1101" => SEG_OUT <= "1000010"; -- d
            when "1110" => SEG_OUT <= "0000110"; -- E
            when "1111" => SEG_OUT <= "0001110"; -- F
            when others => SEG_OUT <= "0000001"; -- "."
        end case;
    end process;
end Behavioral;