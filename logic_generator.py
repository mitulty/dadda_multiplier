bit_number=[i for i in range(31,-1,-1)]
bit_0=[i for i  in range(16,0,-1)]
bit_1=[i for i in range(0,16,1)]
bit_wires=bit_1+bit_0
total_fa=0
total_ha=0
arr=[]
for i in range(7):  ##### No OF Stages #######
    arr.append([])
bit_number.reverse()
bit_wires.reverse()
for i,j,r in zip(bit_number,bit_wires,range(0,32)):
    arr[0].append(["Bit_Number:"+str(i),j,[]])
    for k in range(0,j):
        arr[0][r][2].append([k+1,'v'])
arr[0][31]=["Bit_Number:"+str(31),0,[[]]] 
Full_Adder=-2
Half_adder=-1
new_stage=arr[0]
phc=0
pfc=0
x=0
for nw,stage in zip([13,9,6,4,3,2],range(6)):
    phc=0
    pfc=0
    arr[stage]=new_stage
    print('------------------------------------------------------------Stage_'+str(stage)+'----------------------------------------------------------------------------------------------------------------------------------------------------------')
    for i in range(0,31):
    #print("1:",arr[stage][i])  
        print('---------------------------bit-'+str(i)+'---------------------------------')
        str_main=""
        var=arr[stage][i][1]
        if i==0:
            print("l"+str(stage+1)+"("+str(i)+")"+"<="+"l"+str(stage)+"("+str(i)+")"+"("+str(nw-1)+" downto 0 )"+";") 
        elif((arr[stage][i][1]<nw and arr[stage][i][1]>1 and x==0) or (i==30 and x==0)):
            print("l"+str(stage+1)+"("+str(i)+")"+"<="+"l"+str(stage+1)+"("+str(i)+")("+str(nw-1)+" downto "+str(var)+") & "+"l"+str(stage)+"("+str(i)+")"+"("+str(var-1)+" downto 0)"+";")
        elif(arr[stage][i][1]<nw and x!=0):
            print("l"+str(stage+1)+"("+str(i)+")"+"<="+"Carry_FA"+"_"+str(stage)+"("+str(i)+")(0)"+" & l"+str(stage)+"("+str(i)+")"+"("+str(var-1)+" downto 0 )"+";")  
        elif(arr[stage][i][1]==nw and x==0):
            print("l"+str(stage+1)+"("+str(i)+")"+"<="+"l"+str(stage)+"("+str(i)+")"+"("+str(var-1)+" downto 0 )"+";")
       # print(arr[stage][i])
        if(x!=0):
            for k in range(h):
                arr[stage][i][2].append([arr[stage][i][2][-1][0]+1,'v_c_ha'])
            for k in range(f):
                arr[stage][i][2].append([arr[stage][i][2][-1][0]+1,'v_c_fa'])
            arr[stage][i][1]+=f+h
        f=0
        h=0
        x=0
        c=0
        if(arr[stage][i][1]>nw):
    #    print("Yes")
            sf=0
            ch=0
            cf=0
            sh=0
            x=arr[stage][i][1]-nw
            #print(arr[stage][i])
            if(x%2==0):
      #          print("Even")
                f=x//2
                for m in range(0,f):
                    print(("uut_fa_s"+str(stage)+"_b"+str(i)+"_"+str(sf)+" :entity work.Full_Adder Port Map("+"l"+str(stage)+"("+str(i)+")("+str(arr[stage][i][2][m*3+0][0]-1)+")"+","+"l"+str(stage)+"("+str(i)+")("+str(arr[stage][i][2][m*3+1][0]-1)+")"+","+"l"+str(stage)+"("+str(i)+")("+str(arr[stage][i][2][m*3+2][0]-1)+")"+","+"Sum_FA"+"_"+str(stage)+"("+str(i)+")("+str(sf)+")"+","+"Carry_FA"+"_"+str(stage)+"("+str(i+1)+")("+str(cf)+")"")"+";"))
                    cf+=1
                    sf+=1
                    total_fa+=1          
            else:
        #    print("Odd")
                f=x//2 
                h=x%2
                for m in range(0,f):
                    print(("uut_fa_s"+str(stage)+"_b"+str(i)+"_"+str(sf)+" :entity work.Full_Adder Port Map("+"l"+str(stage)+"("+str(i)+")("+str(arr[stage][i][2][m*3+0][0]-1)+")"+","+"l"+str(stage)+"("+str(i)+")("+str(arr[stage][i][2][m*3+1][0]-1)+")"+","+"l"+str(stage)+"("+str(i)+")("+str(arr[stage][i][2][m*3+2][0]-1)+")"+","+"Sum_FA"+"_"+str(stage)+"("+str(i)+")("+str(sf)+")"+","+"Carry_FA"+"_"+str(stage)+"("+str(i+1)+")("+str(cf)+")"")"+";"))
                    sf+=1
                    cf+=1
                    total_fa+=1
                for n in range(0,h):        
                    print(("uut_ha_s"+str(stage)+"_b"+str(i)+"_"+str(sh)+" :entity work.Half_Adder Port Map("+"l"+str(stage)+"("+str(i)+")("+str(arr[stage][i][2][3*f+0+2*n][0]-1)+")"+","+"l"+str(stage)+"("+str(i)+")("+str(arr[stage][i][2][n*2+1+3*f][0]-1)+")"+","+"Sum_HA"+"_"+str(stage)+"("+str(i)+")("+str(sh)+")"+","+"Carry_HA"+"_"+str(stage)+"("+str(i+1)+")("+str(ch)+")"")"+";"))
                    sh+=1
                    ch+=1
                    total_ha+=1
            if sf==1:
                str_f="("+str(0)+")"
            else:
                str_f="("+str(sf-1)+" downto 0)"
            if phc!=0:
                str_phc=" & Carry_HA"+"_"+str(stage)+"("+str(i)+")(0)"  

            if(f*3+h*2>=var):
                rep_str=" "
            else:
                rep_str=" & l"+str(stage)+"("+str(i)+")"+"("+str(var-1)+" downto "+str(f*3+h*2)+")" 
            str_pf=["","",""]
            str_pf[1]=""
            str_pf[2]=""
            if pfc>=1:
                if pfc==1:
                    str_pf[1]=" & Carry_FA"+"_"+str(stage)+"("+str(i)+")(0)"
                else:
                    str_pf[2]=" & Carry_FA"+"_"+str(stage)+"("+str(i)+")("+str(pfc-1)+" downto 0)"
                    pfc=2

            if(sh!=0) and (sf!=0):
                if pfc!=0:
                    str_main=("l"+str(stage+1)+"("+str(i)+")"+"<="+"Sum_FA"+"_"+str(stage)+"("+str(i)+")"+str_f+str_pf[pfc])
                else:    
                    str_main=("l"+str(stage+1)+"("+str(i)+")"+"<="+"Sum_FA"+"_"+str(stage)+"("+str(i)+")"+str_f)
            elif(sf!=0) and (sh==0):
                if pfc!=0:
                    str_main=("l"+str(stage+1)+"("+str(i)+")"+"<="+"Sum_FA"+"_"+str(stage)+"("+str(i)+")"+str_f+str_pf[pfc])
                else:    
                    str_main=("l"+str(stage+1)+"("+str(i)+")"+"<="+"Sum_FA"+"_"+str(stage)+"("+str(i)+")"+str_f) 
            elif(sh!=0) and (sf==0):
                str_main=("l"+str(stage+1)+"("+str(i)+")"+"<=")
            if phc!=0:
                str_main+=str_phc   
            if sh!=0 and sf!=0:
                str_main+=" & Sum_HA"+"_"+str(stage)+"("+str(i)+")(0)" 
            elif sh!=0 and sf==0:
                str_main+=" Sum_HA"+"_"+str(stage)+"("+str(i)+")(0)"            
            str_main+=rep_str       
            for j in range(f*3+h*2):
                pop=arr[stage][i][2].pop(0)
     #   print("2:",arr[stage][i])    
            phc=ch
            pfc=cf    
            for j in (arr[stage][i][2]):
                j[0]=j[0]-(f*3+h*2)
            for j in range(h):    
          #  print(arr[stage][i][2][-1][0])
                arr[stage][i][2].append([arr[stage][i][2][-1][0]+1,'v_s_ha'])
            for j in range(f):    
          #  print(arr[stage][i][2][-1][0])
                arr[stage][i][2].append([arr[stage][i][2][-1][0]+1,'v_s_fa'])    

            arr[stage][i][1]=nw
            print(str_main+";")
            #print(arr[stage][i])
            new_stage=arr[stage]    
print('---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------')
print("Total Full Adders=",total_fa)
print("Total Half Adders=",total_ha)            