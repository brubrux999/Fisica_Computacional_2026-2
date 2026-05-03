Program funcion_coseno

IMPLICIT NONE
INTEGER :: Count ! Valor de 2n en la suma
INTEGER :: n ! Para calcular el valor del coeficiente
INTEGER :: Fact ! Valor del factorial
REAL :: Term ! Valor de un término de la suma
REAL :: Sum ! Valor de la suma
REAL :: X ! El input x
REAL, PARAMETER :: Tolerance = 0.000001 ! Tolerancia

WRITE(*,*) "Dame el valor de x:"
READ(*,*) X

n = 1 ! El primer termino es n=1
Count = 2 ! El contador empieza en 2n=2
Sum = 1.0 ! La suma empieza en 1
Term = (X**2) / 2.0 ! El Segundo termino es x

DO
    IF (ABS(Term) < Tolerance) EXIT ! Condición de paro
    Sum = Sum + ((-1)**n)*Term ! Sumamos el siguiente termino alternando el signo
    n = n + 1 ! Siguiente valor del indice de la suma
    Count = Count + 2 ! Representa el término 2n
    Fact = Factorial(count) ! CALCULAR EL VALOR DEL FACTORIAL DE 2n CON UNA FUNCION PARA EL FACTORIAL
    Term = (X**(Count)) / Fact ! Calcula el término no nulo siguiente de la serie
END DO

WRITE(*,*) 'After ', n, ' iterations:'
WRITE(*,*) ' Cos(', X, ') = ', Sum
WRITE(*,*) ' From COS() = ', Cos(X)
WRITE(*,*) ' Abs(Error) = ', ABS((Sum - cos(X))/cos(X))

contains

INTEGER function Factorial(k)
    IMPLICIT NONE
    INTEGER :: k ! Valor a calcularle el factorial
    INTEGER :: i

    Factorial = 1
    do i=1, k
        Factorial = Factorial * i
    end do
end function factorial

end program funcion_coseno