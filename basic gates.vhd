library ieee;
use ieee.std_logic_1164.all;
entity inv is 
generic (delay :time :=20 ps);
port (A : in std_logic; 
      Y : out std_logic);
end entity;

architecture dataflow of inv is
begin Y <= not A after delay;
end dataflow;

library ieee;
use ieee.std_logic_1164.all;
entity and2 is 
generic (delay :time :=123 ps);
port (A, B: in std_logic; 
      Y : out std_logic);
end entity;

architecture dataflow of and2 is
begin Y <= A and B after delay;
end dataflow;

library ieee;
use ieee.std_logic_1164.all;
entity and4 is 
generic (delay :time :=174ps);
port (A, B, C, D: in std_logic; 
      Y : out std_logic);
end entity;

architecture dataflow of and4 is
begin Y <= A and B and C and D after delay;
end dataflow;

library ieee;
use ieee.std_logic_1164.all;
entity nand2 is 
generic (delay :time :=29 ps);
port (A, B: in std_logic ; 
      Y : out std_logic);
end entity;

architecture dataflow of nand2 is
begin Y <= not(A and B) after delay;
end dataflow;

library ieee;
use ieee.std_logic_1164.all;
entity nand3 is 
generic (delay :time :=46 ps);
port (A, B, C: in std_logic ; 
      Y : out std_logic);
end entity;

architecture dataflow of nand3 is
begin Y <= not (A and B and C) after delay;
end dataflow;

library ieee;
use ieee.std_logic_1164.all;
entity nand4 is 
generic (delay :time :=55 ps);
port (A, B, C, D :in std_logic ; 
      Y : out std_logic);
end entity;

architecture dataflow of nand4 is
begin Y <= not(A and B and C and D) after delay;
end dataflow;

library ieee;
use ieee.std_logic_1164.all;
entity nand5 is 
generic (delay :time :=65 ps);
port (A, B, C, D, E :in std_logic ; 
      Y : out std_logic);
end entity;

architecture dataflow of nand5 is
begin Y <= not(A and B and C and D and E) after delay;
end dataflow;

library ieee;
use ieee.std_logic_1164.all;
entity xor2 is 
generic (delay :time :=174 ps);
port (A, B: in std_logic ; 
      Y : out std_logic);
end entity;

architecture dataflow of xor2 is
begin Y <= A xor B after delay;
end dataflow;
