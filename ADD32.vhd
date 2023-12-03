library ieee;
use ieee.std_logic_1164.all;
use work.myUnits.all;
entity add32 is
port(A, B: in std_logic_vector (31 downto 0);
     S: out std_logic_vector (31 downto 0);
     Cin :in std_logic;
     Cout :out std_logic
     );
end entity;


architecture structural of add32 is
component ADD16 is
port(A, B: in std_logic_vector (15 downto 0);
     S: out std_logic_vector (15 downto 0);
     Cout :out std_logic;
     Cin :in std_logic;
     P_03, G_03 : out std_logic
     );
end  component;

component CLA2 is
port(C0: in std_logic;
     G, P: in std_logic_vector (1 downto 0);
     C: out std_logic_vector (1 downto 0);
     P_01, G_01 : inout std_logic
     );
end  component;

signal iSig: std_logic_vector (5 downto 0);
begin
add_1 : ADD16
port map(A=>A(15 downto 0), B=>B(15 downto 0), S=>S(15 downto 0), Cin=>Cin, Cout=>open, P_03=>iSig(0), G_03=>iSig(2));
add_2: add16
port map(A=>A(31 downto 16), B=>B(31 downto 16), S=>S(31 downto 16), Cin=>iSig(4), Cout=>open, P_03=>iSig(1), G_03=>iSig(3));
cla_1:CLA2
port map(C0=>Cin, P=>iSig(1 downto 0), G=>iSig(3 downto 2), C=>iSig(5 downto 4), P_01 =>open, G_01=>open);
Cout <=iSig(5);
end architecture;

