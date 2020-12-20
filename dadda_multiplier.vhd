library ieee;
use ieee.std_logic_1164.all;

entity dadda_multiplier is 
port(A,B: in std_logic_vector(15 downto 0);
		p:out std_logic_vector(31 downto 0));
end entity dadda_multiplier;

architecture rtl of dadda_multiplier is 
    FUNCTION max(LEFT, RIGHT : INTEGER) RETURN INTEGER IS
    BEGIN
        IF LEFT > RIGHT THEN
            RETURN LEFT;
        ELSE
            RETURN RIGHT;
        END IF;
    END;
    FUNCTION min(LEFT, RIGHT : INTEGER) RETURN INTEGER IS
    BEGIN
        IF LEFT < RIGHT THEN
            RETURN LEFT;
        ELSE
            RETURN RIGHT;
        END IF;
    END;
    TYPE matrix IS ARRAY (15 DOWNTO 0) OF std_logic_vector(15 DOWNTO 0);
    SIGNAL pp : matrix;
   
    TYPE SUM_0 IS ARRAY (31 DOWNTO 0) OF std_logic_vector(1 DOWNTO 0);
    TYPE CARRY_0 IS ARRAY (31 DOWNTO 0) OF std_logic_vector(1 DOWNTO 0);
    TYPE SUM_1 IS ARRAY (31 DOWNTO 0) OF std_logic_vector(3 DOWNTO 0);
    TYPE CARRY_1 IS ARRAY (31 DOWNTO 0) OF std_logic_vector(3 DOWNTO 0);	 
    TYPE SUM_2 IS ARRAY (31 DOWNTO 0) OF std_logic_vector(2 DOWNTO 0);
    TYPE CARRY_2 IS ARRAY (31 DOWNTO 0) OF std_logic_vector(2 DOWNTO 0);
	 TYPE SUM_3 IS ARRAY (31 DOWNTO 0) OF std_logic_vector(1 DOWNTO 0);
    TYPE CARRY_3 IS ARRAY (31 DOWNTO 0) OF std_logic_vector(1 DOWNTO 0);
	 TYPE SUM_4 IS ARRAY (31 DOWNTO 0) OF std_logic_vector(1 DOWNTO 0);
    TYPE CARRY_4 IS ARRAY (31 DOWNTO 0) OF std_logic_vector(1 DOWNTO 0);
	 TYPE SUM_5 IS ARRAY (31 DOWNTO 0) OF std_logic_vector(1 DOWNTO 0);
    TYPE CARRY_5 IS ARRAY (31 DOWNTO 0) OF std_logic_vector(1 DOWNTO 0);
	 
	 TYPE cap19 IS ARRAY (31 DOWNTO 0) OF std_logic_vector(18 DOWNTO 0);
    TYPE cap13 IS ARRAY (31 DOWNTO 0) OF std_logic_vector(12 DOWNTO 0);
    TYPE cap9 IS ARRAY (31 DOWNTO 0) OF std_logic_vector(8 DOWNTO 0);
    TYPE cap6 IS ARRAY (31 DOWNTO 0) OF std_logic_vector(5 DOWNTO 0);
    TYPE cap4 IS ARRAY (31 DOWNTO 0) OF std_logic_vector(3 DOWNTO 0);
    TYPE cap3 IS ARRAY (31 DOWNTO 0) OF std_logic_vector(2 DOWNTO 0);
    TYPE cap2 IS ARRAY (31 DOWNTO 0) OF std_logic_vector(1 DOWNTO 0);
	 
    
	 SIGNAL l0 : cap19;
	 SIGNAL l1 : cap13;
    SIGNAL l2 : cap9;
    SIGNAL l3 : cap6;
    SIGNAL l4 : cap4;
    SIGNAL l5 : cap3;
	 Signal l6 : cap2;
	 
	 SIGNAL Sum_FA_0,Sum_HA_0:SUM_0;
	 SIGNAL Carry_HA_0,Carry_FA_0:CARRY_0;

	 SIGNAL Sum_FA_1,Sum_HA_1:SUM_1;
	 SIGNAL Carry_HA_1,Carry_FA_1:CARRY_1;

	 SIGNAL Sum_FA_2,Sum_HA_2:SUM_2;
	 SIGNAL Carry_HA_2,Carry_FA_2:CARRY_2;

	 SIGNAL Sum_FA_3,Sum_HA_3:SUM_3;
	 SIGNAL Carry_HA_3,Carry_FA_3:CARRY_3;

	 SIGNAL Sum_FA_4,Sum_HA_4:SUM_4;
	 SIGNAL Carry_HA_4,Carry_FA_4:CARRY_4;

	 SIGNAL Sum_FA_5,Sum_HA_5:SUM_5;
	 SIGNAL Carry_HA_5,Carry_FA_5:CARRY_5;
	 SIGNAL m,n:std_logic_vector(31 downto 0);
	 Signal o:std_logic;	
BEGIN

    -- partial product generation
    GEN_PP : FOR i IN 0 TO 15 GENERATE
        GEN_PP_COL : FOR j IN 0 TO 15 GENERATE
            AX_ij : Entity Work.And_Gate PORT MAP(B(i), A(j), pp(i)(j));
        END GENERATE;
    END GENERATE;

    --level 1 : capacity = 13
    L1_Assignement : PROCESS (pp)
        VARIABLE k : INTEGER := 0;
    BEGIN
        FOR i IN 30 DOWNTO 0 LOOP
                k := 0;
                FOR j IN max(0, i - 15) TO min(i, 15) LOOP
                    l0(i)(k) <= pp(j)(i - j);
                    k := k + 1;
        END LOOP;
		END LOOP;
    END PROCESS;
