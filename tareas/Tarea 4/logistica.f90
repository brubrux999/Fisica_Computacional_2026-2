Program Logistica

IMPLICIT NONE
INTEGER :: i, j
REAL :: x
REAL :: r

x = 0.100
r = 1.00

DO i=1, 300
    r = r + 0.01 ! r tomará valores de 1 a 4 con pasos de 0.01
    DO j=1, 300
        x = x*r*(1-x) ! Ecuacion del mapeo logistico
        IF (j > 200) WRITE(*,*) r, x ! Mandar a pantalla solo algunos valores
    END DO
END DO

end program Logistica