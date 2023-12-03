library ieee;
use ieee.std_logic_1164.all;
entity add32_tb is
end  entity;

architecture tb of add32_tb is
component add32 is
port(A, B: in std_logic_vector (31 downto 0);
     S: out std_logic_vector (31 downto 0);
     Cin :in std_logic;
     Cout :out std_logic
     );
end  component;
signal A, B : std_logic_vector (31 downto 0):= X"00000000";
signal S :  std_logic_vector (31 downto 0):= X"00000000";
signal Cout : std_logic;
signal Cin : std_logic:='0';
begin
dut : ADD32
port map (A=>A, B=> B, S=>S, Cout=>Cout, Cin=>Cin);

A <= X"0000abcd", X"00a0003f" after 10  ns, X"00130071" after 20 ns, X"00aa403f" after 30  ns, X"00cd5001" after 40 ns, X"ffffffff" after 50 ns;
B <= X"0000a001" , X"00c00001"after 10 ns, X"c0678910" after 20 ns, X"0fa0403f" after 30  ns, X"00f0c131" after 40 ns, X"00000001" after 50 ns;
Cin <= '1', '0' after 10 ns, '0' after 20 ns, '1' after 30 ns, '1' after 40 ns,'1' after 50 ns;
timebomb : process
  begin 
    wait for 60 ns;
    assert false
        report "Simulation Ended by MR at" & time 'image(now)
      severity failure;
  end process;
end tb;
