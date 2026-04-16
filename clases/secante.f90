PROGRAm secante
!Main program to use the Secant Method to find the root of
! f(x)=exp(x)*ln(x)-x*x=0.
!
REAL*8 :: DL,A,B,DX,X0,H
INTEGER :: ISTEP
 DL = 1.0D-16
 A = 1.0
 B = 2.0
 DX = (B-A)/10.0
 X0 = (A+B)/2.0
 PRINT*,'X0=',X0
 CALL SECANT (DL,X0,DX,ISTEP)
 PRINT*, ISTEP,X0,DX
END PROGRAM SECANTE
!
 SUBROUTINE SECANT (DL,X0,DX,ISTEP)
!
! Subroutine for the root of f(x)=0 with the secant method.
!
 IMPLICIT NONE
 INTEGER :: ISTEP
 REAL*8 :: X0,DX
 REAL*8 :: X1,X2,D,F,FX
 REAL*8 :: DL
 PRINT*, 'DX=',DX,'X0=',X0, DL
 ISTEP = 0
 X1 = X0 + DX
 DO WHILE (ABS(DX)>DL)
 D = F(X1) - F(X0)
 X2 = X1 - F(X1)*(X1-X0)/D
 X0 = X1
 X1 = X2
 DX = X1 - X0
 ISTEP = ISTEP + 1
 ENDDO
 END SUBROUTINE SECANT
!
 FUNCTION F(X)
 IMPLICIT NONE
 REAL*8 :: F 
 REAL*8, INTENT (IN) :: X
 F = EXP(X)*LOG(X) - X*X
 END
