PROGRAM IS

IMPLICIT NONE
REAL, ALLOCATABLE :: X(:)
INTEGER :: i
INTEGER :: N ! Tamaño del array a ordenar

READ(*,*) N
ALLOCATE(X(N))

DO i=1, N
       READ(*,*) X(i)
END DO

! Se imprime el arreglo desordenado
!WRITE(*,*) X
call InsertSort(X, N)
! Se imprime el arreglo ordenado
!WRITE(*,*) X

DEALLOCATE(X)

END PROGRAM IS

SUBROUTINE InsertSort(X, N)
    REAL, DIMENSION(N) :: X
    REAL :: xpiv
    INTEGER :: i, ipiv

DO ipiv = 1, N
    xpiv = X(ipiv)
    i = ipiv - 1
    DO WHILE (i >= 0 .and. X(i) > xpiv)
        X(i+1) = X(i)
        i = i - 1
    END DO
    X(i+1) = xpiv
END DO

END SUBROUTINE