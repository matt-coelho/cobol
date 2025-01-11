      ******************************************************************
      * Author:
      * Date:
      * Purpose:
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. teste.
       DATA DIVISION.
       FILE SECTION.
       WORKING-STORAGE SECTION.
       77 wrk-entrada pic x(08) value SPACES.

       PROCEDURE DIVISION.
       0100-recebe SECTION.
           DISPLAY "Entre a linha de dados"
               ACCEPT wrk-entrada.

       0200-exibe SECTION.
           DISPLAY "hello world "wrk-entrada.


       0300-finaliza SECTION.
            STOP RUN.
       END PROGRAM teste.
