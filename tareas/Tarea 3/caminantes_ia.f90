program random_walk_msd
implicit none

integer, parameter :: Nwalkers = 10000
integer, parameter :: T = 1000
integer :: i, j
integer :: step
real :: r
real :: msd
integer, dimension(Nwalkers) :: x
real, dimension(T) :: msd_t

call random_seed()

! posiciones iniciales
x = 0

do j = 1, T

    do i = 1, Nwalkers

        call random_number(r)

        if (r < 0.5) then
            step = -1
        else
            step = 1
        end if

        x(i) = x(i) + step

    end do

    msd = 0.0

    do i = 1, Nwalkers
        msd = msd + real(x(i)**2)
    end do

    msd_t(j) = msd / Nwalkers

end do


! guardar datos
open(unit=10, file="msd.dat")

do j = 1, T
    write(10,*) j, msd_t(j)
end do

close(10)

print *, "Simulacion terminada"
print *, "Datos guardados en msd.dat"

end program