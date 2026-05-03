INTEGER, PARAMETER  :: N=1000
REAL, DIMENSION(N)  :: R,POTEN    !R(N),POTEN(N
REAL, DIMENSION(4)  :: EPSI,SIGMA,DR
CHARACTER(100)        :: formato1
CHARACTER(20)         :: formato2
formato1="('#',3X,'EPSILON = ',E9.3,4X,'SIGMA =' ,E9.3,4X,'DR = ',E9.3,5X,'NUMERO DE PUNTOS N = ',I7)"
formato2="(6X,E9.3,6X,E9.3)"
! Definiciones de los datos epsilon y sigma
! 1 es Ne, 2 es Ar, 3 es Kr 4 es Xe
EPSI =(/0.0031,0.0104,0.014,0.02/)
SIGMA =(/2.64,3.4,3.65,3.98/)
OPEN(1,FILE='Ne.dat',STATUS='UNKNOWN')
OPEN(2,FILE='Ar.dat',STATUS='UNKNOWN')
OPEN(3,FILE='Kr.dat',STATUS='UNKNOWN')
OPEN(4,FILE='Xe.dat',STATUS='UNKNOWN')
DO I=1, 4 !Contador para los gases
   DR(I) = 2.1*SIGMA(I)/REAL(N)
   WRITE(I,formato1)EPSI(I),SIGMA(I),DR(I),N
   DO J=1, N !Contador para los puntos
       R(J) = 0.9*SIGMA(I) + REAL(J)*DR(I)
       POTEN(J) = 4.0*EPSI(I)*((SIGMA(I)/R(J))**12 -(SIGMA(I)/R(J))**6)
       WRITE(I,formato2)R(J),POTEN(J)
   END DO
   CLOSE(I)
END DO
!50 FORMAT('#',3X,'EPSILON = ',E9.3,4X,'SIGMA =' ,E9.3,4X,'DR = ',E9.3,5X,'NUMERO DE PUNTOS N = ',I7)
!100 FORMAT(6X,E9.3,6X,E9.3)
END PROGRAM

