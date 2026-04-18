def QuickSort(x,l,n):
  if (l >=n ): return
  
  m=l
  for i in range(l,n):
      if(x[i] < x[n]) :
        t = x[i]; x[i] = x[m]; x[m]= t
        m += 1 # El m nos va indicando en que lugar (de la lista) estamos

  t = x[m]; x[m] = x[n]; x[n] = t
  #print(x) # Esto lo agregé para que se vea mejor como va cambiando la lista
  QuickSort(x,l,m-1)
  QuickSort(x,m+1,n)

l=[50,20,16,40,80,76,10,5,30,90,5,60]
# l=[50,20,16,40,10,5,30,5,80,60,76,90]
print(l)
QuickSort(l,0,11)
print(l)

# Clase 15/04
# El 11 funciona como el pivote