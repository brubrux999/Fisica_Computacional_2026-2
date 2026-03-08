! Utiliza el algoritmo Xoshiro128** , xoshiro256** , etc
! se caracteriza por su velocidad
! 
integer    :: n,i
real       :: r
real       :: a(3,3) 

n=10
Do i=1,5            ! en el do pueden ir variables
   r= rand(0)       ! funcion intriseca para gnerar numeros aleatorios entre 1,0
   print *, 'a la fortran 77' , r
   call RANDOM_NUMBER(r) ! subrutina intriseca para generar numeros aleatorios 1,0, mucho mas sofisticado
   print *, ' con subrutina intrinseca' , r
end do
call RANDOM_NUMBER(a)
print*, a(1,1)
print*, a(2,2)
print*, a(3,3)
print*, a
end program

   
