def InsertSort(x,n):
 for ipiv in range(1,n):
     xpiv = x[ipiv]
     i = ipiv-1
     while ((i>=0) and (x[i]>xpiv)):
           x[i+1]=x[i]
           i -=1
     x[i+1]=xpiv
l=[30,60,50,20,10,40]
print(l)
InsertSort(l,6)
print(l)
