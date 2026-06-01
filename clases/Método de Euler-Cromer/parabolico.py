from pylab import *
def euler(y0,t0,h,f,N,paro):
 datos_t=[t0]
 datos_y=[y0]
 for i in range(N):
   y_new = y0+ h*f(t0,y0)
   t0=t0+h
   y0=y_new
   datos_t.append(t0)
   datos_y.append(y_new)
   if paro(t0,y0) == True :
     break
 return datos_t, datos_y
def tiro_parabolico(t,Q):
 l =0.5 
 g = 9.8
 return array([Q[1],-l*Q[1]*sqrt(Q[1]**2+Q[3]**2),Q[3],-g-l*Q[3]*sqrt(Q[1]**2+Q[3]**2)])
def paro(t,Q):
 if Q[2] < 0 :
   return True
 else:
   return False
c_ini = array([0,30*cos(pi/3),0,30*sin(pi/3)])
t,M = euler(c_ini,0,0.001,tiro_parabolico,15000,paro)
M=array(M)
plot(M[:,0],M[:,2])
savefig("./parabolico.png")