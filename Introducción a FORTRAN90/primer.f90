integer  :: i,j,k
integer,parameter :: L=0
real     :: a,b,c
real(8)   :: x1,x2,x3
real(16)  :: x4
logical  :: ok,condition
complex  :: c1,c2
complex(16) :: c3
character(8):: mensaje

b=132*24**2+13/3+23
a=sqrt(2.0)
x1=sqrt(2.d0)
x4=sqrt(2.q0)
c3=(2.d0,2.d0)
mensaje="hola mundo!!!!!!"
c=sin(0.1)**2+cos(0.1)**2
print*,b
print*,a,"----> precision sencilla"
print*,x1,"----->","raiz de 2 en precision doble"
print*,x4,"----->","raiz de 2 en precision cuadruple"
print*, mensaje
print*, c

end program