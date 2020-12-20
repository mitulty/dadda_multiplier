library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity brent_kung_adder is 
port(A,B:in std_logic_vector(31 downto 0);
		Cin:in std_logic;
		Cout:out std_logic;
		Sum:out std_logic_vector(31 downto 0));
end entity brent_kung_adder;

architecture behav of brent_kung_adder is
signal G,P,C,x:std_logic_vector(31 downto 0);
signal Gs_1,Ps_1:std_logic_vector(15 downto 0);
signal Gs_2,Ps_2:std_logic_vector(7 downto 0);
signal Gs_3,Ps_3:std_logic_vector(3 downto 0);
signal Gs_4,Ps_4:std_logic_vector(1 downto 0);
signal G_F,P_F:std_logic;
begin	
C(0)<=Cin;		
G_P: for i in 0 to 31 generate
uut_G:entity work.And_Gate port map(A(i),B(i),G(i));
uut_P:entity work.Tiny_XOR port map(A(i),B(i),P(i));
end generate G_P;

gen_stage_1: for i in 0 to 15 generate
		uut_GP_1:entity work.GP_Generator port map(G((2*i)+1),P((2*i)+1),G(2*i),P(2*i),Gs_1(i),Ps_1(i));
end generate gen_stage_1;		
 
gen_stage_2: for i in 0 to 7 generate
		uut_GP_2:entity work.GP_Generator port map(Gs_1(2*i+1),Ps_1(2*i+1),Gs_1(2*i),Ps_1(2*i),Gs_2(i),Ps_2(i));
end generate gen_stage_2;		

gen_stage_3: for i in 0 to 3 generate
		uut_GP_3:entity work.GP_Generator port map(Gs_2(2*i+1),Ps_2(2*i+1),Gs_2(2*i),Ps_2(2*i),Gs_3(i),Ps_3(i));
end generate gen_stage_3;	
	
gen_stage_4: for i in 0 to 1 generate
		uut_GP_4:entity work.GP_Generator port map(Gs_3(2*i+1),Ps_3(2*i+1),Gs_3(2*i),Ps_3(2*i),Gs_4(i),Ps_4(i));
end generate gen_stage_4;	
	
uut_GP_5:entity work.GP_Generator port map(Gs_4(1),Ps_4(1),Gs_4(0),Ps_4(0),G_F,P_F);
------------------------------------------------------------------------------------------------------------------------------------------------------------

uut_C_4:entity work.Carry_Generator port map(Gs_4(0),Ps_4(0),C(0),C(16));

cgen_C_3: for i in 1 to 3 generate
cgen_3: if (i rem 2 =1) generate
               uut_C_3:entity work.Carry_Generator port map(Gs_3(i-1),Ps_3(i-1),C(8*(i-1)),C(8*i));
end generate cgen_3;			
end generate cgen_C_3;	
	
cgen_C_2: for i in 1 to 7 generate
cgen_2: if (i rem 2 =1) generate
               uut_C_2:entity work.Carry_Generator port map(Gs_2(i-1),Ps_2(i-1),C(4*(i-1)),C(4*i));
end generate cgen_2;			
end generate cgen_C_2;			
		
cgen_C_1: for i in 1 to 15 generate
cgen_1: if (i rem 2 =1) generate
              uut_C_1:entity work.Carry_Generator port map(Gs_1(i-1),Ps_1(i-1),C(2*(i-1)),C(2*i));
end generate cgen_1;	
end generate cgen_C_1;	
				
cgen_C_0: for i in 1 to 31 generate
cgen_0: if (i rem 2 =1) generate
               uut_C_0:entity work.Carry_Generator port map(G(i-1),P(i-1),C((i-1)),C(i));
end generate cgen_0;					
end generate cgen_C_0;	
uut_Cout: entity work.Carry_Generator port map(G_F,P_F,C(0),Cout);
------------------------------------------------------------------------------------------------------------------------------------------------------------
gen_sum:for i in 0 to 31 generate
uut_sum:entity work.Sum_Generator port map(P(i),C(i),Sum(i));
end generate gen_sum;
end behav;			