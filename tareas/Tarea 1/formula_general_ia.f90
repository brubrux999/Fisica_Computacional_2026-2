program ecuacion_cuadratica_compleja
  implicit none

  ! Definición de precisiones
  integer, parameter :: sp = selected_real_kind(6)    ! simple
  integer, parameter :: dp = selected_real_kind(15)   ! doble
  integer, parameter :: qp = selected_real_kind(33)   ! cuadruple (si disponible)

  ! Entrada en doble precisión
  real(dp) :: a_in, b_in, c_in

  ! Variables reales
  real(sp) :: a_sp, b_sp, c_sp
  real(dp) :: a_dp, b_dp, c_dp
  real(qp) :: a_qp, b_qp, c_qp

  ! Discriminantes
  complex(sp) :: d_sp
  complex(dp) :: d_dp
  complex(qp) :: d_qp

  ! Raíces
  complex(sp) :: x1_sp, x2_sp
  complex(dp) :: x1_dp, x2_dp
  complex(qp) :: x1_qp, x2_qp

  ! Comprobación
  complex(sp) :: check1_sp, check2_sp
  complex(dp) :: check1_dp, check2_dp
  complex(qp) :: check1_qp, check2_qp

  print *, "=============================================="
  print *, "   Resolucion de a*x^2 + b*x + c = 0"
  print *, "   (soporta raices reales y complejas)"
  print *, "=============================================="

  print *, "Introduce el valor de a:"
  read(*,*) a_in

  print *, "Introduce el valor de b:"
  read(*,*) b_in

  print *, "Introduce el valor de c:"
  read(*,*) c_in

  if (a_in == 0.0_dp) then
     print *, "No es una ecuacion cuadratica (a = 0)"
     stop
  end if

  ! Conversión a cada precisión
  a_sp = real(a_in, sp)
  b_sp = real(b_in, sp)
  c_sp = real(c_in, sp)

  a_dp = a_in
  b_dp = b_in
  c_dp = c_in

  a_qp = real(a_in, qp)
  b_qp = real(b_in, qp)
  c_qp = real(c_in, qp)

  ! =========================
  ! PRECISION SIMPLE
  ! =========================
  d_sp = cmplx(b_sp*b_sp - 4.0_sp*a_sp*c_sp, 0.0_sp, sp)

  x1_sp = (-b_sp + sqrt(d_sp)) / (2.0_sp*a_sp)
  x2_sp = (-b_sp - sqrt(d_sp)) / (2.0_sp*a_sp)

  check1_sp = a_sp*x1_sp**2 + b_sp*x1_sp + c_sp
  check2_sp = a_sp*x2_sp**2 + b_sp*x2_sp + c_sp

  print *, "----- Precision simple -----"
  print *, "Raiz 1 =", x1_sp
  print *, "Raiz 2 =", x2_sp
  print *, "f(x1) =", check1_sp
  print *, "f(x2) =", check2_sp

  ! =========================
  ! PRECISION DOBLE
  ! =========================
  d_dp = cmplx(b_dp*b_dp - 4.0_dp*a_dp*c_dp, 0.0_dp, dp)

  x1_dp = (-b_dp + sqrt(d_dp)) / (2.0_dp*a_dp)
  x2_dp = (-b_dp - sqrt(d_dp)) / (2.0_dp*a_dp)

  check1_dp = a_dp*x1_dp**2 + b_dp*x1_dp + c_dp
  check2_dp = a_dp*x2_dp**2 + b_dp*x2_dp + c_dp

  print *, "----- Precision doble -----"
  print *, "Raiz 1 =", x1_dp
  print *, "Raiz 2 =", x2_dp
  print *, "f(x1) =", check1_dp
  print *, "f(x2) =", check2_dp

  ! =========================
  ! PRECISION CUADRUPLE
  ! =========================
  d_qp = cmplx(b_qp*b_qp - 4.0_qp*a_qp*c_qp, 0.0_qp, qp)

  x1_qp = (-b_qp + sqrt(d_qp)) / (2.0_qp*a_qp)
  x2_qp = (-b_qp - sqrt(d_qp)) / (2.0_qp*a_qp)

  check1_qp = a_qp*x1_qp**2 + b_qp*x1_qp + c_qp
  check2_qp = a_qp*x2_qp**2 + b_qp*x2_qp + c_qp

  print *, "----- Precision cuadruple -----"
  print *, "Raiz 1 =", x1_qp
  print *, "Raiz 2 =", x2_qp
  print *, "f(x1) =", check1_qp
  print *, "f(x2) =", check2_qp

end program ecuacion_cuadratica_compleja