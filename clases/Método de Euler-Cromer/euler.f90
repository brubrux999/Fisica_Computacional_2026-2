PROGRAM Euler_Cromer
!*********************************************************************
! Aqui debemos aprender a usar las subrutinas y arreglos dinamicos
!
!
!*********************************************************************
 REAL(8), DIMENSION(:), ALLOCATABLE :: theta,omega,t
 REAL(8) :: length,dt
!
 n=100000   ! Aqui se leen los tamaños de los arreglos, pudo ser de un read!!
 ALLOCATE (theta(0:n),omega(0:n),t(0:n))
!
theta=0.d0
!
 call inicializa(theta, omega, t, n, length, dt)
 call calcula (theta, omega, t, n, length, dt)
 call despliega(theta, omega, t, n)
!
END PROGRAM Euler_Cromer
!
!
SUBROUTINE inicializa(theta, omega, t, n ,length, dt)
 INTEGER, INTENT (IN) :: n
 REAL(8), DIMENSION(0:n) :: theta,omega,t
 REAL(8) :: length,dt
 print*,'Angulo inicial del pendulo (en radianes)'
 read*, theta(0)
 print*,'Velocidad angular inicial del pendulo (en radianes/s)'
 read*, omega(0)
 t(0)=0.0
 print*,'Longitud del pendulo (in m)'
 read*, length
 print*, 'Tamao de paso (en segundos)'
 read*, dt
END SUBROUTINE inicializa
!
SUBROUTINE calcula(theta, omega, t, n, length, dt)
 INTEGER, INTENT (IN) :: n
 REAL(8), DIMENSION(0:n) :: theta,omega,t
 REAL(8) :: length,dt,g,periodo
 INTEGER :: i
 g= 9.80
 DO i=0,n-1
     omega(i+1) = omega(i) - (g/length) * theta(i) * dt ! metodo de Euler
     theta(i+1) = theta(i) + omega(i) * dt ! 
     t(i+1) = t(i) + dt
 ENDDO
END SUBROUTINE calcula
!
!
SUBROUTINE despliega(theta, omega, t, n)
 INTEGER, INTENT (IN) :: n
 REAL(8), DIMENSION(0:n) :: theta,omega,t
 REAL(8) :: length,dt
 INTEGER :: i
 CHARACTER(LEN=20), PARAMETER :: f1 = '(3F16.6)'
 OPEN(UNIT=2,FILE='euler.dat',STATUS='UNKNOWN')
 !
 Do i=0,n
   WRITE(2,f1) T(I),theta(i),omega(i)
 enddo
 !
 CLOSE(10)


END SUBROUTINE despliega