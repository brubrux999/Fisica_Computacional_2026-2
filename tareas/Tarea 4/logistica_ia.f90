program bifurcacion
  implicit none
  integer :: i, j, k, n_trans, n_plot, n_r
  real(8) :: r, x, r_min, r_max, dr

  ! Abre el documento para esribir el output en este
  open(unit=10, file="bifurcacion.dat", status="replace") 

  r_min = 2.5d0 
  r_max = 4.0d0
  dr = 0.001d0

  n_trans = 1000
  n_plot  = 200

  n_r = int((r_max - r_min)/dr)

  do k = 0, n_r
     r = r_min + k*dr
     x = 0.5d0

     ! eliminar transitorios
     do i = 1, n_trans
        x = r * x * (1.0d0 - x) ! Ecuacion del mapeo logistico
     end do

     ! guardar puntos
     do j = 1, n_plot
        x = r * x * (1.0d0 - x) ! Ecuacion del mapeo logistico
        write(10,*) r, x
     end do

  end do

  close(10)
end program bifurcacion