from numpy import linalg as LA 
from pylab import *
x,y,sigma=np.loadtxt("datos_parabola.dat",unpack=True)
plt.plot(x,y,'ko')
plt.draw()
b=y/sigma
N=len(x)
M=9
# las dos lineas que siguen son equivalentes
#A =np.array([[0 for row in range(M)] for col in range(N)])
#A=zeros((N,M)) 
#
#lineas siguientes equivalentes
#for i in range(N):
#   for j in range(M):
#      A[i][j]= (x[i]**(j))/sigma[i]
A=np.array([[(x[i]**(j))/sigma[i] for j in range(M)] for i in range(N)])

D=np.dot(A.T,A)
C=LA.inv(D)
CP=np.dot(A.T,b)
a_fit=np.dot(C,CP)
print(a_fit)
yy=np.zeros(N)
for j in range(M):
   yy=yy+a_fit[j]*x**j
plot(x,yy)
savefig("mcg.png")
