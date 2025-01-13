      ******************************************************************
      * Author:
      * Date:
      * Purpose: comandos repeticao - perform
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. prg7.
       DATA DIVISION.
       FILE SECTION.
       WORKING-STORAGE SECTION.
       77 wrk-entrada pic x(08) value SPACES.

       PROCEDURE DIVISION.
      *perform executa uma section e retorna, ainda permite exec. X times
       0050-principal section.
           PERFORM 0100-inicializar.
           perform 0105-processar.
           perform 0200-exibir 2 times.
           perform 0300-finalizar.

       0100-inicializar SECTION.
           DISPLAY "inicializar".

       0105-processar SECTION.
           DISPLAY "processar".

       0200-exibir SECTION.
           DISPLAY "exibir".

       0300-finalizar SECTION.
           DISPLAY "finalizar"
           STOP RUN.
       END PROGRAM prg7.
