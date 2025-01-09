      ******************************************************************
      * Author:
      * Date:
      * Purpose:
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. YOUR-PROGRAM-NAME.
       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
      *para usar virgula ao inves de ponto em casa decimal
           SPECIAL-NAMES.
           DECIMAL-POINT is COMMA.
       DATA DIVISION.
       FILE SECTION.
       WORKING-STORAGE SECTION.
       77 wrk-nome pic x(30) value SPACE.
       77 wrk-salario pic 9(08)V99 value ZERO.

       PROCEDURE DIVISION.
       MAIN-PROCEDURE.
           DISPLAY "digite seu nome"
               ACCEPT wrk-nome.
           DISPLAY "nome digitado " wrk-nome.
           DISPLAY "digite seu salario ".
               ACCEPT wrk-salario.
           DISPLAY "salario digitado " wrk-salario.

           STOP RUN.
       END PROGRAM YOUR-PROGRAM-NAME.
