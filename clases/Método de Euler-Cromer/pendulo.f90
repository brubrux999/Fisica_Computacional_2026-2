PROGRAM Euler_Cromer
!*********************************************************************
!
!
!
!**********************************************************************
 
 REAL*8, DIMENSION(:), ALLOCATABLE :: theta,omega,t
 REAL*8 :: length,dt
!
 n=10000 !10000
 ALLOCATE (theta(0:n),omega(0:n),t(0:n))
!
!
 call inicializa(theta, omega, t, n, length, dt)
 call calcula (theta, omega, t, n, length, dt)
 call despliega (theta, omega, t, n, length, dt)
!
END PROGRAM Euler_Cromer
!
!
SUBROUTINE inicializa(theta, omega, t, n ,length, dt)
 INTEGER, INTENT (IN) :: n
 REAL*8, DIMENSION(0:n) :: theta,omega,t
 REAL*8 :: length,dt
 print*,'Angulo inicial del pendulo (en radianes)'
 read*, theta(0)
 print*,'Velocidad angular inicial del pendulo (en radianes/s)'
 read*, omega(0)
 t(0)=0.d0
 print*,'Longitud del pendulo (in m)'
 read*, length
 print*, 'Tamaño de paso (en segundos)'
 read*, dt
END SUBROUTINE inicializa
!
!
SUBROUTINE calcula(theta, omega, t, n, length, dt)
 INTEGER, INTENT (IN) :: n
 REAL*8, DIMENSION(0:n) :: theta,omega,t
 REAL*8 :: length,dt,g,periodo
 INTEGER :: i
 PI= 4.*ATAN(1.)
 i= 0
 g= 9.8d0
 q=1/2.d0
 df=0.0     !1.465 !0.0 !1.465 !1.465 !1.44 ! 1.35d0 !1.44d0 !1.465 !0.5, 1.2,0.0 
 dfr=2/3.d0
 periodo= 2.d0*PI/ SQRT(g/length) !Periodo del pendulo
 DO
 omega(i+1) = omega(i) - (g/length) *sin(theta(i)) * dt - q * omega(i)*dt+df*sin(dfr*t(i))*dt
 theta(i+1) = theta(i) + omega(i+1) * dt ! Metodo de Cromer
 if (theta(i+1) > PI ) theta(i+1)=theta(i+1)-2.*PI
 if (theta(i+1) < -PI) theta(i+1)=theta(i+1)+2.*PI
 t(i+1) = t(i) + dt
! IF (t(i+1) >= 60 * periodo) EXIT
 IF (i >= n-1) EXIT
 i=i+1
 ENDDO
END SUBROUTINE calcula
!
!
SUBROUTINE despliega(theta, omega, t, n, length, dt)
 INTEGER, INTENT (IN) :: n
 REAL*8, DIMENSION(0:n) :: theta,omega,t
 REAL*8 :: length,dt
 INTEGER :: i
 CHARACTER(LEN=10), PARAMETER :: f1 = '(3ES16.6)'
 OPEN (UNIT=10,FILE='1.465',STATUS='UNKNOWN')
 !
 WRITE(10,f1)(theta(i),omega(i),t(i), i=1,n)
 !
 CLOSE(10)
END SUBROUTINE despliega
