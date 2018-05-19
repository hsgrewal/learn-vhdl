library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity DFF is port (
  rst, clk, d : in std_logic;
            q : inout std_logic
);
end DFF;

architecture behavioral of DFF is
begin
  process (clk, rst)
  begin
    if rst = '1' then q <= '0';
    elsif rising_edge(clk) then q <= d;
    end if;
  end process;
end behavioral;
