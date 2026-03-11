program serie_coseno
    implicit none
    real(8) :: x, termino, suma, tolerancia
    real(8) :: cos_fortran, error
    integer :: n, iter

    print *, "Ingrese el valor de x en radianes:"
    read *, x

    tolerancia = 1.0d-10

    suma = 1.0d0
    termino = 1.0d0
    n = 0
    iter = 0

    print *, "Iteracion", "Termino", "Suma parcial"

    do
        iter = iter + 1
        termino = termino * (-1.0d0) * x*x / ((2*n+1)*(2*n+2))
        suma = suma + termino

        print *, iter, termino, suma

        if (abs(termino) < tolerancia) exit
        n = n + 1
    end do

    cos_fortran = cos(x)
    error = abs(suma - cos_fortran)

    print *
    print *, "Resultado serie de Taylor:", suma
    print *, "Resultado funcion cos de Fortran:", cos_fortran
    print *, "Iteraciones realizadas:", iter
    print *, "Error absoluto:", error

end program serie_coseno