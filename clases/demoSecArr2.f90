PROGRAM demo_sections_2

  INTEGER, DIMENSION(1:5) ::              &
       ARRAY = (/ 11, 22, 33, 44, 55 /)

  INTEGER :: i, j, k
  INTEGER, DIMENSION(3) :: vector_subscript

  i= 2; j=4
  PRINT "(3I5)", array(i:j)

  j = 3
  PRINT "(3I5)", array(j:)
  PRINT "(3I5)", array(:j)

  i =1;  j = 5;  k = 2
  PRINT "(3I5)", array(i:j:k)

  vector_subscript(1) = 2
  vector_subscript(2) = 4
  vector_subscript(3) = 5
  PRINT "(3I5)", array(vector_subscript)

END PROGRAM demo_sections_2
