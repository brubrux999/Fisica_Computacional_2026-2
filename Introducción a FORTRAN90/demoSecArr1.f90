PROGRAM demo_sections_1

  INTEGER, DIMENSION(1:5) ::                 &
                          array = (/ 11, 22, 33, 44, 55 /)

  PRINT "(3I5)", array(2:4)   !Imprime un triplete paso default

  PRINT "(3I5)", array(3:)    !Impresion superior por default

  PRINT "(3I5)", array(:3)    !Impresion inferior por default

  PRINT "(3I5)", array(1:5:2) !No default

  PRINT "(3I5)", array((/ 2, 4, 5 /)) !Impresion de vector

  print*, array(2:)

END PROGRAM DEMO_SECTIONS_1
