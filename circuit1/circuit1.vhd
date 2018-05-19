library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity circuit1 is port (
  X, Y, Z : in STD_LOGIC;
        F : out STD_LOGIC);
end circuit1;

architecture behav of circuit1 is
begin
  F <= (X and Z) or (X and Y) or (Y and Z);
end behav;
