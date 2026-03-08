PROGRAM demo_where

  INTEGER, DIMENSION(5)    :: a
  INTEGER, DIMENSION(-1:3) :: b


  a(1)  = 2;  a(2) = -4;  a(3) = 6; a(4) = -8;  a(5) = 10
  b(-1) = 1;  b(0) =  2;  b(1) = 3; b(2) =  4;  b(3) =  5


  WHERE (a < 0) b = 0   !El comando WHERE


  print "(5I4)", b

  WHERE (b /= 0)        !El constructor WHERE
     a = a / b
  ELSEWHERE
     a = 0
  END WHERE
     PRINT "(5I4)",a

END PROGRAM demo_where
