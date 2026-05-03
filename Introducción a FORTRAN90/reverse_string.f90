PROGRAM test_reverse_string

CHARACTER(5)   :: string_1 = "ABCDE"
CHARACTER(6)   :: string_2 = "123456"
CALL reverse_string (string_1)
CALL reverse_string (string_2)
PRINT "(1X, A, 2X, A)", string_1,string_2

END PROGRAM test_reverse_string


RECURSIVE SUBROUTINE reverse_string(char_string)
  CHARACTER(*), INTENT (in out) :: char_string
  INTEGER                       :: str_len

str_len= LEN(char_string)
IF (str_len > 1)  THEN
    CALL swap(char_string(1:1),char_string(str_len:str_len)) ! Subrutina llama a otra subrutina
    !La Subrutina se llama asi misma...
    CALL reverse_string(char_string(2:str_len-1))
END IF

END SUBROUTINE reverse_string

SUBROUTINE swap(char_1,char_2)
 CHARACTER(1), INTENT(in out)  :: char_1,char_2
 CHARACTER(1)                  :: temp
 
 temp = char_1
char_1 = char_2
char_2 = temp

END SUBROUTINE swap
