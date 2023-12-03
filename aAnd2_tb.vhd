-- aAnd2_tb
use Std.Textio.all;
library IEEE;
use ieee.std_logic_1164.ALL;
entity aAnd2_tb is
end;

architecture tb of aAnd2_tb is
  component aAnd2
    generic (width : integer := 1);
    port (A : std_logic_vector ((width - 1) downto 0);
      B : std_logic_vector ((width - 1) downto 0);
      Y : out std_logic_vector ((width - 1) downto 0));
  end component;

  for all : aAnd2 use entity work.aAnd2 (behavior);

  signal A : std_logic_vector (3 downto 0);
  signal B : std_logic_vector (3 downto 0);
  signal Y : std_logic_vector (3 downto 0);
begin
  A4 : aAnd2 generic map (4)
    port map ( A => A, B => B, Y => Y);

  testProcess : process
  begin
    A <= "0001" ;
    B <= "0001" ;
    wait for 10 ns;

    A <= "1111" ;
    B <= "0001" ;
    wait for 10 ns;

    A <= "1111" ;
    B <= "0101" ;
    wait for 10 ns;

    A <= "1010" ;
    B <= "0101" ;
    wait for 10 ns;

    wait;
  end process testProcess;
end tb;
