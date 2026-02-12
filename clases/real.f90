real  :: a
real(8)  :: b,PI
real(16) :: c,PI2
print*, "Como un string Pi=3.14159265358979328"
a=3.14159265358979328
print*, "variable a en precision sencilla ", a
b=3.14159265358979328
print*, "variable b en precision doble (aparentemente) ", b
b=3.14159265358979328d0
c=3.14159265358979328q0
print*, "variable b en double precision",b
print*, "variable c en quadruple",c
print*,dsin(b/4)
print*,sin(b/4)
print*,sin(c/4.q0)
PI=4.0d0*atan(1.0d0)
PI2=4.0q0*atan(1.0q0)
print*,PI
print*,PI2
end program
