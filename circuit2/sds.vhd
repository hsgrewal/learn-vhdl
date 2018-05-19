--Component definition for not1
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity not1 is port (
  i : in STD_LOGIC;
  o : out STD_LOGIC
);
end not1;

architecture dataflow of not1 is
begin
  o <= (not i) after 80ns;
end dataflow;

--Component definition for and1
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity and1 is port (
  i1, i2  : in STD_LOGIC;
        o : out STD_LOGIC
);
end and1;

architecture dataflow of and1 is
begin
  o <= (i1 and i2) after 110ns;
end dataflow;

--Component definition for and2
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity and2 is port (
  i1, i2  : in STD_LOGIC;
        o : out STD_LOGIC
);
end and2;

architecture dataflow of and2 is
begin
  o <= (i1 and i2) after 110ns;
end dataflow;

--Component definition for or1
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity or1 is port (
  i1, i2  : in STD_LOGIC;
        o : out STD_LOGIC
);
end or1;

architecture dataflow of or1 is
begin
  o <= (i1 or i2) after 120ns;
end dataflow;

--Structural Design (top level)
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity circuit2 is port (
  X, Y, Z : in STD_LOGIC;
        F : out STD_LOGIC
);
end circuit2;
architecture structural of circuit2 is
signal a, b, c : std_logic := '0';

component not1 is port (
i : in std_logic;
o : out std_logic
);
end component;

component and1 is port (
i1, i2: in std_logic;
o: out std_logic
);
end component;

component and2 is port (
i1, i2: in std_logic;
o: out std_logic
);
end component;

component or1 is port (
i1, i2: in std_logic;
o: out std_logic
);
end component;

begin
  C1: not1  port map (i => Y, o => a);
  C2: and1  port map (i1 => X, i2 => a, o => b);
  C3: and2  port map (i1 => Y, i2 => Z, o => c);
  C4: or1   port map (i1 => b, i2 => c, o => F);
end structural;

-- Begin of test bench section
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
-- test bench name is sim-- In modelsim right click on "sim" to simulate
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
-- to drive the input signals of the design under test
-- in this case the DUT is the 3-input AND gate
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
