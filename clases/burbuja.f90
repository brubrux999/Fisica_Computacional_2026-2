PROGRAM BURBUJA
!
! un metodo burbuja más inteligente
!
! otra forma de delarar un arreglo , el que te acomode mejor
!
       INTEGER,DIMENSION(10)     :: N
       INTEGER                   :: I, J, AUX
!
!lee los datos , no hay formato y no hay letrero a veces esto es mejor
       DO I=1, 10
           READ(*,*) N(I)
       ENDDO
! cuantos quedan por ordenar, es la clave
!
       DO I=9, 1, -1
          DO J=1, I
           IF (N(J).GT.N(J+1)) THEN
           AUX=N(J)
           N(J)=N(J+1)
           N(J+1)=AUX
           END IF
          ENDDO
       ENDDO
       DO I=1, 10
        WRITE(*,*) N(I)
       ENDDO

END PROGRAM BURBUJA
