PROGRAM NEWTON
!
! Este programa aplica el metodo de Newton para enconytran la 
! raiz de f(x)=exp(x)*ln(x)-x*x=0
!
DOUBLE PRECISION                      :: DL,A,B,X0,X1,DX,DF,F
INTEGER                               :: ISTEP

DL= 1.0E-06
A = 1.0
B = 2.0
DX=B-A
print*, "dame aproximacion"
read(*,*) x0
!X0= (A+B)/2.0
ISTEP=0
DO WHILE (ABS(DX) .GT. DL)
         X1 = X0 - F(X0)/DF(X0)
         DX = X1-X0
         X0 = X1
         ISTEP = ISTEP +1
ENDDO
PRINT "(I4,2F16.8)", ISTEP,X0,DX
END PROGRAM NEWTON
!
!---------------------------------Funciones--------------------
!
FUNCTION F(X)
DOUBLE PRECISION                      ::F,X
    F=EXP(x)*LOG(X)-X*X
!    rho=15.0
!    F=x*tan(x)-sqrt(rho*rho-x*x)
END
!
FUNCTION DF(X)
DOUBLE PRECISION                      ::DF,X
    DF=EXP(x)*(LOG(X)+1.0/X)-2.0*X
!    rho=15.0
!    DF=x/sqrt(rho*rho-x*x)+x/(cos(x)*cos(x))+tan(x)
END


