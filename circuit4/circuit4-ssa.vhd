library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity circuit4 is port (
  X, Y, Z : in std_logic;
      CS1 : out std_logic
);
end circuit4;

architecture dataflow of circuit4 is
constant tpd : time := 10 ns;
signal inv1, inv2, or1, and1 : std_logic;
begin
  inv1 <= not X after tpd;
  or1 <= (inv1 or Y) after tpd;
  inv2 <= not or1 after tpd;
  and1 <= inv2 and Z after tpd;
  with (and1) select
    CS1 <=  '1' when '1',
            '0' when '0',
            '0' when others;
end dataflow;
