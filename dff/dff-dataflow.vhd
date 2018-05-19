library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity DFF is port (
  rst, clk, d: in std_logic;
            q: inout std_logic
);
end DFF;

architecture dataflow of DFF is
begin
  q <=  '0' when rst <= '1'       else
        d   when rising_edge(clk) else
        q;
end dataflow;
