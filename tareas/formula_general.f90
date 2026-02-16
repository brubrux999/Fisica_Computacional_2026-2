complex :: a1,b1,c1,x1,x2
complex(8) :: a2,b2,c2,y1,y2

! Cálculo de las raices con precisión simple
a1 = (1., 1.)
b1 = (2., 2.)
c1 = (3., 3.)

x1 = (-b1 + SQRT(b1**2. - 4.*a1*c1))/(2.*a1)
x2 = (-b1 -SQRT(b1**2. - 4.*a1*c1))/(2.*a1)

print*, "Precisión simple:"
print*, x1, "----> x1"
print*, x2, "----> x2"

! Comprobación de resultados
print*, a1*x1**2. + b1*x1 + c1, "----> Comprobación de x1"
print*, a1*x2**2. + b1*x2 + c1, "----> Comprobación de x2"

! Cálculo de las raices con precisión doble
a2 = (1.d0, 1.d0)
b2 = (2.d0, 2.d0)
c2 = (3.d0, 3.d0)

y1 = (-b2 + SQRT(b2**2.d0 - 4.d0*a2*c2))/(2.d0*a2)
y2 = (-b2 -SQRT(b2**2.d0 - 4.d0*a2*c2))/(2.d0*a2)

print*, "Precisión doble:"
print*, x1, "----> x1"
print*, x2, "----> x2"

! Comprobación de resultados
print*, a2*y1**2.d0 + b2*y1 + c2, "----> Comprobación de x1"
print*, a2*y2**2.d0 + b2*y2 + c2, "----> Comprobación de x2"

end program