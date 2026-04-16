from numpy import *
from matplotlib.pyplot import * 
import math

def f(x):
        return exp(x)*log(x) - x*x
def p(x,x2,a,b,c):
        return a*(x-x2)**2+b*(x-x2)+c
a=1.0
b=2.0
istep=0
x=r_[a:b:100j] # ASI ES POSIBLE CREAR UN ARRAY MUY RAPIDO!
#x=[1+.001*i for i in range(100)]
plot(x,f(x),'b-') # b- SIGNIFICA GRAFICA EN "BLUE" Y DATOS UNIDOS CON LINEAS
x1=(a+b)/2.0
x2=x1+.5
x0=x1-.5
for i in arange(6):  # arange(6) crea array de 0 a 5
  c=f(x2)
  b=((x0-x2)**2*(f(x1)-f(x2))-(x1-x2)**2*(f(x0)-f(x2)))\
  /((x0-x2)*(x1-x2)*(x0-x1))
  a=((x1-x2)*(f(x0)-f(x2))-(x0-x2)*(f(x1)-f(x2)))\
  /((x0-x2)*(x1-x2)*(x0-x1))
  plot(x,p(x,x2,a,b,c),'g-')
  ++istep
  D=(b**2-4.0*f(x2)*a)**0.5

  if abs(b-D) < abs(b+D) :
   E=b+D
  else :
   E=b-D
  h=-2.0*f(x2)/E # FORMULA ALTERNATIVA PARA LA CHICHARRONERA
  p2=x2+h
  x0=x1
  x1=x2
  x2=p2
  print(x0,i)  
show()  
