PROGRAM ALEATORIOS

! Este programa genera numeros aleatorios entre 0 y 1

INTEGER :: i
INTEGER :: n ! Cantidad de numeros aleatorios a generar
REAL, ALLOCATABLE :: r(:)

READ(*,*) n
! Este write es para que se seleccione el tamaño de los array en los métodos de la burbuja
WRITE(*,*) n

ALLOCATE(r(n))

call RANDOM_NUMBER(r)
DO i=1, n
   WRITE(*,*) r(i)
END DO

DEALLOCATE(r)

END PROGRAM ALEATORIOS