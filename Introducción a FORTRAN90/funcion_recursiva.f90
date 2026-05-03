integer :: compute_factorial
print*, compute_factorial(5)
end program

recursive function compute_factorial(n) result (n_factorial)
 integer :: n_factorial ! variable que se devuelve
 integer, intent (in) :: n
 if (n==0)then
    n_factorial=1
 else
    n_factorial=n*compute_factorial(n-1)
 end if
end function compute_factorial

! Clase 15/04
! Se usa "recursive" si la funcion hará recursión