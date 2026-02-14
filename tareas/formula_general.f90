complex :: a1,b1,c1,x1,x2
complex(8) :: a2,b2,c2,y1,y2
complex(16) :: a3,b3,c3,z1,z2

! Cálculo de las raices con precisión simple
a1 = (1., 1.)
b1 = (2., 2.)
c1 = (3., 3.)

x1 = (-b1 + SQRT(b1**2 - 4*a1*c1))/(2*a1)
x2 = (-b1 -SQRT(b1**2 - 4*a1*c1))/(2*a1)

print*, "Precisión simple:"
print*, x1, "----> x1"
print*, x2, "----> x2"

! Comprobación de resultados
print*, a1*x1**2 + b1*x1 + c1, "----> Comprobación de x1"
print*, a1*x2**2 + b1*x2 + c1, "----> Comprobación de x2"

! Cálculo de las raices con precisión doble
a2 = (1.d0, 1.d0)
b2 = (2.d0, 2.d0)
c2 = (3.d0, 3.d0)

y1 = (-b2 + SQRT(b2**2 - 4*a2*c2))/(2*a2)
y2 = (-b2 -SQRT(b2**2 - 4*a2*c2))/(2*a2)

print*, "Precisión doble:"
print*, x1, "----> x1"
print*, x2, "----> x2"

! Comprobación de resultados
print*, a2*y1**2 + b2*y1 + c2, "----> Comprobación de x1"
print*, a2*y2**2 + b2*y2 + c2, "----> Comprobación de x2"

! Cálculo de las raices con precisión doble
a3 = (1.d0, 1.d0)
b3 = (2.d0, 2.d0)
c3 = (3.d0, 3.d0)

z1 = (-b3 + SQRT(b3**2 - 4*a3*c3))/(2*a3)
z2 = (-b3 -SQRT(b3**2 - 4*a3*c3))/(2*a3)

print*, "Precisión cuádruple:"
print*, x1, "----> x1"
print*, x2, "----> x2"

! Comprobación de resultados
print*, a3*z1**2 + b3*z1 + c3, "----> Comprobación de x1"
print*, a3*z2**2 + b3*z2 + c3, "----> Comprobación de x2"

end program