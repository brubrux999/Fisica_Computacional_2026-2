PROGRAM Ejercicio

    IMPLICIT NONE
    REAL(8), DIMENSION(:), ALLOCATABLE :: x, f
    REAL(8), DIMENSION(:,:), ALLOCATABLE :: Q
    REAL(8), PARAMETER :: y = 1.5
    INTEGER :: i, j, n

    ! Preguntar cantidad de datos
    WRITE(*,*) "Cantidad de datos: "
    READ(*,*) n

    ! Definimos tamaño de arreglos
    ALLOCATE(x(0:n-1), f(0:n-1), Q(0:n-1,0:n-1))

    ! Leer datos x de archivo de texto
    DO i = 0, n-1
        READ(*,*) x(i), f(i)
    END DO

    DO i = 0, n-1
        Q(i,0) = f(i)
    END DO
    
    ! Calcular los valores de Q para y = 1.5
    DO i = 1, n-1
        DO j = 1, i
            Q(i,j) = ((Q(i,j-1)*(y - x(i-j))) - (Q(i-1,j-1)*(y - x(i)))) / (x(i) - x(i-j))
        END DO
    END DO

    DO i = 0, n-1
        WRITE(*,*) Q(i,:)
    END DO

END PROGRAM Ejercicio