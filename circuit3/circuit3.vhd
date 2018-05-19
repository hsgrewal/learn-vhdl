library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity circuit3 is port (
  y, w : in std_logic;
     F : out std_logic
);
end circuit3;

architecture dataflow of circuit3 is
begin
  F <= y xnor w;
end dataflow;
