library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity comp2 is port (
        X, Y, Z : in  STD_LOGIC;
  F1, F2, F3, V : out STD_LOGIC
);
end comp2;

architecture behav of comp2 is
begin
  F1  <= (X and not Y and not Z) or (not X and Z) or (not X and Y);
  F2  <= (not Y and Z) or (Y and not Z);
  F3  <= Z;
  V   <= X and not Y and not Z;
end behav;
