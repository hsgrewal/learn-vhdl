library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_UNSIGNED.all;

entity counter_AM is port (
  rst, clk  : in std_logic;
          q : inout std_logic_vector (3 downto 0)
);
end counter_AM;

architecture behavioral of counter_AM is
begin
  process (clk, rst)
  begin
    if rst = '1' then q <= "0000";
    elsif rising_edge(clk) then q <= q + 2;
    end if;
  end process;
end behavioral;
