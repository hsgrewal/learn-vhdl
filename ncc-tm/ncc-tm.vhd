library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity NCC_TM is port (
  RST, clk, FWD: in std_logic;
            qn : inout std_logic_vector (2 downto 0)
);
end NCC_TM;

architecture behavioral of NCC_TM is
signal q : std_logic_vector (4 downto 0);
signal tmp : std_logic_vector (5 downto 0);
begin
  process (RST, clk, q)
  begin
    if RST = '1' then q <= "00100";
    elsif rising_edge(clk) then
      tmp <= FWD & q;
      case tmp is
        when "100100" => q <= "00101";
        when "100101" => q <= "01101";
        when "101101" => q <= "10101";
        when "110101" => q <= "00100";
        when "000100" => q <= "10101";
        when "010101" => q <= "01101";
        when "001101" => q <= "00101";
        when "000101" => q <= "00100";
        when others => null;
      end case;
    end if;
    qn <= q (2 downto 0);
  end process;
end behavioral;
