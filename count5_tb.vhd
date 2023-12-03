library ieee; use ieee.std_logic_1164.all;
entity count5_tb is
end;

architecture tb of count5_tb is
  component count5 is
  port
  ( rst, clk : in std_logic;
    count : out std_logic_vector (4 downto 0)
    );
  end component;

  signal clk_tb, rst_tb : std_logic := '0';
  signal count_tb: std_logic_vector (4 downto 0);
begin
  dut : count5
    port map(rst_tb, clk_tb, count_tb);

  clk_tb <= not clk_tb after 5 ns;
  rst_tb <= '0', '1' after 2 ns, '0' after 3 ns;

  stop: process
  begin
   wait for 400 ns;
   assert false
     report "Simulation ended by JG at " & time'image(now)
     severity failure;
  end process;
end tb;
