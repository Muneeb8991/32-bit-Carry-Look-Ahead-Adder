library ieee;
use ieee.std_logic_1164.all;
use work.myUnits.all;

entity add4_tb is
end  entity;

architecture tb of add4_tb is
component add4 is
port(A, B: in std_logic_vector (3 downto 0);
     S: out std_logic_vector (3 downto 0);
     Cout :out std_logic;
     Cin :in std_logic;
     P_03, G_03 : out std_logic
     );
end  component;
signal A, B : std_logic_vector (3 downto 0):= "0000";
signal S :  std_logic_vector (3 downto 0):= "0000";
signal Cout: std_logic;
signal Cin : std_logic:='0';
signal P_03, G_03 : std_logic;
begin
dut : ADD4
port map (A =>A, B=> B, S=>S, Cout=>Cout, Cin=>Cin, P_03=>P_03, G_03=>G_03);

A <= "0011", "1011" after 10 ns, "1000" after 20 ns;
B <= "0001", "0001" after 10 ns, "0100" after 20 ns;
Cin <= '1', '0' after 10 ns, '0' after 20 ns;
timebomb : process
  begin 
    wait for 100 ns;
    assert false
       report "Simulation Ended by MR at" & time 'image(now)
      severity failure;
  end process;
end tb;
