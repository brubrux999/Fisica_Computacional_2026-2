FC = gfortran
FFLAGS = -Wall -Wextra -std=f2008

run-clases-%:
	$(FC) clases/$*.f90 -o $* && ./$(*)

run-tareas-%:
	$(FC) tareas/$*.f90 -o $* && ./$(*)

clean:
	rm -f *.o *.mod