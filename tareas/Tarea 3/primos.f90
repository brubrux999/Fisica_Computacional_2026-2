program primos

IMPLICIT NONE
INTEGER :: i, j
INTEGER :: Number ! Numero a comprobar si es primo
INTEGER :: Divisor ! Numero usado para la comprobacion
INTEGER :: n ! Limite para buscar numeros primos
INTEGER :: p(10000) ! Arreglo de primos de hasta 10000 numeros primos

WRITE(*,*) "Hasta que numero quieres generar primos? "
READ(*,*) n

p = 0
i = 2
DO Number=1, n
    IF (Number == 2) THEN ! El 2 siempre es primo
        p(1) = Number
    ELSE IF (Number < 2 .or. mod(Number,2) == 0) THEN ! No es primo si <2 o par'
        continue
    ELSE ! si es un numero impar >2
        Divisor = 3 ! el divisor empieza con 3
        DO ! se divide el numero
            IF (Divisor*Divisor .gt. Number .or. MOD(Number, Divisor) == 0) EXIT
            Divisor = Divisor + 2 ! se incrementa al proximo impar
        END DO
        IF (Divisor*Divisor .gt. Number) THEN ! Si es primo lo guarda en el arreglo
            p(i) = Number
            i = i + 1
        END IF
    END IF
END DO

WRITE(*,*) "Lista de primos generada: "
DO j=1, 10000 ! Muestra los numeros distintos de 0 del arreglo de primos
    IF (p(j) /= 0) WRITE(*,'(I5)', advance="no") p(j)
END DO
WRITE(*,*) ! Para que se vea bien en la terminal :)

end program primos