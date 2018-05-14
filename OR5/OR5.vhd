library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity OR5 is port (
  A, B, C, D, E : IN  STD_LOGIC;
              F : OUT STD_LOGIC
);
end OR5;

architecture behavior of OR5 is
begin
  F <= A OR B OR C OR D OR E;
end behavior;
