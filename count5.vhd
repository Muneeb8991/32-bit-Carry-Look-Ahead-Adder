library ieee; use ieee.std_logic_1164.all;
entity and4 is
  port (a, b, c, d : in std_logic:= '1';
    y : out std_logic
    );
end and4;
architecture df of and4 is
begin
  y <= a and b and c and d;
end df;

library ieee; use ieee.std_logic_1164.all;
entity tff is
  port (rst, clk, t : in std_logic;
    q : out std_logic);
end tff;

architecture beh of tff is
begin
  process (rst, clk)
    variable qtmp : std_logic;
  begin
    if (rst = '1') then qtmp := '0';
    elsif rising_edge (clk) then
      if t = '1' then
        qtmp := not qtmp;
      end if;
    end if;
    q <= qtmp;
  end process;
end beh;

library ieee; use ieee.std_logic_1164.all;
entity count5 is
  port (rst, clk : in std_logic;
    count : out std_logic_vector (4 downto 0)
    );
end count5;

architecture stru of count5 is
  component tff
    port (rst, clk, t : in std_logic; q : out std_logic);
  end component;
  component and4
    port (a, b, c, d : in std_logic:= '1';
      y : out std_logic
      );
  end component;

  constant vcc : std_logic:= '1';
  signal t, q : std_logic_vector (4 downto 0);
begin
  t (0) <= vcc;
  t0 : tff
    port map (rst => rst, clk => clk, t => t (0), q => q (0));
  t (1) <= q (0);
  t1 : tff
    port map (rst => rst, clk => clk, t => t (1), q => q (1));
  a1 : and4
    port map (a => q (0), b => q (1), y => t (2));
  t2 : tff
    port map (rst => rst, clk => clk, t => t (2), q => q (2));
  a2 : and4
    port map (a => q (0), b => q (1), c => q (2), y => t (3));
  t3 : tff
    port map (rst => rst, clk => clk, t => t (3), q => q (3));
  a3 : and4
    port map (a => q (0), b => q (1), c => q (2), d => q (3),
      y => t (4));
  t4 : tff
    port map (rst => rst, clk => clk, t => t (4), q => q (4));
  count <= q;
end stru;
