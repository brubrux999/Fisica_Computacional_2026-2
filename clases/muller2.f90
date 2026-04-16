!-----------------------------------------------------------------
! Este programa utiliza el metodo de Muller para encontrar
! las raices de f(R)=EXP(R)*LOG(R) - R*R
! ----------------------------------------------------------------
      PROGRAM Muller_raiz
      implicit none
      real*8 DL
      complex*16,dimension(3) :: d,fd
!      d=(1,2,0)
      d(1)= (0,0)

      d(2)= (5.4,0)
      d(3)= (10.4,0)
      DL = 1.0E-06 ! Un numero pequeno que da la condicion
                   ! condicion de paro del metodo de Muller
      call Muller1(.TRUE.,d,3,0,500,DL,DL) !Tomar todas las aproximaciones
                                           !como reales, encontrar una raiz,
                                           !ninguna raiz conocida,
                                           !iterar hasta 500 veces
      print*,'La raiz es p0=', real(d)     !Imprimir la parte real
      call FN1(d(1),fd(1))                       !de los
      print*,'f(p0) = ', real(fd)          !resultados
      END

      SUBROUTINE FN1(R, FR)
        complex*16 R,FR
         FR= R*tan(R)-(15**2-R**2)**0.5           !La funcion a evaluar
	END


!********************************************************************
         SUBROUTINE MULLER1(FNREAL, zeros, N,NPREV, MAXIT, EP1, EP2)
!       DETERMINA LOS N CEROS DE LA FUNCION ESPECIFICADA POR FN1 USANDO EL
!       METODO DE MULLER, (Interpolacion CUADRATICA)


        LOGICAL FNREAL
        INTEGER MAXIT,N,NPREV, KOUNT
        REAL*8 EP1,EP2,  EPS1,EPS2

        COMPLEX*16  ZEROS(N),C,DEN,DIVDF1,DIVDF2,DVDF1P,FZR,FZRDFL,&
              FZRPRV,H,ZERO,SQR
!********************************************************************
!
!                         Input
!
!********************************************************************
!    FN1  ES EL NOMBRE DE LA SUBRUTINA DE LA FORMA FN1(Z, FZ) PARA
!         LA CUAL DADA Z, REGRESA F(Z). ESTA DEBERA APRECER COMO UNA SUBRUTINA EXTERNA
!    FNREAL ES UNA VARIABLE LOGICA. SI ES .TRUE., TODAS LAS APROXIMACIONES SON TOMADAS
!           COMO REALES. PERMITIENDO QUE ESTA SUBRUTINA SEA USADA INCLUSO SI F(Z) ES
!           SOLO DEFINIDA COMO REAL

!    ZEROS(1),...,ZEROS(NPREV) CONTIENE LOS CEROS ENCONTRADOS PREVIAMENTE (IF NPREV .GT. 0)
!    ZEROS(NPREV+1),..,ZEROS(N) CONTIENE LAS PRIMERAS APROXIMACIONES A LOS CEROS A SER ENCONTRADOS
!    EP1  LA ITERACION ES DETENIDA SI: IF ABS(H) .LT. EP1*ABS(ZR)
!    EP2  SI EL CRITERIO ANTERIOR NO SE ENCUENTRA, LA ITERACION ES DETENIDA SI:
!         ABS(F(ZERO) .LT. EP2
!    N TOTAL DE CEROS A SER ENCONTRADOS
!**********************************************************************
!
!                        Output
!
!**********************************************************************
!    ZEROS(NPREV+1),...,ZEROS(N) APROXIMACION A LOS CEROS
!
!
!***********************************************************************
!                        INICIALIZACION
!***********************************************************************
         EPS1 = MAX(EP1, 1.d-12)
         EPS2 = MAX(EP2, 1.d-20)

         DO 100 I=NPREV+1,N
            KOUNT=0
!        CALCULA LAS PRIMEROS TRES PUNTOS PARA CONTRUIR LA PARABOLA
!         ZEROS(I)+.5, ZEROS(I)-.5, ZEROS(I)
 1         ZERO=ZEROS(I)
            H=.5
            CALL DFLATE1(ZERO+.5, I, KOUNT, FZR, DVDF1P, ZEROS, *1)
            CALL DFLATE1(ZERO-.5, I, KOUNT, FZR, FZRPRV, ZEROS, *1)
            HPREV =-1
            DVDF1P = (FZRPRV - DVDF1P)/HPREV
            CALL DFLATE1(ZERO, I, KOUNT, FZR, FZRDFL, ZEROS , *1)
! DO WHILE KOUNT.LE.MAXIT OR H IS RELATIVELY BIG
!          OR FZR =F(ZERO) IS NOT SMALL
!          OR FZRDL = FDELATED(ZERO) IS NOT SMALL OR NOT MUCH
!          BIGGER THAN ITS PREVIOUS VALUE FZRPRV
  40        DIVDF1=(FZRDFL-FZRPRV)/H
            DIVDF2=(DIVDF1-DVDF1P)/(H+HPREV)
            HPREV=H
            DVDF1P=DIVDF1
            C = DIVDF1 + H*DIVDF2
            SQR = C*C-4.d0*FZRDFL*DIVDF2
            IF (FNREAL .AND. REAL(SQR) .LT. 0.d0) SQR=0.
            SQR = SQRT(SQR)
            IF (REAL(C)*REAL(SQR)+AIMAG(C)*AIMAG(SQR) .LT. 0.d0) THEN
                DEN = C - SQR
            ELSE
                DEN = C + SQR
            END IF
            IF (ABS(DEN) .LE. 0.d0) DEN = 1
            H= -2.d0*FZRDFL/DEN
            FZRPRV=FZRDFL
            ZERO = ZERO + H
            IF (KOUNT .GT. MAXIT)    GOTO 99

  70        CALL DFLATE1( ZERO, I, KOUNT, FZR, FZRDFL, ZEROS, *1)

            IF (ABS(H) .LT. EPS1*ABS(ZERO)) GOTO 99
            IF (MAX(ABS(FZR),ABS(FZRDFL)) .LT. EPS2) GOTO 99

            IF (ABS(FZRDFL) .GE. 10.d0*ABS(FZRPRV)) THEN
               H = H/2.d0
               ZERO = ZERO - H
           GOTO 70
           ELSE
           GOTO 40
           END IF
  99        ZEROS(I)=ZERO

 100      CONTINUE

         RETURN
      END



       SUBROUTINE DFLATE1(ZERO,I,KOUNT,FZERO,FZRDFL,ZEROS,* )
!     A SER LLAMADA POR MULLER

         INTEGER I,KOUNT,J
         COMPLEX*16 FZERO,FZRDFL,ZERO,ZEROS(I), DEN

          KOUNT = KOUNT + 1
         CALL FN1(ZERO, FZERO)

         FZRDFL = FZERO
         IF (I .LT. 2)                               RETURN
         DO 10 J=2,I
            DEN = ZERO - ZEROS(J-1)
            IF (ABS(DEN) .EQ. 0.) THEN
                ZEROS(I) = ZERO*1.001
                                                     RETURN 1
            ELSE
                 FZRDFL=FZRDFL/DEN
            END IF
  10    CONTINUE
                                                      RETURN
         END
!*************************************************************************
!
!                         FIN de la subrutina Muller
!
!*************************************************************************
