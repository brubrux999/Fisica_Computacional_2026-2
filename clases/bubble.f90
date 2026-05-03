PROGRAM BUBBLE
! Este programa ordena un arreglo de números reales

IMPLICIT NONE
REAL, ALLOCATABLE :: X(:)
REAL :: HOLD
INTEGER :: k, i, j
INTEGER :: N ! Tamaño del array a ordenar

READ(*,*) N
ALLOCATE(X(N))

DO k=1, N
      READ(*,*) X(k)
ENDDO

! Se imprime el arreglo desordenado
!WRITE(*,*) X

! El siguiente do se encargará de ordenarlos
DO i=1, N-1
      DO j=1, N-1
      
      IF (X(j)>X(j+1)) THEN
      HOLD = X(j)
      X(j) = X(j+1)
      X(j+1) = HOLD
      ENDIF
      ENDDO  
ENDDO

! Se imprime el arreglo ordenado
!WRITE(*,*) X

DEALLOCATE(X)

END PROGRAM BUBBLE