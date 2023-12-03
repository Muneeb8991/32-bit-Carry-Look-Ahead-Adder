library ieee;
use ieee.std_logic_1164.all;
use work.myUnits.all;
entity CLA4 is
port(C0: in std_logic;
     G, P: in std_logic_vector (3 downto 0);
     C: out std_logic_vector (3 downto 0);
     P_03, G_03 : out std_logic
     );
end  entity;

architecture stru_delay of CLA4 is 
signal iSig: std_logic_vector (16 downto 0);
begin
--generation of C(0)
i1 : inv
generic map(0 ns)
port map(A=>G(0), Y=>iSig(0));
n1 : nand2
generic map(0 ns)
port map(A=>P(0), B=>C0, Y=>iSig(1));
n2 : nand2
generic map(0 ns)
port map(A=>iSig(0), B=>iSig(1), Y=>C(0));

--generation of C(1)
i2 : inv
generic map(0 ns)
port map(A=>G(1), Y=>iSig(2));
n3 : nand2
generic map(0 ns)
port map(A=>G(0), B=>P(1), Y=>iSig(3));
n4: nand3
generic map(0 ns)
port map(A=>P(0), B=>P(1), C=>C0, Y=>iSig(4));
n5: nand3
generic map(0 ns)
port map(A=>iSig(2), B=>iSig(3), C=>iSig(4), Y=>C(1));

--generation of C(2)
i3 : inv
generic map(0 ns)
port map(A=>G(2), Y=>iSig(5));
n6 : nand2
generic map(0 ns)
port map(A=>G(1), B=>P(2), Y=>iSig(6));
n7: nand3
generic map(0 ns)
port map(A=>G(0), B=>P(2), C=>P(1), Y=>iSig(7));
n8: nand4
generic map(0 ns)
port map(A=>P(2), B=>P(1), C=>P(0),  D=>C0, Y=>iSig(8));
n9: nand4
generic map(0 ns)
port map(A=>iSig(5), B=>iSig(6), C=>iSig(7),  D=>iSig(8), Y=>C(2));

--generation of C(3)
i4 : inv
generic map(0 ns)
port map(A=>G(3), Y=>iSig(9));
n10 : nand2
generic map(0 ns)
port map(A=>P(3), B=>G(2), Y=>iSig(10));
n11: nand3
generic map(0 ns)
port map(A=>G(1), B=>P(3), C=>P(2), Y=>iSig(11));
n12: nand4
generic map(0 ns)
port map(A=>P(1), B=>P(2), C=>P(3),  D=>G(0), Y=>iSig(12));
n13: nand5
generic map(0 ns)
port map(A=>P(0), B=>P(1), C=>P(2),  D=>P(3), E=>C0, Y=>iSig(13));
n14: nand5
generic map(0 ns)
port map(A=>iSig(9), B=>iSig(10), C=>iSig(11),  D=>iSig(12), E=>iSig(13), Y=>C(3));

--generation of G_03
i5 : inv
generic map(0 ns)
port map(A=>G(3), Y=>iSig(14));
n15: nand4
generic map(0 ns)
port map(A=>iSig(10), B=>iSig(11), C=>iSig(12),  D=>iSig(14), Y=>G_03);

--generation of P_03
n16 : nand4
generic map(0 ns)
port map(A=>P(0), B=>P(1), C=>P(2), D=>P(3), Y=>iSig(15));
i6 : inv
generic map(0 ns)
port map(A=> iSig(15), Y=>P_03);
end architecture;


library ieee;
use ieee.std_logic_1164.all;
use work.myUnits.all;

entity CLA2 is
port(C0: in std_logic;
     G, P: in std_logic_vector (1 downto 0);
     C: out std_logic_vector (1 downto 0);
     P_01, G_01 : inout std_logic
     );
end  entity;

architecture stru_delay of CLA2 is 
signal iSig: std_logic_vector (7 downto 0);
begin

--generation of C(0)
i1 : inv
generic map(0 ns)
port map(A=>G(0), Y=>iSig(0));
n1 : nand2
generic map(0 ns)
port map(A=>P(0), B=>C0, Y=>iSig(1));
n2 : nand2
generic map(0 ns)
port map(A=>iSig(0), B=>iSig(1), Y=>C(0));

--generation of C(1)
i2 : inv
generic map(0 ns)
port map(A=>G(1), Y=>iSig(2));
n3 : nand2
generic map(0 ns)
port map(A=>G(0), B=>P(1), Y=>iSig(3));
n4: nand3
generic map(0 ns)
port map(A=>P(1), B=>P(0), C=>C0, Y=>iSig(4));
n5: nand3
generic map(0 ns)
port map(A=>iSig(2), B=>iSig(3), C=>iSig(4), Y=>C(1));

--generation of G_01
i3 : inv
generic map(0 ns)
port map(A=>G(1), Y=>iSig(6));
n6: nand2
generic map(0 ns)
port map(A=>iSig(3), B=>iSig(6), Y=>G_01);

--generation of P_01
n7 : nand2
generic map(0 ns)
port map(A=>P(0), B=>P(1), Y=>iSig(7));
i4 : inv
generic map(0 ns)
port map(A=> iSig(7), Y=>P_01);
end architecture;
