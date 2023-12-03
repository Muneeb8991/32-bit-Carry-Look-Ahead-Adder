library ieee;
use ieee.std_logic_1164.all;
use work.myUnits.all;
entity ADD4 is
port(A, B: in std_logic_vector (3 downto 0);
     S: out std_logic_vector (3 downto 0);
     Cin :in std_logic;
     Cout: out std_logic;
     P_03, G_03 : out std_logic
     );
end  entity;

architecture strcutural of ADD4 is
signal iSig : std_logic_vector (13 downto 0);
component CLA4 is
port (P,G : in std_logic_vector (3 downto 0);
   C: out std_logic_vector (3 downto 0);
   C0: in std_logic;
   P_03, G_03 : inout std_logic);
end component CLA4;

component pfa
port(A, B, C: in std_logic;
     P, G, S: out std_logic
     );
end component;
begin
pf1 : pfa
port map (A=>A(0), B=>B(0), C=>Cin, G=>iSig(0), S=>S(0), P=>iSig(4));
pf2 : pfa
port map (A=>A(1), B=>B(1), C=>iSig(8), G=>iSig(1), S=>S(1), P=>iSig(5));
pf3 : pfa
port map (A=>A(2), B=>B(2), C=>iSig(9), G=>iSig(2), S=>S(2), P=>iSig(6));
pf4 : pfa
port map (A=>A(3), B=>B(3), C=>iSig(10), G=>iSig(3), S=>S(3), P=>iSig(7));

la: CLA4
port map(P=>iSig(7 downto 4) , G=>iSig(3 downto 0), C=>iSig(11 downto 8), C0=>Cin, P_03=>iSig(12), G_03=>iSig(13));
Cout <= iSig(11);
P_03 <= iSig(12);
G_03 <= iSig(13);
end architecture;

