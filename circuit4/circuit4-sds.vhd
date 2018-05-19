-- Component definition section
-- Inverter
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity inverter is port (
  i1 : in std_logic;
  o1 : out std_logic
);
end inverter;

architecture dataflow of inverter is
constant tpd : time := 10 ns;
begin
  o1 <= not i1 after tpd;
end dataflow;

-- 2-input OR gate
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity or2 is port (
  i1, i2 : in std_logic;
      o1 : out std_logic
);
end or2;

architecture dataflow of or2 is
constant tpd : time := 10 ns;
begin
  o1 <= i1 or i2 after tpd;
end dataflow;

-- 2-input AND gate
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity and2 is port (
  i1, i2 : in std_logic;
      o1 : out std_logic
);
end and2;

architecture dataflow of and2 is
constant tpd : time := 10 ns;
begin
  o1 <= i1 and i2 after tpd;
end dataflow;

-- Structural Design (top level)
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity circuit4 is port (
  X, Y, Z : in std_logic;
      CS1 : out std_logic
);
end circuit4;

architecture structural of small_ckt is
-- Component declarations
component inverter is port (
  i1 : in std_logic;
  o1 : out std_logic
);
end component;

component or2 is port (
  i1, i2 : in std_logic;
  o1 : out std_logic
);
end component;

component and2 is port (
  i1, i2 : in std_logic;
  o1 : out std_logic
);
end component;

--Internal signalsFinal Exam Solutions
signal u1out, u2out, u3out: std_logic;
begin
  -- Component instantiations and connections
  U1: inverter port map (X, u1out);
  U2: or2 port map (u1out, Y, u2out);
  U3: inverter port map (u2out, u3out);
  U4: and2 port map (u3out, Z, CS1);
end structural;
