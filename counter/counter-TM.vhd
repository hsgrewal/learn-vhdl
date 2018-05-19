library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity counter_TM is port (
  set, clk  : in std_logic;
          q : inout std_logic_vector (1 downto 0)
);
end counter_TM;

architecture behavioral of counter_TM is
begin
  process (set, clk)
  begin
    if set = '1' then q <= "11";
    elsif rising_edge(clk) then
      case q is
        when "11" => q <= "10";
        when "10" => q <= "01";
        when "01" => q <= "00";
        when "00" => q <= "11";
        when others => null;
      end case;
    end if;
  end process;
end behavioral;
