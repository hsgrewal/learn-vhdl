library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

package pkgtest is
  constant ASCII_CR : integer := 16#0D#; -- hex constant
  component OR3 port(i1, i2, i3 : in std_logic; o1 : out std_logic);
  end component;
  component DFF port(rst, clk, d : in std_logic; q : inout std_logic);
  end component;
  function minimum(constant a,b : in integer) return integer;
end pkgtest;

package body pkgtest is
-- Function minimum
function minimum(constant a,b : in integer) return integer is
  variable c : integer;
  begin
    if a < b then c := a;   -- a is min
    else c := b;            -- b is min
    end if;
    return c;   -- return the minimum value
  end;
end pkgtest;

-- OR3 component
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity OR3 is port (
  i1, i2, i3 : in std_logic;
          o1 : out std_logic);
end OR3;

architecture dataflow of OR3 is
begin
  o1 <= i1 or i2 or i3;
end dataflow;

-- D-Flipflop component
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity DFF is port (
  rst, clk, d : in std_logic;
            q : inout std_logic);
end DFF;

architecture dataflow of DFF is
begin
  q <= '0' when rst = '1' else d when rising_edge(clk) else q;
end dataflow;
