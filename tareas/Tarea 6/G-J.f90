PROGRAM Gauss_Jordan

    IMPLICIT NONE
    REAL(8), DIMENSION(:,:), ALLOCATABLE :: A, Aaum, Ainv, C
    INTEGER                              :: i, j, n, opcion
    REAL(8), DIMENSION(:), ALLOCATABLE   :: b, temp, X
    CHARACTER(len=50)                    :: fmt
    
    ! Elegir opción
    PRINT*, "1) Resolver el sistema Ax = b"
    PRINT*, "2) Calcular la inversa de A"
    READ(*,*) opcion

    PRINT*, "Introduzca numero de ecuaciones: "
    READ(*,*) n

    ALLOCATE (A(n,n), Ainv(n,n), b(n), X(n), C(n,n+1))

    IF (opcion == 1) THEN ! Usar Gauss-Jordan para resolver Ax = b
        ALLOCATE(Aaum(n,n+1), temp(n+1))

        ! Obtiene los elementos de la matriz A
        PRINT*, "Escriba los renglones (son de tamaño n): "
        DO i = 1, n
            READ (*,*) (A(i,j), j=1,n)
        END DO

        ! Obtiene los valores de b
        PRINT*, "Escribe los valores de b: "
        DO i = 1, n
            READ (*,*) b(i)
        END DO

        ! Definir la matriz aumentada
        Aaum(:, 1:n) = A
        Aaum(:, n+1) = b

        ! Resuelve por Gauss-Jordan usando la subrutina
        C = Aaum
        CALL GaussJordan(Aaum, n, n+1)

        ! Imprime cada valor X(i)
        DO i = 1, n
            X(i) = Aaum(i,n+1)
        END DO

        PRINT*
        PRINT*, "Valores de X: "
        WRITE(*, "(4F14.6)") X
        PRINT*, "Residuios= "
        WRITE(*, "(4G14.6)") C(:,n+1) - MATMUL(C(:,1:n),X)
    
    ELSE IF (opcion == 2) THEN ! Usar Gauss-Jordan para calcular la inversa
        ALLOCATE(Aaum(n,2*n), temp(2*n))

        ! Obtiene los elementos de la matriz A
        PRINT*, "Escriba los renglones (son de tamaño n)"
        DO i = 1, n
            READ (*,*) (A(i,j), j=1,n)
        END DO

        ! Definir la matriz aumentada
        Aaum(:, 1:n) = A
        Aaum(:, n+1:2*n) = 0.d0
        DO i = 1, n
            Aaum(i, n+i) = 1.d0
        END DO

        ! Encuentra la inversa usando Gauss-Jordan
        CALL GaussJordan(Aaum, n, 2*n)

        ! Define la matriz inversa
        DO i = 1, n
            DO j = n+1, 2*n
                Ainv(i,j-n) = Aaum(i,j)
            END DO
        END DO

        ! Imprime la matriz inversa
        PRINT*
        PRINT*, "Matriz A inversa: "
        WRITE(fmt, '(A,I0,A)') '(', n, 'F12.6)'
        DO i = 1, n
            WRITE(*, fmt) (Ainv(i,j), j=1,n)
        END DO

    ELSE
        PRINT*, "Opcion no válida"
    END IF

END PROGRAM Gauss_Jordan
   
!********************* Realiza eliminacion Gauss-Jordan *********************
SUBROUTINE GaussJordan(Aaum, n, m)

    IMPLICIT NONE
    REAL(8), DIMENSION(n,m) ::  Aaum
    INTEGER                 ::  i, j, k, p, n, m
    REAL(8), DIMENSION(m)   ::  temp
    REAL(8)                 ::  suma, mult

    DO i = 1, n-1                                      !PASO 1
        p = 0   

        ! Pivoteo parcial forma 1:
        p = maxloc(Aaum(i:n,i), dim=1) + i-1

        ! Pivoteo parcial forma 2:
        !DO j = i, n
            !IF (Aaum(j,i) == maxval(Aaum(i:n,i))) THEN
                !p = j
                !EXIT
            !END IF
        !END DO

        !DO j = i, n                                    !PASO 2
            !IF (Aaum(j,i) /= .0) THEN
            !p = j
            !EXIT
            !END IF
        !END DO

        IF (p == 0) THEN
            PRINT*, 'La solucion no es unica'
            STOP
        END IF
        IF (p /= i) THEN                               !PASO 3
            ! Intercambia el renglon p con el renglon i
            temp = Aaum(p,:);  Aaum(p,:) = Aaum(i,:);  Aaum(i,:) = temp
        END IF

        DO j = i+1, n                                  !PASO 4
            mult = Aaum(j,i)/Aaum(i,i)                 !PASO 5 (multiplicador para cada renglon)
            Aaum(j,:) = Aaum(j,:) - mult * Aaum(i,:)   !PASO 6
        END DO
    END DO

    IF (Aaum(n,n) == 0) THEN
        PRINT*, "No existe solucion unica"
        STOP     
    END IF

    !********************* Inicia sustitucion hacia atras *********************
    DO j = n+1, m
        DO i = n, 1, -1
            suma = 0.0
            DO k = i+1, n
                suma = suma + Aaum(i,k)*Aaum(k,j)
            END DO
            Aaum(i,j) = (Aaum(i,j) - suma) / Aaum(i,i)
        END DO
    END DO

    END SUBROUTINE