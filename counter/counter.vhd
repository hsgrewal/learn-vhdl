library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity counter is port (
    init, clk : in std_logic;
  q2, q1, q0  : inout std_logic
);
end counter;

architecture dataflow of counter is
begin
  q2 <= q0 when rising_edge(clk) and init = '0' else
        '0';
  q1 <= q2 when rising_edge(clk) and init = '0' else
        '0';
  q0 <= q1 when rising_edge(clk) and init = '0' else
        '1';
end dataflow;
