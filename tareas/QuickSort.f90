program QS

INTEGER, DIMENSION(0:11) :: &
    array = (/ 25, 44, 1, 76, 35, 9, 61, 5, 93, 10, 5, 57 /)

print "(12I5)", array(:)
call QuickSort(array, 0, 11)
print "(12I5)", array(:)

end program QS

recursive SUBROUTINE QuickSort(x, l, n)
    INTEGER, DIMENSION(0:*) :: x
    INTEGER :: l
    INTEGER :: n
    INTEGER :: i, m, t

    IF (l >= n) return

    m = l
    do i=l, n
        if (x(i) < x(n)) then
            t = x(i)
            x(i) = x(m)
            x(m) = t
            m = m + 1
            !print "(12I5)", x(:)
        end if
    end do

    t = x(m)
    x(m) = x(n)
    x(n) = t
    ! Se puede utilizar el siguiente o el anterior print para visualizar mejor el proceso de ordenado
    ! esto como sugerencia para la explicación del código
    !print "(12I5)", x(:)
    call QuickSort(x, l, m-1)
    call QuickSort(x, m+1, n)

end subroutine QuickSort