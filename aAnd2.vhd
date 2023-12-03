-- aAnd2
LIBRARY ieee;
use ieee.std_logic_1164.ALL;
entity aAnd2 is
  generic (width : integer := 1);
  port
  ( A : std_logic_vector ((width-1) downto 0);
    B : std_logic_vector ((width-1) downto 0);
    Y : out std_logic_vector ((width-1) downto 0)
  );
end aAnd2;

architecture behavior of aAnd2 is
begin
  P0 : process (A, B)
    variable result : std_logic_vector (width-1 downto 0);
  begin
    outer :
    for n in width - 1 downto 0 loop
      result (n) := A (n) and B (n);
    end loop outer;
    Y <= result;
  end process P0;
end behavior;
