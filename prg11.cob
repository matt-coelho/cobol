      ******************************************************************
      * Author:
      * Date:
      * Purpose: vetores
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. prg11.
       DATA DIVISION.
       FILE SECTION.
       WORKING-STORAGE SECTION.
       01 wrk-data.
           05 wrk-ano pic 9(04).
           05 wrk-mes pic 9(02).
           05 wrk-dia pic 9(02).
       01 wrk-meses.
           05 wrk-mes-ex pic x(09) OCCURS 12 times.
       PROCEDURE DIVISION.

       0050-principal section.
           PERFORM 0100-inicializar.
           perform 0150-preenche-meses.
           perform 0200-exibir.
           perform 0300-finalizar.

       0100-inicializar SECTION.
           ACCEPT wrk-data from date YYYYMMDD.

       0200-exibir SECTION.
           DISPLAY wrk-dia"/"wrk-mes-ex(wrk-mes)"/"wrk-ano.

       0150-preenche-meses section.
           move "janeiro" to wrk-mes-ex(1).
           move "fevereiro" to wrk-mes-ex(2).
           move "marco" to wrk-mes-ex(3).
           move "abril" to wrk-mes-ex(4).
           move "maio" to wrk-mes-ex(5).
           move "junho" to wrk-mes-ex(6).
           move "julho" to wrk-mes-ex(7).
           move "agosto" to wrk-mes-ex(8).
           move "setembro" to wrk-mes-ex(9).
           move "outubro" to wrk-mes-ex(10).
           move "novembro" to wrk-mes-ex(11).
           move "dezembro" to wrk-mes-ex(12).

       0300-finalizar SECTION.
           STOP RUN.
       END PROGRAM prg11.
