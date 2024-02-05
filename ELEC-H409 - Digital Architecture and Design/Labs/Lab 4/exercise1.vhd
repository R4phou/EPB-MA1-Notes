library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity LED_0_controller is
    Port ( 
    clk: in STD_LOGIC; 
    btnR : in STD_LOGIC;
    led0 : out STD_LOGIC
    );
end LED_0_controller;

architecture Behavioral of LED_0_controller is
begin
process(clk) is
begin
    if rising_edge(clk) then
       led0 <= btnR;
    end if;
end process;

end Behavioral;