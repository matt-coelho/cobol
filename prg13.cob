      ******************************************************************
      * Author:
      * Date:
      * Purpose: solicita dados a programa prg12
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. prg13.
       DATA DIVISION.
       FILE SECTION.
       WORKING-STORAGE SECTION.
       77 wrk-data pic x(30) value SPACES.

       PROCEDURE DIVISION.

       0050-principal section.
           PERFORM 0100-inicializar.

           perform 0200-exibir.
           perform 0300-finalizar.

       0100-inicializar SECTION.
      * o nome a ser chamado é o program-id do modulo chamado
           call "prg12" using wrk-data.

       0200-exibir SECTION.
           DISPLAY "data obtida "wrk-data.

       0300-finalizar SECTION.

           STOP RUN.
       END PROGRAM prg13.
