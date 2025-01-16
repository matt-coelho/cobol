      ******************************************************************
      * Author:
      * Date:
      * Purpose: vetores e comando REDEFINES
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. prg15.
       DATA DIVISION.
       FILE SECTION.
       WORKING-STORAGE SECTION.
       01 wrk-data.
           05 wrk-ano pic 9(04).
           05 wrk-mes pic 9(02).
           05 wrk-dia pic 9(02).

       01 wrk-tab-meses.
           05 filler pic x(009) value 'janeiro'.
           05 filler pic x(009) value 'fevereiro'.
           05 filler pic x(009) value 'marco'.
           05 filler pic x(009) value 'abril'.
           05 filler pic x(009) value 'maio'.
           05 filler pic x(009) value 'junho'.
           05 filler pic x(009) value 'julho'.
           05 filler pic x(009) value 'agosto'.
           05 filler pic x(009) value 'setembro'.
           05 filler pic x(009) value 'outubro'.
           05 filler pic x(009) value 'novembro'.
           05 filler pic x(009) value 'dezembro'.

       01 wrk-meses redefines wrk-tab-meses OCCURS 12 times.
           05 wrk-mes-ex pic x(09).

       PROCEDURE DIVISION.

       0050-principal section.
           PERFORM 0100-inicializar.
           perform 0200-exibir.
           perform 0300-finalizar.

       0100-inicializar SECTION.
           ACCEPT wrk-data from date YYYYMMDD.

       0200-exibir SECTION.
           DISPLAY wrk-dia"/"wrk-mes-ex(wrk-mes)"/"wrk-ano.

       0300-finalizar SECTION.
           STOP RUN.
       END PROGRAM prg15.
