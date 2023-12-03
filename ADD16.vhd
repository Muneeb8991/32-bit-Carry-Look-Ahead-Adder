library ieee;
use ieee.std_logic_1164.all;
use work.myUnits.all;
entity ADD16 is
port(A, B: in std_logic_vector (15 downto 0);
     S: out std_logic_vector (15 downto 0);
     Cout :out std_logic;
     Cin :in std_logic;
     P_03, G_03 : out std_logic
     );
end  entity;


architecture structural of ADD16 is
component ADD4 is
port(A, B: in std_logic_vector (3 downto 0);
     S: out std_logic_vector (3 downto 0);
     Cout :out std_logic;
     Cin :in std_logic;
     P_03, G_03 : out std_logic
     );
end component ADD4;
component CLA4 is
port (P,G : in std_logic_vector (3 downto 0);
   C: out std_logic_vector (3 downto 0);
   C0: in std_logic;
   P_03, G_03 : inout std_logic);
end component CLA4;
signal iSig : std_logic_vector(13 downto 0);
begin
add0: ADD4
port map(A=>A(3 downto 0), B=>B(3 downto 0), S=>S(3 downto 0), Cout=>open, Cin=>Cin, P_03=>iSig(0), G_03=>iSig(4));
add1: ADD4
port map(A=>A(7 downto 4), B=>B(7 downto 4), S=>S(7 downto 4), Cout=>open, Cin=>iSig(8), P_03=>iSig(1), G_03=>iSig(5));
add2: ADD4
port map(A=>A(11 downto 8), B=>B(11 downto 8), S=>S(11 downto 8), Cout=>open, Cin=>iSig(9), P_03=>iSig(2), G_03=>iSig(6));
add3: ADD4
port map(A=>A(15 downto 12), B=>B(15 downto 12), S=>S(15 downto 12), Cout=>open, Cin=>iSig(10), P_03=>iSig(3), G_03=>iSig(7));

la: CLA4
port map(C0=>Cin, P=>iSig(3 downto 0), G=>iSig(7 downto 4), C=>iSig(11 downto 8), P_03=>iSig(12), G_03=>iSig(13));
Cout <= iSig(11);
P_03<=iSig(12);
G_03<=iSig(13);
end structural;