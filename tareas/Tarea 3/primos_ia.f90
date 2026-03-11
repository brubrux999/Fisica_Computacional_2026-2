program numeros_primos
    implicit none
    integer :: N, i, j, contador
    logical :: es_primo
    integer, allocatable :: primos(:)

    print *, "Ingrese el numero limite:"
    read *, N

    ! Reservar espacio máximo posible
    allocate(primos(N))

    contador = 0

    do i = 2, N
        es_primo = .true.

        do j = 2, int(sqrt(real(i)))
            if (mod(i,j) == 0) then
                es_primo = .false.
                exit
            end if
        end do

        if (es_primo) then
            contador = contador + 1
            primos(contador) = i
        end if
    end do

    print *, "Numeros primos hasta ", N, ":"
    do i = 1, contador
        write(*,'(I6)', advance='no') primos(i)
    end do
    print *

    deallocate(primos)

end program numeros_primos