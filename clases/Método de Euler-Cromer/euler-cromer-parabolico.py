from pylab import *
def euler_cromer(q0,v0,t0,tf,h,f_q,f_v,paro):
 datos_t=[t0]
 datos_q=[q0]
 datos_v=[v0]
 while t0 < tf:
  v_nueva = v0 + h*f_v(t0,q0,v0)
  q_nueva = q0 + h*f_q(t0,q0,v_nueva)
  t0=t0+h
  q0=q_nueva
  v0=v_nueva
  datos_t.append(t0)
  datos_q.append(q_nueva)
  datos_v.append(v_nueva)
  if paro(t0,q0,v0) == True :
    break
 return datos_t, datos_q, datos_v
def f_q(t,q,v):
 return array([v[0],v[1]])
def f_v(t,q,v):
 l=0.9
 g=9.8
 return  array([-l*v[0]*sqrt(v[0]**2+v[1]**2),-g-l*v[1]*sqrt(v[0]**2+v[1]**2)])
def paro(t,q,v):
    if q[1] < 0 :
     return True
    else:
     return False
q_ini = [0.0, 0.0]
v_ini = [30*cos(pi/3), 30*sin(pi/3)]
t,q,v=euler_cromer(q_ini, v_ini, 0,500,0.001, f_q, f_v,paro)
q=array(q)
plot(q[:,0],q[:,1])
savefig("./euler_cromer.png")