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

  a <= not a after 5ns;
  b <= not b after 10ns;
  cin <= not cin after 20ns;

stop: process
begin
 wait for 100 ns;
 assert false
   report "Simulation ended by JG at " & time'image(now)
   severity failure;
end process;
end tb;