------------------------------------------------------------Stage_0----------------------------------------------------------------------------------------------------------------------------------------------------------
---------------------------bit-0---------------------------------
l1(0)<=l0(0)(12 downto 0 );
---------------------------bit-1---------------------------------
l1(1)<=l1(1)(12 downto 2) & l0(1)(1 downto 0);
---------------------------bit-2---------------------------------
l1(2)<=l1(2)(12 downto 3) & l0(2)(2 downto 0);
---------------------------bit-3---------------------------------
l1(3)<=l1(3)(12 downto 4) & l0(3)(3 downto 0);
---------------------------bit-4---------------------------------
l1(4)<=l1(4)(12 downto 5) & l0(4)(4 downto 0);
---------------------------bit-5---------------------------------
l1(5)<=l1(5)(12 downto 6) & l0(5)(5 downto 0);
---------------------------bit-6---------------------------------
l1(6)<=l1(6)(12 downto 7) & l0(6)(6 downto 0);
---------------------------bit-7---------------------------------
l1(7)<=l1(7)(12 downto 8) & l0(7)(7 downto 0);
---------------------------bit-8---------------------------------
l1(8)<=l1(8)(12 downto 9) & l0(8)(8 downto 0);
---------------------------bit-9---------------------------------
l1(9)<=l1(9)(12 downto 10) & l0(9)(9 downto 0);
---------------------------bit-10---------------------------------
l1(10)<=l1(10)(12 downto 11) & l0(10)(10 downto 0);
---------------------------bit-11---------------------------------
l1(11)<=l1(11)(12 downto 12) & l0(11)(11 downto 0);
---------------------------bit-12---------------------------------
l1(12)<=l0(12)(12 downto 0 );
---------------------------bit-13---------------------------------
uut_ha_s0_b13_0 :entity work.Half_Adder Port Map(l0(13)(0),l0(13)(1),Sum_HA_0(13)(0),Carry_HA_0(14)(0));
l1(13)<= Sum_HA_0(13)(0) & l0(13)(13 downto 2);
---------------------------bit-14---------------------------------
uut_fa_s0_b14_0 :entity work.Full_Adder Port Map(l0(14)(0),l0(14)(1),l0(14)(2),Sum_FA_0(14)(0),Carry_FA_0(15)(0));
uut_ha_s0_b14_0 :entity work.Half_Adder Port Map(l0(14)(3),l0(14)(4),Sum_HA_0(14)(0),Carry_HA_0(15)(0));
l1(14)<=Sum_FA_0(14)(0) & Carry_HA_0(14)(0) & Sum_HA_0(14)(0) & l0(14)(14 downto 5);
---------------------------bit-15---------------------------------
uut_fa_s0_b15_0 :entity work.Full_Adder Port Map(l0(15)(0),l0(15)(1),l0(15)(2),Sum_FA_0(15)(0),Carry_FA_0(16)(0));
uut_fa_s0_b15_1 :entity work.Full_Adder Port Map(l0(15)(3),l0(15)(4),l0(15)(5),Sum_FA_0(15)(1),Carry_FA_0(16)(1));
uut_ha_s0_b15_0 :entity work.Half_Adder Port Map(l0(15)(6),l0(15)(7),Sum_HA_0(15)(0),Carry_HA_0(16)(0));
l1(15)<=Sum_FA_0(15)(1 downto 0) & Carry_FA_0(15)(0) & Carry_HA_0(15)(0) & Sum_HA_0(15)(0) & l0(15)(15 downto 8);
---------------------------bit-16---------------------------------
uut_fa_s0_b16_0 :entity work.Full_Adder Port Map(l0(16)(0),l0(16)(1),l0(16)(2),Sum_FA_0(16)(0),Carry_FA_0(17)(0));
uut_fa_s0_b16_1 :entity work.Full_Adder Port Map(l0(16)(3),l0(16)(4),l0(16)(5),Sum_FA_0(16)(1),Carry_FA_0(17)(1));
uut_ha_s0_b16_0 :entity work.Half_Adder Port Map(l0(16)(6),l0(16)(7),Sum_HA_0(16)(0),Carry_HA_0(17)(0));
l1(16)<=Sum_FA_0(16)(1 downto 0) & Carry_FA_0(16)(1 downto 0) & Carry_HA_0(16)(0) & Sum_HA_0(16)(0) & l0(16)(14 downto 8);
---------------------------bit-17---------------------------------
uut_fa_s0_b17_0 :entity work.Full_Adder Port Map(l0(17)(0),l0(17)(1),l0(17)(2),Sum_FA_0(17)(0),Carry_FA_0(18)(0));
uut_fa_s0_b17_1 :entity work.Full_Adder Port Map(l0(17)(3),l0(17)(4),l0(17)(5),Sum_FA_0(17)(1),Carry_FA_0(18)(1));
l1(17)<=Sum_FA_0(17)(1 downto 0) & Carry_FA_0(17)(1 downto 0) & Carry_HA_0(17)(0) & l0(17)(13 downto 6);
---------------------------bit-18---------------------------------
uut_fa_s0_b18_0 :entity work.Full_Adder Port Map(l0(18)(0),l0(18)(1),l0(18)(2),Sum_FA_0(18)(0),Carry_FA_0(19)(0));
l1(18)<=Sum_FA_0(18)(0) & Carry_FA_0(18)(1 downto 0) & l0(18)(12 downto 3);
---------------------------bit-19---------------------------------
l1(19)<=Carry_FA_0(19)(0) & l0(19)(11 downto 0 );
---------------------------bit-20---------------------------------
l1(20)<=l1(20)(12 downto 11) & l0(20)(10 downto 0);
---------------------------bit-21---------------------------------
l1(21)<=l1(21)(12 downto 10) & l0(21)(9 downto 0);
---------------------------bit-22---------------------------------
l1(22)<=l1(22)(12 downto 9) & l0(22)(8 downto 0);
---------------------------bit-23---------------------------------
l1(23)<=l1(23)(12 downto 8) & l0(23)(7 downto 0);
---------------------------bit-24---------------------------------
l1(24)<=l1(24)(12 downto 7) & l0(24)(6 downto 0);
---------------------------bit-25---------------------------------
l1(25)<=l1(25)(12 downto 6) & l0(25)(5 downto 0);
---------------------------bit-26---------------------------------
l1(26)<=l1(26)(12 downto 5) & l0(26)(4 downto 0);
---------------------------bit-27---------------------------------
l1(27)<=l1(27)(12 downto 4) & l0(27)(3 downto 0);
---------------------------bit-28---------------------------------
l1(28)<=l1(28)(12 downto 3) & l0(28)(2 downto 0);
---------------------------bit-29---------------------------------
l1(29)<=l1(29)(12 downto 2) & l0(29)(1 downto 0);
---------------------------bit-30---------------------------------
l1(30)<=l1(30)(12 downto 1) & l0(30)(0 downto 0);
------------------------------------------------------------Stage_1----------------------------------------------------------------------------------------------------------------------------------------------------------
---------------------------bit-0---------------------------------
l2(0)<=l1(0)(8 downto 0 );
---------------------------bit-1---------------------------------
l2(1)<=l2(1)(8 downto 2) & l1(1)(1 downto 0);
---------------------------bit-2---------------------------------
l2(2)<=l2(2)(8 downto 3) & l1(2)(2 downto 0);
---------------------------bit-3---------------------------------
l2(3)<=l2(3)(8 downto 4) & l1(3)(3 downto 0);
---------------------------bit-4---------------------------------
l2(4)<=l2(4)(8 downto 5) & l1(4)(4 downto 0);
---------------------------bit-5---------------------------------
l2(5)<=l2(5)(8 downto 6) & l1(5)(5 downto 0);
---------------------------bit-6---------------------------------
l2(6)<=l2(6)(8 downto 7) & l1(6)(6 downto 0);
---------------------------bit-7---------------------------------
l2(7)<=l2(7)(8 downto 8) & l1(7)(7 downto 0);
---------------------------bit-8---------------------------------
l2(8)<=l1(8)(8 downto 0 );
---------------------------bit-9---------------------------------
uut_ha_s1_b9_0 :entity work.Half_Adder Port Map(l1(9)(0),l1(9)(1),Sum_HA_1(9)(0),Carry_HA_1(10)(0));
l2(9)<= Sum_HA_1(9)(0) & l1(9)(9 downto 2);
---------------------------bit-10---------------------------------
uut_fa_s1_b10_0 :entity work.Full_Adder Port Map(l1(10)(0),l1(10)(1),l1(10)(2),Sum_FA_1(10)(0),Carry_FA_1(11)(0));
uut_ha_s1_b10_0 :entity work.Half_Adder Port Map(l1(10)(3),l1(10)(4),Sum_HA_1(10)(0),Carry_HA_1(11)(0));
l2(10)<=Sum_FA_1(10)(0) & Carry_HA_1(10)(0) & Sum_HA_1(10)(0) & l1(10)(10 downto 5);
---------------------------bit-11---------------------------------
uut_fa_s1_b11_0 :entity work.Full_Adder Port Map(l1(11)(0),l1(11)(1),l1(11)(2),Sum_FA_1(11)(0),Carry_FA_1(12)(0));
uut_fa_s1_b11_1 :entity work.Full_Adder Port Map(l1(11)(3),l1(11)(4),l1(11)(5),Sum_FA_1(11)(1),Carry_FA_1(12)(1));
uut_ha_s1_b11_0 :entity work.Half_Adder Port Map(l1(11)(6),l1(11)(7),Sum_HA_1(11)(0),Carry_HA_1(12)(0));
l2(11)<=Sum_FA_1(11)(1 downto 0) & Carry_FA_1(11)(0) & Carry_HA_1(11)(0) & Sum_HA_1(11)(0) & l1(11)(11 downto 8);
---------------------------bit-12---------------------------------
uut_fa_s1_b12_0 :entity work.Full_Adder Port Map(l1(12)(0),l1(12)(1),l1(12)(2),Sum_FA_1(12)(0),Carry_FA_1(13)(0));
uut_fa_s1_b12_1 :entity work.Full_Adder Port Map(l1(12)(3),l1(12)(4),l1(12)(5),Sum_FA_1(12)(1),Carry_FA_1(13)(1));
uut_fa_s1_b12_2 :entity work.Full_Adder Port Map(l1(12)(6),l1(12)(7),l1(12)(8),Sum_FA_1(12)(2),Carry_FA_1(13)(2));
uut_ha_s1_b12_0 :entity work.Half_Adder Port Map(l1(12)(9),l1(12)(10),Sum_HA_1(12)(0),Carry_HA_1(13)(0));
l2(12)<=Sum_FA_1(12)(2 downto 0) & Carry_FA_1(12)(1 downto 0) & Carry_HA_1(12)(0) & Sum_HA_1(12)(0) & l1(12)(12 downto 11);
---------------------------bit-13---------------------------------
uut_fa_s1_b13_0 :entity work.Full_Adder Port Map(l1(13)(0),l1(13)(1),l1(13)(2),Sum_FA_1(13)(0),Carry_FA_1(14)(0));
uut_fa_s1_b13_1 :entity work.Full_Adder Port Map(l1(13)(3),l1(13)(4),l1(13)(5),Sum_FA_1(13)(1),Carry_FA_1(14)(1));
uut_fa_s1_b13_2 :entity work.Full_Adder Port Map(l1(13)(6),l1(13)(7),l1(13)(8),Sum_FA_1(13)(2),Carry_FA_1(14)(2));
uut_fa_s1_b13_3 :entity work.Full_Adder Port Map(l1(13)(9),l1(13)(10),l1(13)(11),Sum_FA_1(13)(3),Carry_FA_1(14)(3));
l2(13)<=Sum_FA_1(13)(3 downto 0) & Carry_FA_1(13)(2 downto 0) & Carry_HA_1(13)(0) & l1(13)(12 downto 12);
---------------------------bit-14---------------------------------
uut_fa_s1_b14_0 :entity work.Full_Adder Port Map(l1(14)(0),l1(14)(1),l1(14)(2),Sum_FA_1(14)(0),Carry_FA_1(15)(0));
uut_fa_s1_b14_1 :entity work.Full_Adder Port Map(l1(14)(3),l1(14)(4),l1(14)(5),Sum_FA_1(14)(1),Carry_FA_1(15)(1));
uut_fa_s1_b14_2 :entity work.Full_Adder Port Map(l1(14)(6),l1(14)(7),l1(14)(8),Sum_FA_1(14)(2),Carry_FA_1(15)(2));
uut_fa_s1_b14_3 :entity work.Full_Adder Port Map(l1(14)(9),l1(14)(10),l1(14)(11),Sum_FA_1(14)(3),Carry_FA_1(15)(3));
l2(14)<=Sum_FA_1(14)(3 downto 0) & Carry_FA_1(14)(3 downto 0) & l1(14)(12 downto 12);
---------------------------bit-15---------------------------------
uut_fa_s1_b15_0 :entity work.Full_Adder Port Map(l1(15)(0),l1(15)(1),l1(15)(2),Sum_FA_1(15)(0),Carry_FA_1(16)(0));
uut_fa_s1_b15_1 :entity work.Full_Adder Port Map(l1(15)(3),l1(15)(4),l1(15)(5),Sum_FA_1(15)(1),Carry_FA_1(16)(1));
uut_fa_s1_b15_2 :entity work.Full_Adder Port Map(l1(15)(6),l1(15)(7),l1(15)(8),Sum_FA_1(15)(2),Carry_FA_1(16)(2));
uut_fa_s1_b15_3 :entity work.Full_Adder Port Map(l1(15)(9),l1(15)(10),l1(15)(11),Sum_FA_1(15)(3),Carry_FA_1(16)(3));
l2(15)<=Sum_FA_1(15)(3 downto 0) & Carry_FA_1(15)(3 downto 0) & l1(15)(12 downto 12);
---------------------------bit-16---------------------------------
uut_fa_s1_b16_0 :entity work.Full_Adder Port Map(l1(16)(0),l1(16)(1),l1(16)(2),Sum_FA_1(16)(0),Carry_FA_1(17)(0));
uut_fa_s1_b16_1 :entity work.Full_Adder Port Map(l1(16)(3),l1(16)(4),l1(16)(5),Sum_FA_1(16)(1),Carry_FA_1(17)(1));
uut_fa_s1_b16_2 :entity work.Full_Adder Port Map(l1(16)(6),l1(16)(7),l1(16)(8),Sum_FA_1(16)(2),Carry_FA_1(17)(2));
uut_fa_s1_b16_3 :entity work.Full_Adder Port Map(l1(16)(9),l1(16)(10),l1(16)(11),Sum_FA_1(16)(3),Carry_FA_1(17)(3));
l2(16)<=Sum_FA_1(16)(3 downto 0) & Carry_FA_1(16)(3 downto 0) & l1(16)(12 downto 12);
---------------------------bit-17---------------------------------
uut_fa_s1_b17_0 :entity work.Full_Adder Port Map(l1(17)(0),l1(17)(1),l1(17)(2),Sum_FA_1(17)(0),Carry_FA_1(18)(0));
uut_fa_s1_b17_1 :entity work.Full_Adder Port Map(l1(17)(3),l1(17)(4),l1(17)(5),Sum_FA_1(17)(1),Carry_FA_1(18)(1));
uut_fa_s1_b17_2 :entity work.Full_Adder Port Map(l1(17)(6),l1(17)(7),l1(17)(8),Sum_FA_1(17)(2),Carry_FA_1(18)(2));
uut_fa_s1_b17_3 :entity work.Full_Adder Port Map(l1(17)(9),l1(17)(10),l1(17)(11),Sum_FA_1(17)(3),Carry_FA_1(18)(3));
l2(17)<=Sum_FA_1(17)(3 downto 0) & Carry_FA_1(17)(3 downto 0) & l1(17)(12 downto 12);
---------------------------bit-18---------------------------------
uut_fa_s1_b18_0 :entity work.Full_Adder Port Map(l1(18)(0),l1(18)(1),l1(18)(2),Sum_FA_1(18)(0),Carry_FA_1(19)(0));
uut_fa_s1_b18_1 :entity work.Full_Adder Port Map(l1(18)(3),l1(18)(4),l1(18)(5),Sum_FA_1(18)(1),Carry_FA_1(19)(1));
uut_fa_s1_b18_2 :entity work.Full_Adder Port Map(l1(18)(6),l1(18)(7),l1(18)(8),Sum_FA_1(18)(2),Carry_FA_1(19)(2));
uut_fa_s1_b18_3 :entity work.Full_Adder Port Map(l1(18)(9),l1(18)(10),l1(18)(11),Sum_FA_1(18)(3),Carry_FA_1(19)(3));
l2(18)<=Sum_FA_1(18)(3 downto 0) & Carry_FA_1(18)(3 downto 0) & l1(18)(12 downto 12);
---------------------------bit-19---------------------------------
uut_fa_s1_b19_0 :entity work.Full_Adder Port Map(l1(19)(0),l1(19)(1),l1(19)(2),Sum_FA_1(19)(0),Carry_FA_1(20)(0));
uut_fa_s1_b19_1 :entity work.Full_Adder Port Map(l1(19)(3),l1(19)(4),l1(19)(5),Sum_FA_1(19)(1),Carry_FA_1(20)(1));
uut_fa_s1_b19_2 :entity work.Full_Adder Port Map(l1(19)(6),l1(19)(7),l1(19)(8),Sum_FA_1(19)(2),Carry_FA_1(20)(2));
uut_fa_s1_b19_3 :entity work.Full_Adder Port Map(l1(19)(9),l1(19)(10),l1(19)(11),Sum_FA_1(19)(3),Carry_FA_1(20)(3));
l2(19)<=Sum_FA_1(19)(3 downto 0) & Carry_FA_1(19)(3 downto 0) & l1(19)(12 downto 12);
---------------------------bit-20---------------------------------
uut_fa_s1_b20_0 :entity work.Full_Adder Port Map(l1(20)(0),l1(20)(1),l1(20)(2),Sum_FA_1(20)(0),Carry_FA_1(21)(0));
uut_fa_s1_b20_1 :entity work.Full_Adder Port Map(l1(20)(3),l1(20)(4),l1(20)(5),Sum_FA_1(20)(1),Carry_FA_1(21)(1));
uut_fa_s1_b20_2 :entity work.Full_Adder Port Map(l1(20)(6),l1(20)(7),l1(20)(8),Sum_FA_1(20)(2),Carry_FA_1(21)(2));
l2(20)<=Sum_FA_1(20)(2 downto 0) & Carry_FA_1(20)(3 downto 0) & l1(20)(10 downto 9);
---------------------------bit-21---------------------------------
uut_fa_s1_b21_0 :entity work.Full_Adder Port Map(l1(21)(0),l1(21)(1),l1(21)(2),Sum_FA_1(21)(0),Carry_FA_1(22)(0));
uut_fa_s1_b21_1 :entity work.Full_Adder Port Map(l1(21)(3),l1(21)(4),l1(21)(5),Sum_FA_1(21)(1),Carry_FA_1(22)(1));
l2(21)<=Sum_FA_1(21)(1 downto 0) & Carry_FA_1(21)(2 downto 0) & l1(21)(9 downto 6);
---------------------------bit-22---------------------------------
uut_fa_s1_b22_0 :entity work.Full_Adder Port Map(l1(22)(0),l1(22)(1),l1(22)(2),Sum_FA_1(22)(0),Carry_FA_1(23)(0));
l2(22)<=Sum_FA_1(22)(0) & Carry_FA_1(22)(1 downto 0) & l1(22)(8 downto 3);
---------------------------bit-23---------------------------------
l2(23)<=Carry_FA_1(23)(0) & l1(23)(7 downto 0 );
---------------------------bit-24---------------------------------
l2(24)<=l2(24)(8 downto 7) & l1(24)(6 downto 0);
---------------------------bit-25---------------------------------
l2(25)<=l2(25)(8 downto 6) & l1(25)(5 downto 0);
---------------------------bit-26---------------------------------
l2(26)<=l2(26)(8 downto 5) & l1(26)(4 downto 0);
---------------------------bit-27---------------------------------
l2(27)<=l2(27)(8 downto 4) & l1(27)(3 downto 0);
---------------------------bit-28---------------------------------
l2(28)<=l2(28)(8 downto 3) & l1(28)(2 downto 0);
---------------------------bit-29---------------------------------
l2(29)<=l2(29)(8 downto 2) & l1(29)(1 downto 0);
---------------------------bit-30---------------------------------
l2(30)<=l2(30)(8 downto 1) & l1(30)(0 downto 0);
------------------------------------------------------------Stage_2----------------------------------------------------------------------------------------------------------------------------------------------------------
---------------------------bit-0---------------------------------
l3(0)<=l2(0)(5 downto 0 );
---------------------------bit-1---------------------------------
l3(1)<=l3(1)(5 downto 2) & l2(1)(1 downto 0);
---------------------------bit-2---------------------------------
l3(2)<=l3(2)(5 downto 3) & l2(2)(2 downto 0);
---------------------------bit-3---------------------------------
l3(3)<=l3(3)(5 downto 4) & l2(3)(3 downto 0);
---------------------------bit-4---------------------------------
l3(4)<=l3(4)(5 downto 5) & l2(4)(4 downto 0);
---------------------------bit-5---------------------------------
l3(5)<=l2(5)(5 downto 0 );
---------------------------bit-6---------------------------------
uut_ha_s2_b6_0 :entity work.Half_Adder Port Map(l2(6)(0),l2(6)(1),Sum_HA_2(6)(0),Carry_HA_2(7)(0));
l3(6)<= Sum_HA_2(6)(0) & l2(6)(6 downto 2);
---------------------------bit-7---------------------------------
uut_fa_s2_b7_0 :entity work.Full_Adder Port Map(l2(7)(0),l2(7)(1),l2(7)(2),Sum_FA_2(7)(0),Carry_FA_2(8)(0));
uut_ha_s2_b7_0 :entity work.Half_Adder Port Map(l2(7)(3),l2(7)(4),Sum_HA_2(7)(0),Carry_HA_2(8)(0));
l3(7)<=Sum_FA_2(7)(0) & Carry_HA_2(7)(0) & Sum_HA_2(7)(0) & l2(7)(7 downto 5);
---------------------------bit-8---------------------------------
uut_fa_s2_b8_0 :entity work.Full_Adder Port Map(l2(8)(0),l2(8)(1),l2(8)(2),Sum_FA_2(8)(0),Carry_FA_2(9)(0));
uut_fa_s2_b8_1 :entity work.Full_Adder Port Map(l2(8)(3),l2(8)(4),l2(8)(5),Sum_FA_2(8)(1),Carry_FA_2(9)(1));
uut_ha_s2_b8_0 :entity work.Half_Adder Port Map(l2(8)(6),l2(8)(7),Sum_HA_2(8)(0),Carry_HA_2(9)(0));
l3(8)<=Sum_FA_2(8)(1 downto 0) & Carry_FA_2(8)(0) & Carry_HA_2(8)(0) & Sum_HA_2(8)(0) & l2(8)(8 downto 8);
---------------------------bit-9---------------------------------
uut_fa_s2_b9_0 :entity work.Full_Adder Port Map(l2(9)(0),l2(9)(1),l2(9)(2),Sum_FA_2(9)(0),Carry_FA_2(10)(0));
uut_fa_s2_b9_1 :entity work.Full_Adder Port Map(l2(9)(3),l2(9)(4),l2(9)(5),Sum_FA_2(9)(1),Carry_FA_2(10)(1));
uut_fa_s2_b9_2 :entity work.Full_Adder Port Map(l2(9)(6),l2(9)(7),l2(9)(8),Sum_FA_2(9)(2),Carry_FA_2(10)(2));
l3(9)<=Sum_FA_2(9)(2 downto 0) & Carry_FA_2(9)(1 downto 0) & Carry_HA_2(9)(0) ;
---------------------------bit-10---------------------------------
uut_fa_s2_b10_0 :entity work.Full_Adder Port Map(l2(10)(0),l2(10)(1),l2(10)(2),Sum_FA_2(10)(0),Carry_FA_2(11)(0));
uut_fa_s2_b10_1 :entity work.Full_Adder Port Map(l2(10)(3),l2(10)(4),l2(10)(5),Sum_FA_2(10)(1),Carry_FA_2(11)(1));
uut_fa_s2_b10_2 :entity work.Full_Adder Port Map(l2(10)(6),l2(10)(7),l2(10)(8),Sum_FA_2(10)(2),Carry_FA_2(11)(2));
l3(10)<=Sum_FA_2(10)(2 downto 0) & Carry_FA_2(10)(2 downto 0) ;
---------------------------bit-11---------------------------------
uut_fa_s2_b11_0 :entity work.Full_Adder Port Map(l2(11)(0),l2(11)(1),l2(11)(2),Sum_FA_2(11)(0),Carry_FA_2(12)(0));
uut_fa_s2_b11_1 :entity work.Full_Adder Port Map(l2(11)(3),l2(11)(4),l2(11)(5),Sum_FA_2(11)(1),Carry_FA_2(12)(1));
uut_fa_s2_b11_2 :entity work.Full_Adder Port Map(l2(11)(6),l2(11)(7),l2(11)(8),Sum_FA_2(11)(2),Carry_FA_2(12)(2));
l3(11)<=Sum_FA_2(11)(2 downto 0) & Carry_FA_2(11)(2 downto 0) ;
---------------------------bit-12---------------------------------
uut_fa_s2_b12_0 :entity work.Full_Adder Port Map(l2(12)(0),l2(12)(1),l2(12)(2),Sum_FA_2(12)(0),Carry_FA_2(13)(0));
uut_fa_s2_b12_1 :entity work.Full_Adder Port Map(l2(12)(3),l2(12)(4),l2(12)(5),Sum_FA_2(12)(1),Carry_FA_2(13)(1));
uut_fa_s2_b12_2 :entity work.Full_Adder Port Map(l2(12)(6),l2(12)(7),l2(12)(8),Sum_FA_2(12)(2),Carry_FA_2(13)(2));
l3(12)<=Sum_FA_2(12)(2 downto 0) & Carry_FA_2(12)(2 downto 0) ;
---------------------------bit-13---------------------------------
uut_fa_s2_b13_0 :entity work.Full_Adder Port Map(l2(13)(0),l2(13)(1),l2(13)(2),Sum_FA_2(13)(0),Carry_FA_2(14)(0));
uut_fa_s2_b13_1 :entity work.Full_Adder Port Map(l2(13)(3),l2(13)(4),l2(13)(5),Sum_FA_2(13)(1),Carry_FA_2(14)(1));
uut_fa_s2_b13_2 :entity work.Full_Adder Port Map(l2(13)(6),l2(13)(7),l2(13)(8),Sum_FA_2(13)(2),Carry_FA_2(14)(2));
l3(13)<=Sum_FA_2(13)(2 downto 0) & Carry_FA_2(13)(2 downto 0) ;
---------------------------bit-14---------------------------------
uut_fa_s2_b14_0 :entity work.Full_Adder Port Map(l2(14)(0),l2(14)(1),l2(14)(2),Sum_FA_2(14)(0),Carry_FA_2(15)(0));
uut_fa_s2_b14_1 :entity work.Full_Adder Port Map(l2(14)(3),l2(14)(4),l2(14)(5),Sum_FA_2(14)(1),Carry_FA_2(15)(1));
uut_fa_s2_b14_2 :entity work.Full_Adder Port Map(l2(14)(6),l2(14)(7),l2(14)(8),Sum_FA_2(14)(2),Carry_FA_2(15)(2));
l3(14)<=Sum_FA_2(14)(2 downto 0) & Carry_FA_2(14)(2 downto 0) ;
---------------------------bit-15---------------------------------
uut_fa_s2_b15_0 :entity work.Full_Adder Port Map(l2(15)(0),l2(15)(1),l2(15)(2),Sum_FA_2(15)(0),Carry_FA_2(16)(0));
uut_fa_s2_b15_1 :entity work.Full_Adder Port Map(l2(15)(3),l2(15)(4),l2(15)(5),Sum_FA_2(15)(1),Carry_FA_2(16)(1));
uut_fa_s2_b15_2 :entity work.Full_Adder Port Map(l2(15)(6),l2(15)(7),l2(15)(8),Sum_FA_2(15)(2),Carry_FA_2(16)(2));
l3(15)<=Sum_FA_2(15)(2 downto 0) & Carry_FA_2(15)(2 downto 0) ;
---------------------------bit-16---------------------------------
uut_fa_s2_b16_0 :entity work.Full_Adder Port Map(l2(16)(0),l2(16)(1),l2(16)(2),Sum_FA_2(16)(0),Carry_FA_2(17)(0));
uut_fa_s2_b16_1 :entity work.Full_Adder Port Map(l2(16)(3),l2(16)(4),l2(16)(5),Sum_FA_2(16)(1),Carry_FA_2(17)(1));
uut_fa_s2_b16_2 :entity work.Full_Adder Port Map(l2(16)(6),l2(16)(7),l2(16)(8),Sum_FA_2(16)(2),Carry_FA_2(17)(2));
l3(16)<=Sum_FA_2(16)(2 downto 0) & Carry_FA_2(16)(2 downto 0) ;
---------------------------bit-17---------------------------------
uut_fa_s2_b17_0 :entity work.Full_Adder Port Map(l2(17)(0),l2(17)(1),l2(17)(2),Sum_FA_2(17)(0),Carry_FA_2(18)(0));
uut_fa_s2_b17_1 :entity work.Full_Adder Port Map(l2(17)(3),l2(17)(4),l2(17)(5),Sum_FA_2(17)(1),Carry_FA_2(18)(1));
uut_fa_s2_b17_2 :entity work.Full_Adder Port Map(l2(17)(6),l2(17)(7),l2(17)(8),Sum_FA_2(17)(2),Carry_FA_2(18)(2));
l3(17)<=Sum_FA_2(17)(2 downto 0) & Carry_FA_2(17)(2 downto 0) ;
---------------------------bit-18---------------------------------
uut_fa_s2_b18_0 :entity work.Full_Adder Port Map(l2(18)(0),l2(18)(1),l2(18)(2),Sum_FA_2(18)(0),Carry_FA_2(19)(0));
uut_fa_s2_b18_1 :entity work.Full_Adder Port Map(l2(18)(3),l2(18)(4),l2(18)(5),Sum_FA_2(18)(1),Carry_FA_2(19)(1));
uut_fa_s2_b18_2 :entity work.Full_Adder Port Map(l2(18)(6),l2(18)(7),l2(18)(8),Sum_FA_2(18)(2),Carry_FA_2(19)(2));
l3(18)<=Sum_FA_2(18)(2 downto 0) & Carry_FA_2(18)(2 downto 0) ;
---------------------------bit-19---------------------------------
uut_fa_s2_b19_0 :entity work.Full_Adder Port Map(l2(19)(0),l2(19)(1),l2(19)(2),Sum_FA_2(19)(0),Carry_FA_2(20)(0));
uut_fa_s2_b19_1 :entity work.Full_Adder Port Map(l2(19)(3),l2(19)(4),l2(19)(5),Sum_FA_2(19)(1),Carry_FA_2(20)(1));
uut_fa_s2_b19_2 :entity work.Full_Adder Port Map(l2(19)(6),l2(19)(7),l2(19)(8),Sum_FA_2(19)(2),Carry_FA_2(20)(2));
l3(19)<=Sum_FA_2(19)(2 downto 0) & Carry_FA_2(19)(2 downto 0) ;
---------------------------bit-20---------------------------------
uut_fa_s2_b20_0 :entity work.Full_Adder Port Map(l2(20)(0),l2(20)(1),l2(20)(2),Sum_FA_2(20)(0),Carry_FA_2(21)(0));
uut_fa_s2_b20_1 :entity work.Full_Adder Port Map(l2(20)(3),l2(20)(4),l2(20)(5),Sum_FA_2(20)(1),Carry_FA_2(21)(1));
uut_fa_s2_b20_2 :entity work.Full_Adder Port Map(l2(20)(6),l2(20)(7),l2(20)(8),Sum_FA_2(20)(2),Carry_FA_2(21)(2));
l3(20)<=Sum_FA_2(20)(2 downto 0) & Carry_FA_2(20)(2 downto 0) ;
---------------------------bit-21---------------------------------
uut_fa_s2_b21_0 :entity work.Full_Adder Port Map(l2(21)(0),l2(21)(1),l2(21)(2),Sum_FA_2(21)(0),Carry_FA_2(22)(0));
uut_fa_s2_b21_1 :entity work.Full_Adder Port Map(l2(21)(3),l2(21)(4),l2(21)(5),Sum_FA_2(21)(1),Carry_FA_2(22)(1));
uut_fa_s2_b21_2 :entity work.Full_Adder Port Map(l2(21)(6),l2(21)(7),l2(21)(8),Sum_FA_2(21)(2),Carry_FA_2(22)(2));
l3(21)<=Sum_FA_2(21)(2 downto 0) & Carry_FA_2(21)(2 downto 0) ;
---------------------------bit-22---------------------------------
uut_fa_s2_b22_0 :entity work.Full_Adder Port Map(l2(22)(0),l2(22)(1),l2(22)(2),Sum_FA_2(22)(0),Carry_FA_2(23)(0));
uut_fa_s2_b22_1 :entity work.Full_Adder Port Map(l2(22)(3),l2(22)(4),l2(22)(5),Sum_FA_2(22)(1),Carry_FA_2(23)(1));
uut_fa_s2_b22_2 :entity work.Full_Adder Port Map(l2(22)(6),l2(22)(7),l2(22)(8),Sum_FA_2(22)(2),Carry_FA_2(23)(2));
l3(22)<=Sum_FA_2(22)(2 downto 0) & Carry_FA_2(22)(2 downto 0) ;
---------------------------bit-23---------------------------------
uut_fa_s2_b23_0 :entity work.Full_Adder Port Map(l2(23)(0),l2(23)(1),l2(23)(2),Sum_FA_2(23)(0),Carry_FA_2(24)(0));
uut_fa_s2_b23_1 :entity work.Full_Adder Port Map(l2(23)(3),l2(23)(4),l2(23)(5),Sum_FA_2(23)(1),Carry_FA_2(24)(1));
uut_fa_s2_b23_2 :entity work.Full_Adder Port Map(l2(23)(6),l2(23)(7),l2(23)(8),Sum_FA_2(23)(2),Carry_FA_2(24)(2));
l3(23)<=Sum_FA_2(23)(2 downto 0) & Carry_FA_2(23)(2 downto 0) ;
---------------------------bit-24---------------------------------
uut_fa_s2_b24_0 :entity work.Full_Adder Port Map(l2(24)(0),l2(24)(1),l2(24)(2),Sum_FA_2(24)(0),Carry_FA_2(25)(0));
uut_fa_s2_b24_1 :entity work.Full_Adder Port Map(l2(24)(3),l2(24)(4),l2(24)(5),Sum_FA_2(24)(1),Carry_FA_2(25)(1));
l3(24)<=Sum_FA_2(24)(1 downto 0) & Carry_FA_2(24)(2 downto 0) & l2(24)(6 downto 6);
---------------------------bit-25---------------------------------
uut_fa_s2_b25_0 :entity work.Full_Adder Port Map(l2(25)(0),l2(25)(1),l2(25)(2),Sum_FA_2(25)(0),Carry_FA_2(26)(0));
l3(25)<=Sum_FA_2(25)(0) & Carry_FA_2(25)(1 downto 0) & l2(25)(5 downto 3);
---------------------------bit-26---------------------------------
l3(26)<=Carry_FA_2(26)(0) & l2(26)(4 downto 0 );
---------------------------bit-27---------------------------------
l3(27)<=l3(27)(5 downto 4) & l2(27)(3 downto 0);
---------------------------bit-28---------------------------------
l3(28)<=l3(28)(5 downto 3) & l2(28)(2 downto 0);
---------------------------bit-29---------------------------------
l3(29)<=l3(29)(5 downto 2) & l2(29)(1 downto 0);
---------------------------bit-30---------------------------------
l3(30)<=l3(30)(5 downto 1) & l2(30)(0 downto 0);
------------------------------------------------------------Stage_3----------------------------------------------------------------------------------------------------------------------------------------------------------
---------------------------bit-0---------------------------------
l4(0)<=l3(0)(3 downto 0 );
---------------------------bit-1---------------------------------
l4(1)<=l4(1)(3 downto 2) & l3(1)(1 downto 0);
---------------------------bit-2---------------------------------
l4(2)<=l4(2)(3 downto 3) & l3(2)(2 downto 0);
---------------------------bit-3---------------------------------
l4(3)<=l3(3)(3 downto 0 );
---------------------------bit-4---------------------------------
uut_ha_s3_b4_0 :entity work.Half_Adder Port Map(l3(4)(0),l3(4)(1),Sum_HA_3(4)(0),Carry_HA_3(5)(0));
l4(4)<= Sum_HA_3(4)(0) & l3(4)(4 downto 2);
---------------------------bit-5---------------------------------
uut_fa_s3_b5_0 :entity work.Full_Adder Port Map(l3(5)(0),l3(5)(1),l3(5)(2),Sum_FA_3(5)(0),Carry_FA_3(6)(0));
uut_ha_s3_b5_0 :entity work.Half_Adder Port Map(l3(5)(3),l3(5)(4),Sum_HA_3(5)(0),Carry_HA_3(6)(0));
l4(5)<=Sum_FA_3(5)(0) & Carry_HA_3(5)(0) & Sum_HA_3(5)(0) & l3(5)(5 downto 5);
---------------------------bit-6---------------------------------
uut_fa_s3_b6_0 :entity work.Full_Adder Port Map(l3(6)(0),l3(6)(1),l3(6)(2),Sum_FA_3(6)(0),Carry_FA_3(7)(0));
uut_fa_s3_b6_1 :entity work.Full_Adder Port Map(l3(6)(3),l3(6)(4),l3(6)(5),Sum_FA_3(6)(1),Carry_FA_3(7)(1));
l4(6)<=Sum_FA_3(6)(1 downto 0) & Carry_FA_3(6)(0) & Carry_HA_3(6)(0) ;
---------------------------bit-7---------------------------------
uut_fa_s3_b7_0 :entity work.Full_Adder Port Map(l3(7)(0),l3(7)(1),l3(7)(2),Sum_FA_3(7)(0),Carry_FA_3(8)(0));
uut_fa_s3_b7_1 :entity work.Full_Adder Port Map(l3(7)(3),l3(7)(4),l3(7)(5),Sum_FA_3(7)(1),Carry_FA_3(8)(1));
l4(7)<=Sum_FA_3(7)(1 downto 0) & Carry_FA_3(7)(1 downto 0) ;
---------------------------bit-8---------------------------------
uut_fa_s3_b8_0 :entity work.Full_Adder Port Map(l3(8)(0),l3(8)(1),l3(8)(2),Sum_FA_3(8)(0),Carry_FA_3(9)(0));
uut_fa_s3_b8_1 :entity work.Full_Adder Port Map(l3(8)(3),l3(8)(4),l3(8)(5),Sum_FA_3(8)(1),Carry_FA_3(9)(1));
l4(8)<=Sum_FA_3(8)(1 downto 0) & Carry_FA_3(8)(1 downto 0) ;
---------------------------bit-9---------------------------------
uut_fa_s3_b9_0 :entity work.Full_Adder Port Map(l3(9)(0),l3(9)(1),l3(9)(2),Sum_FA_3(9)(0),Carry_FA_3(10)(0));
uut_fa_s3_b9_1 :entity work.Full_Adder Port Map(l3(9)(3),l3(9)(4),l3(9)(5),Sum_FA_3(9)(1),Carry_FA_3(10)(1));
l4(9)<=Sum_FA_3(9)(1 downto 0) & Carry_FA_3(9)(1 downto 0) ;
---------------------------bit-10---------------------------------
uut_fa_s3_b10_0 :entity work.Full_Adder Port Map(l3(10)(0),l3(10)(1),l3(10)(2),Sum_FA_3(10)(0),Carry_FA_3(11)(0));
uut_fa_s3_b10_1 :entity work.Full_Adder Port Map(l3(10)(3),l3(10)(4),l3(10)(5),Sum_FA_3(10)(1),Carry_FA_3(11)(1));
l4(10)<=Sum_FA_3(10)(1 downto 0) & Carry_FA_3(10)(1 downto 0) ;
---------------------------bit-11---------------------------------
uut_fa_s3_b11_0 :entity work.Full_Adder Port Map(l3(11)(0),l3(11)(1),l3(11)(2),Sum_FA_3(11)(0),Carry_FA_3(12)(0));
uut_fa_s3_b11_1 :entity work.Full_Adder Port Map(l3(11)(3),l3(11)(4),l3(11)(5),Sum_FA_3(11)(1),Carry_FA_3(12)(1));
l4(11)<=Sum_FA_3(11)(1 downto 0) & Carry_FA_3(11)(1 downto 0) ;
---------------------------bit-12---------------------------------
uut_fa_s3_b12_0 :entity work.Full_Adder Port Map(l3(12)(0),l3(12)(1),l3(12)(2),Sum_FA_3(12)(0),Carry_FA_3(13)(0));
uut_fa_s3_b12_1 :entity work.Full_Adder Port Map(l3(12)(3),l3(12)(4),l3(12)(5),Sum_FA_3(12)(1),Carry_FA_3(13)(1));
l4(12)<=Sum_FA_3(12)(1 downto 0) & Carry_FA_3(12)(1 downto 0) ;
---------------------------bit-13---------------------------------
uut_fa_s3_b13_0 :entity work.Full_Adder Port Map(l3(13)(0),l3(13)(1),l3(13)(2),Sum_FA_3(13)(0),Carry_FA_3(14)(0));
uut_fa_s3_b13_1 :entity work.Full_Adder Port Map(l3(13)(3),l3(13)(4),l3(13)(5),Sum_FA_3(13)(1),Carry_FA_3(14)(1));
l4(13)<=Sum_FA_3(13)(1 downto 0) & Carry_FA_3(13)(1 downto 0) ;
---------------------------bit-14---------------------------------
uut_fa_s3_b14_0 :entity work.Full_Adder Port Map(l3(14)(0),l3(14)(1),l3(14)(2),Sum_FA_3(14)(0),Carry_FA_3(15)(0));
uut_fa_s3_b14_1 :entity work.Full_Adder Port Map(l3(14)(3),l3(14)(4),l3(14)(5),Sum_FA_3(14)(1),Carry_FA_3(15)(1));
l4(14)<=Sum_FA_3(14)(1 downto 0) & Carry_FA_3(14)(1 downto 0) ;
---------------------------bit-15---------------------------------
uut_fa_s3_b15_0 :entity work.Full_Adder Port Map(l3(15)(0),l3(15)(1),l3(15)(2),Sum_FA_3(15)(0),Carry_FA_3(16)(0));
uut_fa_s3_b15_1 :entity work.Full_Adder Port Map(l3(15)(3),l3(15)(4),l3(15)(5),Sum_FA_3(15)(1),Carry_FA_3(16)(1));
l4(15)<=Sum_FA_3(15)(1 downto 0) & Carry_FA_3(15)(1 downto 0) ;
---------------------------bit-16---------------------------------
uut_fa_s3_b16_0 :entity work.Full_Adder Port Map(l3(16)(0),l3(16)(1),l3(16)(2),Sum_FA_3(16)(0),Carry_FA_3(17)(0));
uut_fa_s3_b16_1 :entity work.Full_Adder Port Map(l3(16)(3),l3(16)(4),l3(16)(5),Sum_FA_3(16)(1),Carry_FA_3(17)(1));
l4(16)<=Sum_FA_3(16)(1 downto 0) & Carry_FA_3(16)(1 downto 0) ;
---------------------------bit-17---------------------------------
uut_fa_s3_b17_0 :entity work.Full_Adder Port Map(l3(17)(0),l3(17)(1),l3(17)(2),Sum_FA_3(17)(0),Carry_FA_3(18)(0));
uut_fa_s3_b17_1 :entity work.Full_Adder Port Map(l3(17)(3),l3(17)(4),l3(17)(5),Sum_FA_3(17)(1),Carry_FA_3(18)(1));
l4(17)<=Sum_FA_3(17)(1 downto 0) & Carry_FA_3(17)(1 downto 0) ;
---------------------------bit-18---------------------------------
uut_fa_s3_b18_0 :entity work.Full_Adder Port Map(l3(18)(0),l3(18)(1),l3(18)(2),Sum_FA_3(18)(0),Carry_FA_3(19)(0));
uut_fa_s3_b18_1 :entity work.Full_Adder Port Map(l3(18)(3),l3(18)(4),l3(18)(5),Sum_FA_3(18)(1),Carry_FA_3(19)(1));
l4(18)<=Sum_FA_3(18)(1 downto 0) & Carry_FA_3(18)(1 downto 0) ;
---------------------------bit-19---------------------------------
uut_fa_s3_b19_0 :entity work.Full_Adder Port Map(l3(19)(0),l3(19)(1),l3(19)(2),Sum_FA_3(19)(0),Carry_FA_3(20)(0));
uut_fa_s3_b19_1 :entity work.Full_Adder Port Map(l3(19)(3),l3(19)(4),l3(19)(5),Sum_FA_3(19)(1),Carry_FA_3(20)(1));
l4(19)<=Sum_FA_3(19)(1 downto 0) & Carry_FA_3(19)(1 downto 0) ;
---------------------------bit-20---------------------------------
uut_fa_s3_b20_0 :entity work.Full_Adder Port Map(l3(20)(0),l3(20)(1),l3(20)(2),Sum_FA_3(20)(0),Carry_FA_3(21)(0));
uut_fa_s3_b20_1 :entity work.Full_Adder Port Map(l3(20)(3),l3(20)(4),l3(20)(5),Sum_FA_3(20)(1),Carry_FA_3(21)(1));
l4(20)<=Sum_FA_3(20)(1 downto 0) & Carry_FA_3(20)(1 downto 0) ;
---------------------------bit-21---------------------------------
uut_fa_s3_b21_0 :entity work.Full_Adder Port Map(l3(21)(0),l3(21)(1),l3(21)(2),Sum_FA_3(21)(0),Carry_FA_3(22)(0));
uut_fa_s3_b21_1 :entity work.Full_Adder Port Map(l3(21)(3),l3(21)(4),l3(21)(5),Sum_FA_3(21)(1),Carry_FA_3(22)(1));
l4(21)<=Sum_FA_3(21)(1 downto 0) & Carry_FA_3(21)(1 downto 0) ;
---------------------------bit-22---------------------------------
uut_fa_s3_b22_0 :entity work.Full_Adder Port Map(l3(22)(0),l3(22)(1),l3(22)(2),Sum_FA_3(22)(0),Carry_FA_3(23)(0));
uut_fa_s3_b22_1 :entity work.Full_Adder Port Map(l3(22)(3),l3(22)(4),l3(22)(5),Sum_FA_3(22)(1),Carry_FA_3(23)(1));
l4(22)<=Sum_FA_3(22)(1 downto 0) & Carry_FA_3(22)(1 downto 0) ;
---------------------------bit-23---------------------------------
uut_fa_s3_b23_0 :entity work.Full_Adder Port Map(l3(23)(0),l3(23)(1),l3(23)(2),Sum_FA_3(23)(0),Carry_FA_3(24)(0));
uut_fa_s3_b23_1 :entity work.Full_Adder Port Map(l3(23)(3),l3(23)(4),l3(23)(5),Sum_FA_3(23)(1),Carry_FA_3(24)(1));
l4(23)<=Sum_FA_3(23)(1 downto 0) & Carry_FA_3(23)(1 downto 0) ;
---------------------------bit-24---------------------------------
uut_fa_s3_b24_0 :entity work.Full_Adder Port Map(l3(24)(0),l3(24)(1),l3(24)(2),Sum_FA_3(24)(0),Carry_FA_3(25)(0));
uut_fa_s3_b24_1 :entity work.Full_Adder Port Map(l3(24)(3),l3(24)(4),l3(24)(5),Sum_FA_3(24)(1),Carry_FA_3(25)(1));
l4(24)<=Sum_FA_3(24)(1 downto 0) & Carry_FA_3(24)(1 downto 0) ;
---------------------------bit-25---------------------------------
uut_fa_s3_b25_0 :entity work.Full_Adder Port Map(l3(25)(0),l3(25)(1),l3(25)(2),Sum_FA_3(25)(0),Carry_FA_3(26)(0));
uut_fa_s3_b25_1 :entity work.Full_Adder Port Map(l3(25)(3),l3(25)(4),l3(25)(5),Sum_FA_3(25)(1),Carry_FA_3(26)(1));
l4(25)<=Sum_FA_3(25)(1 downto 0) & Carry_FA_3(25)(1 downto 0) ;
---------------------------bit-26---------------------------------
uut_fa_s3_b26_0 :entity work.Full_Adder Port Map(l3(26)(0),l3(26)(1),l3(26)(2),Sum_FA_3(26)(0),Carry_FA_3(27)(0));
uut_fa_s3_b26_1 :entity work.Full_Adder Port Map(l3(26)(3),l3(26)(4),l3(26)(5),Sum_FA_3(26)(1),Carry_FA_3(27)(1));
l4(26)<=Sum_FA_3(26)(1 downto 0) & Carry_FA_3(26)(1 downto 0) ;
---------------------------bit-27---------------------------------
uut_fa_s3_b27_0 :entity work.Full_Adder Port Map(l3(27)(0),l3(27)(1),l3(27)(2),Sum_FA_3(27)(0),Carry_FA_3(28)(0));
l4(27)<=Sum_FA_3(27)(0) & Carry_FA_3(27)(1 downto 0) & l3(27)(3 downto 3);
---------------------------bit-28---------------------------------
l4(28)<=Carry_FA_3(28)(0) & l3(28)(2 downto 0 );
---------------------------bit-29---------------------------------
l4(29)<=l4(29)(3 downto 2) & l3(29)(1 downto 0);
---------------------------bit-30---------------------------------
l4(30)<=l4(30)(3 downto 1) & l3(30)(0 downto 0);
------------------------------------------------------------Stage_4----------------------------------------------------------------------------------------------------------------------------------------------------------
---------------------------bit-0---------------------------------
l5(0)<=l4(0)(2 downto 0 );
---------------------------bit-1---------------------------------
l5(1)<=l5(1)(2 downto 2) & l4(1)(1 downto 0);
---------------------------bit-2---------------------------------
l5(2)<=l4(2)(2 downto 0 );
---------------------------bit-3---------------------------------
uut_ha_s4_b3_0 :entity work.Half_Adder Port Map(l4(3)(0),l4(3)(1),Sum_HA_4(3)(0),Carry_HA_4(4)(0));
l5(3)<= Sum_HA_4(3)(0) & l4(3)(3 downto 2);
---------------------------bit-4---------------------------------
uut_fa_s4_b4_0 :entity work.Full_Adder Port Map(l4(4)(0),l4(4)(1),l4(4)(2),Sum_FA_4(4)(0),Carry_FA_4(5)(0));
l5(4)<=Sum_FA_4(4)(0) & Carry_HA_4(4)(0) & l4(4)(3 downto 3);
---------------------------bit-5---------------------------------
uut_fa_s4_b5_0 :entity work.Full_Adder Port Map(l4(5)(0),l4(5)(1),l4(5)(2),Sum_FA_4(5)(0),Carry_FA_4(6)(0));
l5(5)<=Sum_FA_4(5)(0) & Carry_FA_4(5)(0) & l4(5)(3 downto 3);
---------------------------bit-6---------------------------------
uut_fa_s4_b6_0 :entity work.Full_Adder Port Map(l4(6)(0),l4(6)(1),l4(6)(2),Sum_FA_4(6)(0),Carry_FA_4(7)(0));
l5(6)<=Sum_FA_4(6)(0) & Carry_FA_4(6)(0) & l4(6)(3 downto 3);
---------------------------bit-7---------------------------------
uut_fa_s4_b7_0 :entity work.Full_Adder Port Map(l4(7)(0),l4(7)(1),l4(7)(2),Sum_FA_4(7)(0),Carry_FA_4(8)(0));
l5(7)<=Sum_FA_4(7)(0) & Carry_FA_4(7)(0) & l4(7)(3 downto 3);
---------------------------bit-8---------------------------------
uut_fa_s4_b8_0 :entity work.Full_Adder Port Map(l4(8)(0),l4(8)(1),l4(8)(2),Sum_FA_4(8)(0),Carry_FA_4(9)(0));
l5(8)<=Sum_FA_4(8)(0) & Carry_FA_4(8)(0) & l4(8)(3 downto 3);
---------------------------bit-9---------------------------------
uut_fa_s4_b9_0 :entity work.Full_Adder Port Map(l4(9)(0),l4(9)(1),l4(9)(2),Sum_FA_4(9)(0),Carry_FA_4(10)(0));
l5(9)<=Sum_FA_4(9)(0) & Carry_FA_4(9)(0) & l4(9)(3 downto 3);
---------------------------bit-10---------------------------------
uut_fa_s4_b10_0 :entity work.Full_Adder Port Map(l4(10)(0),l4(10)(1),l4(10)(2),Sum_FA_4(10)(0),Carry_FA_4(11)(0));
l5(10)<=Sum_FA_4(10)(0) & Carry_FA_4(10)(0) & l4(10)(3 downto 3);
---------------------------bit-11---------------------------------
uut_fa_s4_b11_0 :entity work.Full_Adder Port Map(l4(11)(0),l4(11)(1),l4(11)(2),Sum_FA_4(11)(0),Carry_FA_4(12)(0));
l5(11)<=Sum_FA_4(11)(0) & Carry_FA_4(11)(0) & l4(11)(3 downto 3);
---------------------------bit-12---------------------------------
uut_fa_s4_b12_0 :entity work.Full_Adder Port Map(l4(12)(0),l4(12)(1),l4(12)(2),Sum_FA_4(12)(0),Carry_FA_4(13)(0));
l5(12)<=Sum_FA_4(12)(0) & Carry_FA_4(12)(0) & l4(12)(3 downto 3);
---------------------------bit-13---------------------------------
uut_fa_s4_b13_0 :entity work.Full_Adder Port Map(l4(13)(0),l4(13)(1),l4(13)(2),Sum_FA_4(13)(0),Carry_FA_4(14)(0));
l5(13)<=Sum_FA_4(13)(0) & Carry_FA_4(13)(0) & l4(13)(3 downto 3);
---------------------------bit-14---------------------------------
uut_fa_s4_b14_0 :entity work.Full_Adder Port Map(l4(14)(0),l4(14)(1),l4(14)(2),Sum_FA_4(14)(0),Carry_FA_4(15)(0));
l5(14)<=Sum_FA_4(14)(0) & Carry_FA_4(14)(0) & l4(14)(3 downto 3);
---------------------------bit-15---------------------------------
uut_fa_s4_b15_0 :entity work.Full_Adder Port Map(l4(15)(0),l4(15)(1),l4(15)(2),Sum_FA_4(15)(0),Carry_FA_4(16)(0));
l5(15)<=Sum_FA_4(15)(0) & Carry_FA_4(15)(0) & l4(15)(3 downto 3);
---------------------------bit-16---------------------------------
uut_fa_s4_b16_0 :entity work.Full_Adder Port Map(l4(16)(0),l4(16)(1),l4(16)(2),Sum_FA_4(16)(0),Carry_FA_4(17)(0));
l5(16)<=Sum_FA_4(16)(0) & Carry_FA_4(16)(0) & l4(16)(3 downto 3);
---------------------------bit-17---------------------------------
uut_fa_s4_b17_0 :entity work.Full_Adder Port Map(l4(17)(0),l4(17)(1),l4(17)(2),Sum_FA_4(17)(0),Carry_FA_4(18)(0));
l5(17)<=Sum_FA_4(17)(0) & Carry_FA_4(17)(0) & l4(17)(3 downto 3);
---------------------------bit-18---------------------------------
uut_fa_s4_b18_0 :entity work.Full_Adder Port Map(l4(18)(0),l4(18)(1),l4(18)(2),Sum_FA_4(18)(0),Carry_FA_4(19)(0));
l5(18)<=Sum_FA_4(18)(0) & Carry_FA_4(18)(0) & l4(18)(3 downto 3);
---------------------------bit-19---------------------------------
uut_fa_s4_b19_0 :entity work.Full_Adder Port Map(l4(19)(0),l4(19)(1),l4(19)(2),Sum_FA_4(19)(0),Carry_FA_4(20)(0));
l5(19)<=Sum_FA_4(19)(0) & Carry_FA_4(19)(0) & l4(19)(3 downto 3);
---------------------------bit-20---------------------------------
uut_fa_s4_b20_0 :entity work.Full_Adder Port Map(l4(20)(0),l4(20)(1),l4(20)(2),Sum_FA_4(20)(0),Carry_FA_4(21)(0));
l5(20)<=Sum_FA_4(20)(0) & Carry_FA_4(20)(0) & l4(20)(3 downto 3);
---------------------------bit-21---------------------------------
uut_fa_s4_b21_0 :entity work.Full_Adder Port Map(l4(21)(0),l4(21)(1),l4(21)(2),Sum_FA_4(21)(0),Carry_FA_4(22)(0));
l5(21)<=Sum_FA_4(21)(0) & Carry_FA_4(21)(0) & l4(21)(3 downto 3);
---------------------------bit-22---------------------------------
uut_fa_s4_b22_0 :entity work.Full_Adder Port Map(l4(22)(0),l4(22)(1),l4(22)(2),Sum_FA_4(22)(0),Carry_FA_4(23)(0));
l5(22)<=Sum_FA_4(22)(0) & Carry_FA_4(22)(0) & l4(22)(3 downto 3);
---------------------------bit-23---------------------------------
uut_fa_s4_b23_0 :entity work.Full_Adder Port Map(l4(23)(0),l4(23)(1),l4(23)(2),Sum_FA_4(23)(0),Carry_FA_4(24)(0));
l5(23)<=Sum_FA_4(23)(0) & Carry_FA_4(23)(0) & l4(23)(3 downto 3);
---------------------------bit-24---------------------------------
uut_fa_s4_b24_0 :entity work.Full_Adder Port Map(l4(24)(0),l4(24)(1),l4(24)(2),Sum_FA_4(24)(0),Carry_FA_4(25)(0));
l5(24)<=Sum_FA_4(24)(0) & Carry_FA_4(24)(0) & l4(24)(3 downto 3);
---------------------------bit-25---------------------------------
uut_fa_s4_b25_0 :entity work.Full_Adder Port Map(l4(25)(0),l4(25)(1),l4(25)(2),Sum_FA_4(25)(0),Carry_FA_4(26)(0));
l5(25)<=Sum_FA_4(25)(0) & Carry_FA_4(25)(0) & l4(25)(3 downto 3);
---------------------------bit-26---------------------------------
uut_fa_s4_b26_0 :entity work.Full_Adder Port Map(l4(26)(0),l4(26)(1),l4(26)(2),Sum_FA_4(26)(0),Carry_FA_4(27)(0));
l5(26)<=Sum_FA_4(26)(0) & Carry_FA_4(26)(0) & l4(26)(3 downto 3);
---------------------------bit-27---------------------------------
uut_fa_s4_b27_0 :entity work.Full_Adder Port Map(l4(27)(0),l4(27)(1),l4(27)(2),Sum_FA_4(27)(0),Carry_FA_4(28)(0));
l5(27)<=Sum_FA_4(27)(0) & Carry_FA_4(27)(0) & l4(27)(3 downto 3);
---------------------------bit-28---------------------------------
uut_fa_s4_b28_0 :entity work.Full_Adder Port Map(l4(28)(0),l4(28)(1),l4(28)(2),Sum_FA_4(28)(0),Carry_FA_4(29)(0));
l5(28)<=Sum_FA_4(28)(0) & Carry_FA_4(28)(0) & l4(28)(3 downto 3);
---------------------------bit-29---------------------------------
l5(29)<=Carry_FA_4(29)(0) & l4(29)(1 downto 0 );
---------------------------bit-30---------------------------------
l5(30)<=l5(30)(2 downto 1) & l4(30)(0 downto 0);
------------------------------------------------------------Stage_5----------------------------------------------------------------------------------------------------------------------------------------------------------
---------------------------bit-0---------------------------------
----l6(0)<=l5(0)(1 downto 0 );
l6(0)<='0' & l5(0)(0);
---------------------------bit-1---------------------------------
l6(1)<=l5(1)(1 downto 0 );
---------------------------bit-2---------------------------------
uut_ha_s5_b2_0 :entity work.Half_Adder Port Map(l5(2)(0),l5(2)(1),Sum_HA_5(2)(0),Carry_HA_5(3)(0));
l6(2)<= Sum_HA_5(2)(0) & l5(2)(2 downto 2);
---------------------------bit-3---------------------------------
uut_fa_s5_b3_0 :entity work.Full_Adder Port Map(l5(3)(0),l5(3)(1),l5(3)(2),Sum_FA_5(3)(0),Carry_FA_5(4)(0));
l6(3)<=Sum_FA_5(3)(0) & Carry_HA_5(3)(0) ;
---------------------------bit-4---------------------------------
uut_fa_s5_b4_0 :entity work.Full_Adder Port Map(l5(4)(0),l5(4)(1),l5(4)(2),Sum_FA_5(4)(0),Carry_FA_5(5)(0));
l6(4)<=Sum_FA_5(4)(0) & Carry_FA_5(4)(0) ;
---------------------------bit-5---------------------------------
uut_fa_s5_b5_0 :entity work.Full_Adder Port Map(l5(5)(0),l5(5)(1),l5(5)(2),Sum_FA_5(5)(0),Carry_FA_5(6)(0));
l6(5)<=Sum_FA_5(5)(0) & Carry_FA_5(5)(0) ;
---------------------------bit-6---------------------------------
uut_fa_s5_b6_0 :entity work.Full_Adder Port Map(l5(6)(0),l5(6)(1),l5(6)(2),Sum_FA_5(6)(0),Carry_FA_5(7)(0));
l6(6)<=Sum_FA_5(6)(0) & Carry_FA_5(6)(0) ;
---------------------------bit-7---------------------------------
uut_fa_s5_b7_0 :entity work.Full_Adder Port Map(l5(7)(0),l5(7)(1),l5(7)(2),Sum_FA_5(7)(0),Carry_FA_5(8)(0));
l6(7)<=Sum_FA_5(7)(0) & Carry_FA_5(7)(0) ;
---------------------------bit-8---------------------------------
uut_fa_s5_b8_0 :entity work.Full_Adder Port Map(l5(8)(0),l5(8)(1),l5(8)(2),Sum_FA_5(8)(0),Carry_FA_5(9)(0));
l6(8)<=Sum_FA_5(8)(0) & Carry_FA_5(8)(0) ;
---------------------------bit-9---------------------------------
uut_fa_s5_b9_0 :entity work.Full_Adder Port Map(l5(9)(0),l5(9)(1),l5(9)(2),Sum_FA_5(9)(0),Carry_FA_5(10)(0));
l6(9)<=Sum_FA_5(9)(0) & Carry_FA_5(9)(0) ;
---------------------------bit-10---------------------------------
uut_fa_s5_b10_0 :entity work.Full_Adder Port Map(l5(10)(0),l5(10)(1),l5(10)(2),Sum_FA_5(10)(0),Carry_FA_5(11)(0));
l6(10)<=Sum_FA_5(10)(0) & Carry_FA_5(10)(0) ;
---------------------------bit-11---------------------------------
uut_fa_s5_b11_0 :entity work.Full_Adder Port Map(l5(11)(0),l5(11)(1),l5(11)(2),Sum_FA_5(11)(0),Carry_FA_5(12)(0));
l6(11)<=Sum_FA_5(11)(0) & Carry_FA_5(11)(0) ;
---------------------------bit-12---------------------------------
uut_fa_s5_b12_0 :entity work.Full_Adder Port Map(l5(12)(0),l5(12)(1),l5(12)(2),Sum_FA_5(12)(0),Carry_FA_5(13)(0));
l6(12)<=Sum_FA_5(12)(0) & Carry_FA_5(12)(0) ;
---------------------------bit-13---------------------------------
uut_fa_s5_b13_0 :entity work.Full_Adder Port Map(l5(13)(0),l5(13)(1),l5(13)(2),Sum_FA_5(13)(0),Carry_FA_5(14)(0));
l6(13)<=Sum_FA_5(13)(0) & Carry_FA_5(13)(0) ;
---------------------------bit-14---------------------------------
uut_fa_s5_b14_0 :entity work.Full_Adder Port Map(l5(14)(0),l5(14)(1),l5(14)(2),Sum_FA_5(14)(0),Carry_FA_5(15)(0));
l6(14)<=Sum_FA_5(14)(0) & Carry_FA_5(14)(0) ;
---------------------------bit-15---------------------------------
uut_fa_s5_b15_0 :entity work.Full_Adder Port Map(l5(15)(0),l5(15)(1),l5(15)(2),Sum_FA_5(15)(0),Carry_FA_5(16)(0));
l6(15)<=Sum_FA_5(15)(0) & Carry_FA_5(15)(0) ;
---------------------------bit-16---------------------------------
uut_fa_s5_b16_0 :entity work.Full_Adder Port Map(l5(16)(0),l5(16)(1),l5(16)(2),Sum_FA_5(16)(0),Carry_FA_5(17)(0));
l6(16)<=Sum_FA_5(16)(0) & Carry_FA_5(16)(0) ;
---------------------------bit-17---------------------------------
uut_fa_s5_b17_0 :entity work.Full_Adder Port Map(l5(17)(0),l5(17)(1),l5(17)(2),Sum_FA_5(17)(0),Carry_FA_5(18)(0));
l6(17)<=Sum_FA_5(17)(0) & Carry_FA_5(17)(0) ;
---------------------------bit-18---------------------------------
uut_fa_s5_b18_0 :entity work.Full_Adder Port Map(l5(18)(0),l5(18)(1),l5(18)(2),Sum_FA_5(18)(0),Carry_FA_5(19)(0));
l6(18)<=Sum_FA_5(18)(0) & Carry_FA_5(18)(0) ;
---------------------------bit-19---------------------------------
uut_fa_s5_b19_0 :entity work.Full_Adder Port Map(l5(19)(0),l5(19)(1),l5(19)(2),Sum_FA_5(19)(0),Carry_FA_5(20)(0));
l6(19)<=Sum_FA_5(19)(0) & Carry_FA_5(19)(0) ;
---------------------------bit-20---------------------------------
uut_fa_s5_b20_0 :entity work.Full_Adder Port Map(l5(20)(0),l5(20)(1),l5(20)(2),Sum_FA_5(20)(0),Carry_FA_5(21)(0));
l6(20)<=Sum_FA_5(20)(0) & Carry_FA_5(20)(0) ;
---------------------------bit-21---------------------------------
uut_fa_s5_b21_0 :entity work.Full_Adder Port Map(l5(21)(0),l5(21)(1),l5(21)(2),Sum_FA_5(21)(0),Carry_FA_5(22)(0));
l6(21)<=Sum_FA_5(21)(0) & Carry_FA_5(21)(0) ;
---------------------------bit-22---------------------------------
uut_fa_s5_b22_0 :entity work.Full_Adder Port Map(l5(22)(0),l5(22)(1),l5(22)(2),Sum_FA_5(22)(0),Carry_FA_5(23)(0));
l6(22)<=Sum_FA_5(22)(0) & Carry_FA_5(22)(0) ;
---------------------------bit-23---------------------------------
uut_fa_s5_b23_0 :entity work.Full_Adder Port Map(l5(23)(0),l5(23)(1),l5(23)(2),Sum_FA_5(23)(0),Carry_FA_5(24)(0));
l6(23)<=Sum_FA_5(23)(0) & Carry_FA_5(23)(0) ;
---------------------------bit-24---------------------------------
uut_fa_s5_b24_0 :entity work.Full_Adder Port Map(l5(24)(0),l5(24)(1),l5(24)(2),Sum_FA_5(24)(0),Carry_FA_5(25)(0));
l6(24)<=Sum_FA_5(24)(0) & Carry_FA_5(24)(0) ;
---------------------------bit-25---------------------------------
uut_fa_s5_b25_0 :entity work.Full_Adder Port Map(l5(25)(0),l5(25)(1),l5(25)(2),Sum_FA_5(25)(0),Carry_FA_5(26)(0));
l6(25)<=Sum_FA_5(25)(0) & Carry_FA_5(25)(0) ;
---------------------------bit-26---------------------------------
uut_fa_s5_b26_0 :entity work.Full_Adder Port Map(l5(26)(0),l5(26)(1),l5(26)(2),Sum_FA_5(26)(0),Carry_FA_5(27)(0));
l6(26)<=Sum_FA_5(26)(0) & Carry_FA_5(26)(0) ;
---------------------------bit-27---------------------------------
uut_fa_s5_b27_0 :entity work.Full_Adder Port Map(l5(27)(0),l5(27)(1),l5(27)(2),Sum_FA_5(27)(0),Carry_FA_5(28)(0));
l6(27)<=Sum_FA_5(27)(0) & Carry_FA_5(27)(0) ;
---------------------------bit-28---------------------------------
uut_fa_s5_b28_0 :entity work.Full_Adder Port Map(l5(28)(0),l5(28)(1),l5(28)(2),Sum_FA_5(28)(0),Carry_FA_5(29)(0));
l6(28)<=Sum_FA_5(28)(0) & Carry_FA_5(28)(0) ;
---------------------------bit-29---------------------------------
uut_fa_s5_b29_0 :entity work.Full_Adder Port Map(l5(29)(0),l5(29)(1),l5(29)(2),Sum_FA_5(29)(0),Carry_FA_5(30)(0));
l6(29)<=Sum_FA_5(29)(0) & Carry_FA_5(29)(0) ;
---------------------------bit-30---------------------------------
l6(30)<=Carry_FA_5(30)(0) & l5(30)(0 downto 0 );


l6(31)<="00";------For Brent Kung Adder-----------------------------------------------------------------------------------------
--------------------------------------------------ADDITION USING BRENT KUNG------------------------------------------------------------------------------
gen_r:for i in 31 downto 0 generate
gen_c:for j in 1 downto 0 generate
gen_m:if(j=1) generate
		m(i)<=l6(i)(j);
end generate gen_m;		
gen_n:if(j=0) generate
		n(i)<=l6(i)(j);
end generate gen_n;
end generate gen_c;
end generate gen_r;		
uut_sum:entity work.brent_kung_adder PORT MAP(m,n,'0',o,p);	
--------------------------------------------------------------------------------------------------------------------------------

end rtl;