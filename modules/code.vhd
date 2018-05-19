-- Component definition for clock
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity clock is port (
  clk: inout std_logic :='0'
);
end clock;

architecture dataflow of clock is
begin
  clk <= not clk after 50 ns;
end dataflow;

-- Component definition for transmitter register
library ieee;
use ieee.std_logic_1164.all;

entity transmitter_register is port(
  clk: in std_logic;
    d: in std_logic_vector (3 downto 0);
    q: inout std_logic_vector (3 downto 0)
);
end transmitter_register;

architecture behavioral of transmitter_register is
begin
  process
  begin
    if clk = '1' then q<=d;
    end if;
  end process;
end behavioral;

-- Component definition for receiver register
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity receiver_register is port (
  clk : in std_logic;
    en: in std_logic;
     d: in std_logic_vector (3 downto 0);
     q: inout std_logic_vector (3 downto 0)
);
end receiver_register;

architecture behavioral of receiver_register is
-- add signal for and of clk and en
begin
  process
  begin
    if en = '1' then q <= d;
    elsif clk= '1' then q <= q;
    end if;
  end process;
end behavioral;

-- Component definition of Parity Checker
library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity parity_checker is port (
  d0: in  std_logic;
  d1: in  std_logic;
  d2: in  std_logic;
  d3: in  std_logic;
  par_generator: in std_logic;
  err: out std_logic
);
end parity_checker;

architecture behavioral of parity_checker is
signal q0,q1,q2,q3,par_checker,ei0,ei1,ei2,ei3,ei4: std_logic;
begin
  d0 <= q0 xor ei0;
  d1 <= q1 xor ei1;
  d2 <= q2 xor ei2;
  d3 <= q3 xor ei3;
  par_checker <= par_generator xor ei4;
end behavioral;

-- Component definition of parity generator
library ieee;
use ieee.std_logic_1164.all;

entity par_gen is port (
    d: in std_logic_vector (3 downto 0);
  par: out std_logic
);
end par_gen;

architecture behavioral of par_gen is
signal ei: in std_logic_vector (3 downto 0)
begin
  par <= d0 xor d1 xor d2 xor d3;
end behavioral;

-- Structural Design (top level)
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity circuit is port (
    d: in std_logic_vector (3 downto 0);
  clk: in std_logic;
   ei: in std_logic_vector (4 downto 0);
    q: out std_logic_vector (3 downto 0);
  error: out std_logic
);
end circuit;

architecture structural of circuit is
Signal
-- clock comp
component clock is port (
  clk: in std_logic :='0'
);
end component;

-- Transmitter_register comp
component transmitter_register is port(
  clk: in std_logic;
    d: in std_logic_vector (3 downto 0);
    q: inout std_logic_vector (3 downto 0)
);
end component;

-- receiver reg comp
component receiver_register is port (
  clk: in std_logic;
   en: in std_logic;
    d: in std_logic_vector (3 downto 0);
    q: inout std_logic_vector (3 downto 0)
);
end component;

component parity_checker is port (
  d0: in  std_logic;
  d1: in  std_logic;
  d2: in  std_logic;
  d3: in  std_logic;
  par_generator: in std_logic;
  err: out std_logic
);
end component;

component par_gen is port (
    d: in std_logic_vector (3 downto 0);
  par: out std_logic
);
end component;

begin
  -- Component placement and connections
  C1: clock port map (clk => clk);
  C2: trasmitter_register port map ();
  C3: par_gen port map
end structural;

-- Test Bench for Clock
library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity test_tb is
end test_tb;

architecture behavioral of test_tb is
  component test port(
    clk : in std_logic
  );
  end component;

  signal clk : std_logic := '0';
  constant clk_period : time := 1 ns;

begin
  uut: test port map (clk => clk);

  clk_process : process
  begin
    clk <= '0';
    wait for clk_period/2;
    clk <= '1';
    wait for clk_period/2;
  end process;
end;

--Component for XOR Gates
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity xor_gates is port (
  ei: in std_logic_vector (4 downto 0);
   q: in std_logic_vector (4 downto 0);
   o: out std_logic_vector (4 downto 0)
);
end xor_gates;

architecture dataflow of xor_gates is
begin
  o <= ei xor q;
end dataflow;
