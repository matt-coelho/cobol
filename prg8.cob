      ******************************************************************
      * Author:
      * Date:
      * Purpose: comandos repeticao - perform times
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. prg8.
       DATA DIVISION.
       FILE SECTION.
       WORKING-STORAGE SECTION.
       77 wrk-entrada pic x(08) value SPACES.
       77 wrk-numero pic 9(02) value ZERO.
       77 wrk-resultado pic 9(03) value zero.
       77 wrk-contador pic 9(02) value 1.

       PROCEDURE DIVISION.

       0050-principal section.
           PERFORM 0100-inicializar.
           perform 0105-processar.
      *     perform 0200-exibir.
           perform 0300-finalizar.

       0100-inicializar SECTION.
           DISPLAY "numero de vezes"
               ACCEPT wrk-numero.

       0105-processar SECTION.
           PERFORM wrk-numero TIMES
               compute wrk-resultado = wrk-numero * wrk-contador
               perform 0200-exibir
               add 1 to wrk-contador
           END-PERFORM.

       0200-exibir SECTION.
           DISPLAY wrk-numero" X "wrk-contador " = "wrk-resultado.

       0300-finalizar SECTION.
           DISPLAY "fim"
           STOP RUN.
       END PROGRAM prg8.
