      ******************************************************************
      * Author:
      * Date:
      * Purpose: variavel estrutural
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. prg3.
       DATA DIVISION.
       FILE SECTION.
       WORKING-STORAGE SECTION.
       77 wrk-data pic x(08) value SPACES.
       01 wrk-data2.
           02 wrk-ano pic x(04) value spaces.
           02 wrk-mes pic x(02) value spaces.
           02 wrk-dia pic x(02) value spaces.
       01 wrk-entrada.
           02 wrk-codigo pic 9(04) value ZEROS.
           02 wrk-nome pic x(15) value SPACE.
           02 wrk-sal pic 9(06) VALUE ZERO.

       PROCEDURE DIVISION.
       0100-recebe SECTION.
           ACCEPT wrk-data from DATE YYYYMMDD.
           ACCEPT wrk-data2 from DATE YYYYMMDD.
           DISPLAY "Entre a linha de dados"
               ACCEPT wrk-entrada.

       0200-exibe SECTION.
           DISPLAY "data inteira "wrk-data.
           DISPLAY "dia " wrk-data(07:02) " mes " wrk-data(05:02)
           " ano "wrk-data(01:04).

           DISPLAY wrk-dia"/"wrk-mes"/"wrk-ano.

           DISPLAY "codigo.."wrk-codigo.
           DISPLAY "nome...."wrk-nome.
           DISPLAY "salario."wrk-sal.

       0300-finaliza SECTION.
            STOP RUN.
       END PROGRAM prg3.
