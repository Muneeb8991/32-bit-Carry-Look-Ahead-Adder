library IEEE; use ieee.std_logic_1164.ALL;
entity gAnd_tb is
end;

architecture stru_tb of gAnd_tb is
  component gAnd
    generic (width : integer := 1);
    port
    ( input1 : std_logic_vector((width -1)  downto 0);
      input2 : std_logic_vector((width -1)  downto 0);
      output : out std_logic_vector((width -1) downto 0)
    );
  end component;

  for all : gAnd use entity work.gAnd(beh);

  signal input1 : std_logic_vector(3 downto 0);
  signal input2 : std_logic_vector(3 downto 0);
  signal out1 :   std_logic_vector(3 downto 0);
begin
  and4 : gAnd generic map(4)
    port map( input1, input2, out1);

  test_process : process
  begin
    input1 <= "0000";
    input2 <= "0000";
    wait for 10 ns;

    input1 <= "0011";
    input2 <= "0011";
    wait for 10 ns;

    input1 <= "1111";
    input2 <= "0001";
    wait for 10 ns;

    input1 <= "1111";
    input2 <= "0101";
    wait for 10 ns;

    input1 <= "1010";
    input2 <= "0101";
    wait for 10 ns;

    wait;
  end process test_process ;
end stru_tb;
