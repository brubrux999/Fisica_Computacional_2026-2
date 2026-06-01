PROGRAM Poisson
    ! Programa que resuelve la EDO2: " Y*I*u(x)'' = f(x) "

    IMPLICIT NONE
    REAL(8), DIMENSION(:,:), ALLOCATABLE :: A
    REAL(8), DIMENSION(:), ALLOCATABLE :: u, b
    REAL(8), DIMENSION(:), ALLOCATABLE :: f ! Densidad de la fuerza sobre la tabla
    REAL    :: L, h, Y, t, w, I, g, gamma, f_0, x_0 ! Constantes
    REAL    :: x ! x = i*h
    INTEGER :: n ! Numero de ecuaciones
    INTEGER :: j, iter

    !WRITE(*,*) "Escriba el valor de n: "
    !READ(*,*) n
    n = 1000
    ALLOCATE(A(n,n), u(n), f(n), b(n))

    A = 0.0
    ! Diagonal principal
    DO j = 1, n
        A(j, j) = -2.0
    END DO
    ! Diagonal superior e inferior
    DO j = 1, n-1
        A(j,j+1) = 1.0
        A(j+1,j) = 1.0
    END DO

    ! Definimos constantes
    L = 3.0 ! Largo de la tabla de madera
    h = L / (n) ! Divisiones del intervalo [0,L]
    Y = 1.0*(10.0**9) ! Módulo de Young
    t = 0.030 ! Ancho
    w = 0.20 ! Largo
    I = (t**3)*w / 12 ! Constante geométrica
    g = 9.8
    gamma = 3.0

    f_0 = 588.0 ! Persona de 60kg
    x_0 = 0.25 ! Ancho de la persona de 0.40m

    ! Determinar b mediante f(x)
    DO j = 1, n
        x = j*h
        IF (abs(x-(L/2)) <= x_0) THEN
            f(j) = f_0*(exp(-(x-(L/2))**2 / x_0**2) - exp(-L)) + gamma*g
        ELSE
            f(j) = gamma*g
        END IF
    END DO

    DO j = 1, n
        b(j) = (h**2)*f(j) / (Y*I)
    END DO

    iter = 100
    CALL iterative_gauss_seidel(A, b, u, iter, n)
    
    ! Guardar x, u(x) en un archivo para graficar
    OPEN(unit=10, file="datos.txt", status="replace")
        DO j = 1, n
            WRITE(10,*) j*h, u(j)
        END DO
    CLOSE(10)

END PROGRAM Poisson

SUBROUTINE iterative_gauss_seidel(a,b,x,iter,n)
    ! ----------------------------------------------------------------- 
    ! Argumentos de la subrutina
    ! ----------------------------------------------------------------- 
    REAL(8), INTENT(IN) :: a(n,n) ! Matriz del sistema
    REAL(8), INTENT(IN) :: b(n) 
    REAL(8), INTENT(INOUT) :: x(n) 
    INTEGER, INTENT(INOUT) :: iter ! Numero de iteraciones
    !------------------------------------------------------------------
    INTEGER :: n 
    INTEGER :: k 
    INTEGER :: i 
    REAL(8) :: xi 
    REAL(8) :: xnorma 
    REAL(8) :: difnorma
    !------------------------------------------------------------------
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
        iter = k  
        EXIT
    END IF 
    END DO
END SUBROUTINE iterative_gauss_seidel