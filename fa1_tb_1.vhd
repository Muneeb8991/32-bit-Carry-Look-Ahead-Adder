entity fa1_tb is
end;

architecture tb of fa1_tb is
  component fullAdder is
    port
    ( a, b, cin: in bit;
      sum, cout: out bit
    );
  end component;

  signal a, b, cin: bit := '0';
  signal sum, cout: bit;
begin
  uut : fullAdder
    port map( a, b, cin, sum, cout);

  test_process : process
  begin
    a <= '0';
    b <= '0';
    cin <= '0';
    wait for 10 ns;

    a <= '1';
    b <= '0';
    cin <= '0';
    wait for 10 ns;

    a <= '1';
    b <= '1';
    cin <= '0';
    wait for 10 ns;

    a <= '1';
    b <= '1';
    cin <= '0';
    wait for 10 ns;

    wait;
  end process test_process;

  stop: process
  begin
   wait  FOR 50 ns;
   assert false
     report "Simulation ended by JG at " & time'image(now)
     severity failure;
  end process;
end tb;
