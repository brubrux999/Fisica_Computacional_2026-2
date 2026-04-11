program funcion_coseno_ia
    implicit none
    real(8) :: x, suma, termino, tol, cos_real, error
    integer :: n

    ! Pedir datos al usuario
    print *, "Ingrese el valor de x (en radianes):"
    read *, x

    tol = 0.00001

    suma = 0.0_8
    n = 0

    do
        ! Calcular término de la serie
        termino = ((-1.0_8)**n) * (x**(2*n)) / factorial(2*n)

        suma = suma + termino

        ! Condición de paro
        if (abs(termino) < tol) exit

        n = n + 1
    end do

    ! Valor real usando función intrínseca
    cos_real = cos(x)

    ! Error absoluto
    error = abs(cos_real - suma)

    ! Resultados
    print *, "--------------------------------------"
    print *, "Coseno por serie de Taylor:", suma
    print *, "Coseno usando funcion intrinseca:", cos_real
    print *, "Error absoluto:", error
    print *, "Numero de terminos usados:", n+1
    print *, "--------------------------------------"

contains

    ! Funcion factorial
    function factorial(k) result(fact)
        implicit none
        integer, intent(in) :: k
        integer :: i
        real(8) :: fact

        fact = 1.0_8

        if (k == 0) then
            fact = 1.0_8
        else
            do i = 1, k
                fact = fact * i
            end do
        end if
    end function factorial

end program funcion_coseno_ia