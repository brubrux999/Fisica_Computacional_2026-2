PROGRAM BURBUJA
! Un método burbuja más inteligente

IMPLICIT NONE
REAL, ALLOCATABLE :: X(:)
REAL aux
INTEGER :: i, j
INTEGER :: N ! Tamaño del array a ordenar

READ(*,*) N
ALLOCATE(X(N))

DO i=1, N
       READ(*,*) X(i)
ENDDO

! Se imprime el arreglo desordenado
!WRITE(*,*) X

! Cuántos quedan por ordenar, es la clave
DO i=9, 1, -1
       DO j=1, i
       IF (X(j).GT.X(j+1)) THEN
              aux = X(j)
              X(j) = X(j+1)
              X(j+1) = aux
       END IF
       END DO
END DO

! Se imprime el arreglo ordenado
!WRITE(*,*) X

DEALLOCATE(X)

END PROGRAM BURBUJA