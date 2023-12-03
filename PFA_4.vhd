library ieee;
use ieee.std_logic_1164.all;
use work.myUnits.all;
entity pfa is
port(A, B, C: in std_logic;
     G, S, P: out std_logic
     );
end  entity;

architecture stru_delay of pfa is 
signal iSig : std_logic;
begin
a1 : and2
port map(A=>A, B=>B, Y=>G);

x1 : xor2
port map(A=>A, B=>B, Y=>iSig);

x2 : xor2
port map(A=>iSig, B=>C, Y=>S);
P<=iSig;
end architecture;

architecture stru_nodelay of pfa is 
signal iSig : std_logic;
begin
a1 : and2
port map(A=>A, B=>B, Y=>G);

x1 : xor2
port map(A=>A, B=>B, Y=>iSig);

x2 : xor2
port map(A=>iSig, B=>C, Y=>S);
P<=iSig;
end architecture;