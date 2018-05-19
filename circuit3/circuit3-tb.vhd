-- function F(x,y,z,w)
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

-- test bench to test function F(x,y,z,w)
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.ALL;
use ieee.std_logic_unsigned.all;

entity test_bench is
end entity test_bench;

architecture test_F of test_bench is
component circuit3 is port (
  y, w : in std_logic;
     F : out std_logic
);
end component;

signal xyzw   : std_logic_vector (3 downto 0) := "0000";
signal count  : unsigned (3 downto 0);
signal F      : std_logic;
begin
  dut : small_ckt
  port map (xyzw(2), xyzw(0), F );

  stimulus : process is
  begin
    report "test begins...";
    for i in xyzw'range loop
      report "testing case: " & integer'image(to_integer(unsigned(xyzw)));
      wait for 20 ns;
      case xyzw is
        when "0000" | "0010" | "0101" | "0111" | "1000" | "1010" | "1101" | "1111" =>
          assert F = '1' report "error found!!!" severity Error;
        when others => assert F = '0' report "error found!!!" severity Error;
      end case;
      xyzw <= xyzw + "0001";
    end loop;
    report "test ended.";
  end process stimulus;
end architecture test_F;
