  PROGRAM JACOBI
  REAL(8), DIMENSION(:,:), ALLOCATABLE ::  A,C ! A la aumentada y C la nxn
  INTEGER                              ::  i, j, p, n,clave
  REAL(8), DIMENSION(:), ALLOCATABLE   ::  temp,X,B
  PRINT "(A)", "Introduzca numero de renglones"
  READ *, n
!****************fin de declaraciones *******************************
  ALLOCATE (A(n,n+1), temp(n+1),x(n),B(n),C(n,n)) !Cx = b
  iter=100 ! Numero máximo de iteraciones
  DO i = 1, n
     READ (*,*) (A(i,j), j=1,N+1)
  END DO
  X=0 ! La solucion
  C=A(:,1:N)
  B=A(:,N+1)
  call iterative_jacobi(C,B,x,iter,clave,n)
  print*,"numero de iteraciones", iter
  print*, x
  x=0
  call iterative_gauss_seidel(C,B,x,iter,clave,n)
  print*,"numero de iteraciones", iter
  print*, x

  end program JACOBI

SUBROUTINE iterative_jacobi(a,b,x,iter,clave,n)
! -----------------------------------------------------------------
! Argumentos de la subrutina
! ----------------------------------------------------------------- 
REAL(8), INTENT(IN) :: a(n,n) ! Matriz del sistema
REAL(8), INTENT(IN) :: b(n)
REAL(8), INTENT(INOUT) :: x(n)
INTEGER, INTENT(INOUT) :: iter
INTEGER, INTENT(OUT) :: clave
REAL(8), ALLOCATABLE :: diag(:) ! Elementos de la diagonal
REAL(8), ALLOCATABLE :: x0(:)
INTEGER :: k,i,n
ALLOCATE(diag(SIZE(a,1)),x0(SIZE(a,1)), STAT=clave)
IF (clave /=0 ) THEN
   clave = -1
   RETURN 
ENDIF
clave = 1
diag = [ (a(i,i), i=1,SIZE(a,1)) ] ! Que maravilla, construye un arreglo con la diagonal 
DO k=1,iter
  x0 = x
  x = x0 + (b - MATMUL(a,x0))/diag
  IF ( MAXVAL(ABS(x-x0)) <= MAXVAL(ABS(x))*0.000001 ) THEN
      clave = 0 
      iter =k 
      EXIT
  ENDIF 
ENDDO
DEALLOCATE(diag,x0)
END SUBROUTINE iterative_jacobi

SUBROUTINE iterative_gauss_seidel(a,b,x,iter,clave,n)
! ----------------------------------------------------------------- 
! Argumentos de la subrutina
! ----------------------------------------------------------------- 
REAL(8), INTENT(IN) :: a(n,n) ! Matriz del sistema
REAL(8), INTENT(IN) :: b(n) 
REAL(8), INTENT(INOUT) :: x(n) 
INTEGER, INTENT(INOUT) :: iter
INTEGER, INTENT(OUT) :: clave
!------------------------------------------------------------------
INTEGER :: n 
INTEGER :: k 
INTEGER :: i 
REAL(8) :: xi 
REAL(8) :: xnorma 
REAL(8) :: difnorma
!------------------------------------------------------------------
clave = 1
n = SIZE(a,1) 
DO k=1,iter
  xnorma = 0.0 
  difnorma = 0.0
  DO i=1,n
    xi= (b(i) - DOT_PRODUCT(a(i,1:i-1),x(1:i-1)) & 
       &      - DOT_PRODUCT(a(i,i+1:n),x(i+1:n)))/a(i,i)
    xnorma   = MAX(xnorma,ABS(xi))
    difnorma = MAX(difnorma,ABS(xi-x(i)))
    x(i)     = xi
  END DO
  IF (difnorma <= xnorma*0.0000001) THEN
    iter =k 
    clave = 0 
    EXIT
  ENDIF 
ENDDO
END SUBROUTINE iterative_gauss_seidel

subroutine dif2 ( m, n, a )
implicit none
integer ::  m,n,i,j
real (8) :: a(m,n)

  do j = 1, n
    do i = 1, m
      if ( j == i - 1 ) then
        a(i,j) = -1.0D+00
      else if ( j == i ) then
        a(i,j) = 2.0D+00
      else if ( j == i + 1 ) then
        a(i,j) = -1.0D+00
      else
        a(i,j) = 0.0D+00
      end if

    end do
  end do

  return
end subroutine dif2
