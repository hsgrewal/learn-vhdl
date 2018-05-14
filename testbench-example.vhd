-- ****************************************************************************
-- Basic Test Bench example

-- In this example, the test bench is used to test the workings of
-- a 3-input AND gate
-- ****************************************************************************

-- VHDL design of the 3-input AND gate
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity AND3 is port (
  A, B, C : in  STD_LOGIC;
        F : out STD_LOGIC
);
end AND3;

architecture bool_func of AND3 is
begin
  F <= A and B and C;
end bool_func;
-- end VHDL design of the 3-input AND gate

-- Begin of test bench section
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

-- test bench name is sim
ENTITY sim IS
END sim;

ARCHITECTURE behavior OF sim IS
--Component Declaration for the Unit Under Test (UUT)
COMPONENT AND3
PORT(
  A : IN  std_logic;
  B : IN  std_logic;
  C : IN  std_logic;
  F : OUT std_logic
);
END COMPONENT;

-- Test bench stimuli signals to be generated
-- to drive the input signals of the design under test
-- in this case the DUT is the 3-input AND gate
signal A : std_logic := '0';
signal B : std_logic := '0';
signal C : std_logic := '0';

-- Test bench signals to represent the output
signal F : std_logic;

-- begin of test bench action
BEGIN
  -- Instantiate the Unit Under Test (UUT)
  -- and connect stimuli signals of the test bench
  -- to the UUT pins.
  uut: AND3 PORT MAP (
    A => A,
    B => B,
    C => C,
    F => F
  );

  -- Stimulus Process example
  -- 500 ns pulse width used for this example
  process
  begin
      --stimulus inputs
      A <= '0'; B <= '0'; C <= '0'; wait for 500 ns;
      A <= '0'; B <= '0'; C <= '1'; wait for 500 ns;
      A <= '0'; B <= '1'; C <= '0'; wait for 500 ns;
      A <= '0'; B <= '1'; C <= '1'; wait for 500 ns;
      A <= '1'; B <= '0'; C <= '0'; wait for 500 ns;
      A <= '1'; B <= '0'; C <= '1'; wait for 500 ns;
      A <= '1'; B <= '1'; C <= '0'; wait for 500 ns;
      A <= '1'; B <= '1'; C <= '1'; wait for 500 ns;
      A <= '0'; B <= '0'; C <= '0'; wait;
  end process;
END;
