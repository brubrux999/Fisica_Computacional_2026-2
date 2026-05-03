real :: a,b,c

! Pedir los valores de a, b, c
read(*,*) a, b, c

! Càlculo del discriminante
d = b**2 - 4*a*c

! Determinar el valor de las raices
if (d == 0.0) then
print*, "Las raices son iguales"
else if (d < 0.0) then
print*, "Las raices son complejas"
else if (d > 0.0) then
print*, "Las raices son reales y distintas"
end if

end program