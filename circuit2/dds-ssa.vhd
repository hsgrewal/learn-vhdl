library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity circuit2 is port (
  X,Y,Z : in STD_LOGIC;
      F : out STD_LOGIC
);
end circuit2;

architecture SSA of circuit2 is
signal a, b, c, d : std_logic := '0';
begin
  a <= (not Y) after 80ns;
  b <= (X and a) after 110ns;
  c <= (Y and Z) after 110ns;
  d <= (b or c) after 120ns;

  with d select
  F <=  '1' when '1',
        '0' when '0',
        '0' when others;
end SSA;

-- Begin of test bench section
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
-- test bench name is sim
-- In modelsim right click on "sim" to simulate
-- In modelsim right click on "sim" to add wave
ENTITY sim IS
END sim;

ARCHITECTURE behavior OF sim IS
--Component Declaration for the Unit Under Test (UUT)
COMPONENT circuit2
PORT(
  X : IN std_logic;
  Y : IN std_logic;
  Z : IN std_logic;
  F : OUT std_logic
);
END COMPONENT;

-- Test bench stimuli signals to be generated
-- to drive the input signals of the design under test-- in this case the DUT is the 3-input AND gate
signal X : std_logic := '0';
signal Y : std_logic := '0';
signal Z : std_logic := '0';

-- Test bench signals to represent the output
signal F : std_logic;
-- begin of test bench action
BEGIN
  --Instantiate the Unit Under Test (UUT)
  -- and connect stimuli signals of the test bench
  -- to the UUT pins.
  uut: circuit2 PORT MAP (
    X => X,
    Y => Y,
    Z => Z,
    F => F
  );

  -- Stimulus Process example
  -- we use 500 ns pulse width for this example
  -- you can change the stimuli pulse width
  -- to test your design accordingly
  process
  begin
    --stimulus inputs
    X <= '0'; Y <= '0'; Z <= '0'; wait for 500 ns;
    X <= '0'; Y <= '0'; Z <= '1'; wait for 500 ns;
    X <= '0'; Y <= '1'; Z <= '0'; wait for 500 ns;
    X <= '0'; Y <= '1'; Z <= '1'; wait for 500 ns;
    X <= '1'; Y <= '0'; Z <= '0'; wait for 500 ns;
    X <= '1'; Y <= '0'; Z <= '1'; wait for 500 ns;
    X <= '1'; Y <= '1'; Z <= '0'; wait for 500 ns;
    X <= '1'; Y <= '1'; Z <= '1'; wait for 500 ns;
    X <= '0'; Y <= '0'; Z <= '0'; wait;
  end process;
END;
