Program Coseno

IMPLICIT NONE
INTEGER :: Count ! Valor de 2n en la suma
INTEGER :: i, j ! Para calcular el valor del coeficiente
REAL:: Fact ! Valor del factorial
REAL :: Term ! Valor de un término de la suma
REAL :: Sum ! Valor de la suma
REAL :: X ! El input x
REAL, PARAMETER :: Tolerance = 0.0000001 ! Tolerancia

WRITE(*,*) "Dame el valor de x:"
READ(*,*) X

i = 1 ! el primer termino es n=1
Count = 2 
Sum = 1.0 ! asi, la suma empieza con 1
Term = (X**2) / 2.0 ! el Segundo termino es x

DO
    IF (ABS(Term) < Tolerance) EXIT ! Condición de paro
    Sum = Sum + ((-1)**i)*Term
    i = i + 1
    Count = Count + 2 ! Representa el término 2n
    Fact = 1.0
    do j=1, Count
        Fact = Fact * j ! Calcula el factorial de 2n
    end do
    Term = (X**(Count)) / Fact ! Calcula el término n de la suma
END DO

WRITE(*,*) 'After ', i, ' iterations:'
WRITE(*,*) ' Cos(', X, ') = ', Sum
WRITE(*,*) ' From COS() = ', Cos(X)
WRITE(*,*) ' Abs(Error) = ', ABS((Sum - cos(X))/cos(X))

end program Coseno