A="0111111111111111"
B="1000000000000001"
for z,j in zip(range(len(B)),range(16)):
    i=15-z
    if(B[i]=='1'):
        print(str(" ")*(16-j),A)
    else:
        print(str(" ")*(16-j),"0000000000000000")     
