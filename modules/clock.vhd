--Component definition for clock
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity clock is port (
  clk: inout std_logic :='0'
);
end clock;

architecture dataflow of clock is
begin
  clk <= not clk after 50 ns;
end dataflow;
