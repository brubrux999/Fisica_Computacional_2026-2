Program Caminantes

IMPLICIT NONE
INTEGER, PARAMETER :: m = 1000 ! Numero de Pasos
INTEGER, PARAMETER :: n = 1000 ! Numero de Caminantes
INTEGER, PARAMETER :: nshow = 30 ! Numero de Caminatas a mostrar
INTEGER :: i, j
REAL :: a, b ! Intervalo del paso variable
REAL :: Paso, Pos
REAL :: Cam(m,n) ! Matriz del recorrido de los caminantes
REAL :: DCM(m) ! Matriz del desplazamiento cuadratico medio

WRITE(*,*) "¿De que tamaño el intervalo [a,b] de paso variable?"
READ(*,*) a, b

do j=1, n ! Para cada caminante
    pos = 0.0
    do i=1, m ! Para cada paso
        call random_number(paso) ! Genera un paso variable entre 0 y 1
        paso = a + (b - a) * paso ! Actualiza el paso a un intervalo [a,b]
        pos = pos + paso
        Cam(i,j) = pos
    end do
end do

DCM = 0.0
do j=1, m ! Para cada paso
    do i=1, n ! Para cada caminante
        DCM(j) = DCM(j) + (Cam(j,i) - Cam(1,i))**2
    end do
    DCM(j) = DCM(j) / n
end do

! Imprimir unicamente el DCM
!do j=1, m
!    print*, j, DCM(j)
!end do

! Imprimir unicamente los desplazamientos
!do i = 1, m
!    do j = 1, N
!        write(100,*) i, Cam(i,j)
!    end do
!end do

! Imprimir nshow desplazamientos y DCM de los n caminantes
do i = 1, m
    print*, i, (Cam(i,j), j=1,nshow), DCM(i)
end do

End program Caminantes