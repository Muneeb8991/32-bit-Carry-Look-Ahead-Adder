-- gAnd
LIBRARY ieee; use ieee.std_logic_1164.ALL;
entity gAnd is
  generic (width : integer := 1);
  port
  ( input1 : std_logic_vector((width -1)  downto 0);
    input2 : std_logic_vector((width -1)  downto 0);
    output : out std_logic_vector((width -1) downto 0)
  );
end gAnd;

architecture beh of gAnd is
begin
  P0 : process(input1, input2)
    variable  result : std_logic_vector(width-1 downto 0);
  begin
    for n in width-1 downto 0 loop
      result(n) := input1(n) and input2(n);
    end loop;
    output <= result;
  end process P0;
end beh;
