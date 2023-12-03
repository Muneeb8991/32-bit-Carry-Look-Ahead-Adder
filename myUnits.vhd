library ieee;
use ieee.std_logic_1164.all;

package myUnits is

component inv is 
generic (delay :time :=20 ps);
port (A : in std_logic; 
      Y : out std_logic);
end component;

component and2 is 
generic (delay :time :=123 ps);
port (A, B: in std_logic; 
      Y : out std_logic);
end component;

component  and4 is 
generic (delay :time := 174 ps);
port (A, B, C, D: in std_logic; 
      Y : out std_logic);
end component;

component nand2 is
generic (delay :time :=29 ps);
port (A, B: in std_logic ; 
      Y : out std_logic);
end component;

component nand3 is 
generic (delay :time :=46 ps);
port (A, B, C: in std_logic ; 
      Y : out std_logic);
end component;

component nand4 is 
generic (delay :time :=55 ps);
port (A, B, C, D :in std_logic ; 
      Y : out std_logic);
end component;

component nand5 is 
generic (delay :time :=65 ps);
port (A, B, C, D, E :in std_logic ; 
      Y : out std_logic);
end component;

component xor2 is 
generic (delay :time :=174 ps);
port (A, B: in std_logic ; 
      Y : out std_logic);
end component;

end package;
