PROGRAM Gauss_Jordan

    IMPLICIT NONE
    REAL(8), DIMENSION(:,:), ALLOCATABLE ::  A, B
    INTEGER                              ::  i, j, n
    REAL(8), DIMENSION(:), ALLOCATABLE   ::  temp, X

    PRINT "(A)", "Introduzca numero de ecuaciones"
    READ*, n

    ALLOCATE (A(n,n+1), temp(n+1), X(n), B(n,n+1))

    ! Obtiene los elementos de la matriz
    PRINT*, "Escriba los renglones (son de tamaño n+1)"
    DO i = 1, n
        READ (*,*) (A(i,j), j=1,n+1)
    END DO

    ! Resuelve por Gauss-Jordan usando la subrutina
    B = A
    CALL GaussJordan(n, A, X)

    ! Imprime los resultados de la subrutina
    PRINT*, X
    PRINT*, 'residuo =', B(:,n+1) - MATMUL(B(:,1:n),X)

    DEALLOCATE (A, temp, X, B)

END PROGRAM Gauss_Jordan
   
!********************* Realiza eliminacion Gauss-Jordan *********************
SUBROUTINE GaussJordan(n, A, X)

    IMPLICIT NONE
    REAL(8), DIMENSION(n,n+1) ::  A
    INTEGER                   ::  i, j, p, n
    REAL(8), DIMENSION(n)     ::  temp, X
    REAL(8)                   ::  suma, m

    DO i = 1, n-1                                      !PASO 1
        p=0   

        DO j = i, n                                    !PASO 2
            IF (A(j,i) /= .0 ) THEN
            P=j
            EXIT
            END IF
        END DO

        IF ( P == 0) print*, 'La solucion no es unica'
        IF ( P == 0) stop                              !PASO 2
        IF ( P /= i) THEN                              !PASO 3
            ! Intercambia el renglon p con el renglon i
            temp = A(P,:);  A(P,:) = A(I,:);  A(I,:) = temp
        END IF

        DO j = i+1, n                                  !PASO 4
            m = A(j,i)/A(i,i)                          !PASO 5 (multiplicador para cada renglon)
            A(j,:) = A(j,:) - m * A(i,:)               !PASO 6
        END DO
    END DO

    IF (A(n,n) == 0) THEN
        PRINT*,' No existe solucion unica. '
    STOP     
    END IF

    !********************* Inicia sustitucion hacia atras *********************
    X(n) = A(n,n+1) / A(n,n)
    DO i = n-1, 1, -1
        suma = .0
        DO j = i+1, n
        suma = suma + A(i,j) * X(j)
        ENDDO
        X(i) = (A(i,n+1) - suma) / A(i,i)
    ENDDO

    END SUBROUTINE