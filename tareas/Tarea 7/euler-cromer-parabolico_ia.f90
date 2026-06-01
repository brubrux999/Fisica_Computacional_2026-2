program euler_cromer_parabolico
    implicit none

    ! Parámetros
    integer, parameter :: n = 2
    integer, parameter :: max_steps = 1000000

    ! Variables
    real(8) :: q0(n), v0(n)
    real(8) :: q_new(n), v_new(n)
    real(8) :: t0, tf, h
    real(8) :: datos_t(max_steps)
    real(8) :: datos_q(max_steps,n)
    real(8) :: datos_v(max_steps,n)
    real(8) :: pi
    integer :: i, steps

    pi = 4.0d0 * atan(1.0d0)

    ! Condiciones iniciales
    q0 = (/0.0d0, 0.0d0/)
    v0 = (/30.0d0*cos(pi/3.0d0), 30.0d0*sin(pi/3.0d0)/)

    t0 = 0.0d0
    tf = 500.0d0
    h  = 0.001d0

    ! Guardar condiciones iniciales
    steps = 1
    datos_t(steps)   = t0
    datos_q(steps,:) = q0
    datos_v(steps,:) = v0

    ! Método Euler-Cromer
    do while (t0 < tf)

        call f_v(t0, q0, v0, v_new, h)
        call f_q(t0, q0, v_new, q_new, h)

        t0 = t0 + h
        q0 = q_new
        v0 = v_new

        steps = steps + 1

        datos_t(steps)   = t0
        datos_q(steps,:) = q0
        datos_v(steps,:) = v0

        if (paro(t0, q0, v0)) exit

    end do

    ! Guardar trayectoria en archivo
    open(unit=10, file='trayectoria.dat', status='replace')

    do i = 1, steps
        write(10,*) datos_q(i,1), datos_q(i,2)
    end do

    close(10)

    print *, 'Simulación terminada.'
    print *, 'Datos guardados en trayectoria.dat'

contains

    !-----------------------------------------
    subroutine f_q(t, q, v, q_new, h)
        implicit none
        real(8), intent(in)  :: t, q(2), v(2), h
        real(8), intent(out) :: q_new(2)

        q_new(1) = q(1) + h*v(1)
        q_new(2) = q(2) + h*v(2)
    end subroutine f_q
    !-----------------------------------------

    !-----------------------------------------
    subroutine f_v(t, q, v, v_new, h)
        implicit none
        real(8), intent(in)  :: t, q(2), v(2), h
        real(8), intent(out) :: v_new(2)

        real(8) :: l, g, vel

        l = 0.9d0
        g = 9.8d0

        vel = sqrt(v(1)**2 + v(2)**2)

        v_new(1) = v(1) + h*(-l*v(1)*vel)
        v_new(2) = v(2) + h*(-g - l*v(2)*vel)

    end subroutine f_v
    !-----------------------------------------

    !-----------------------------------------
    logical function paro(t, q, v)
        implicit none
        real(8), intent(in) :: t, q(2), v(2)

        if (q(2) < 0.0d0) then
            paro = .true.
        else
            paro = .false.
        end if

    end function paro
    !-----------------------------------------

end program euler_cromer_parabolico