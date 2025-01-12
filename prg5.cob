      ******************************************************************
      * Author:
      * Date:
      * Purpose: tomada decisao com if
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. prg5.
       DATA DIVISION.
       FILE SECTION.
       WORKING-STORAGE SECTION.
       77 wrk-nota1 pic 9(02)v99 value zero.
       77 wrk-nota2 pic 9(02)v99 value zero.
       77 wrk-media pic 9(02)v99 value zero.

       PROCEDURE DIVISION.
       0100-recebe SECTION.
           DISPLAY "Entre a nota 1"
               ACCEPT wrk-nota1.
           DISPLAY "Entre a nota 2"
               ACCEPT wrk-nota2.

       0150-processa SECTION.
           compute wrk-media = (wrk-nota1 + wrk-nota2)/2.

      *os operadores de comparacao podem ser [greater, less, equal]
           if wrk-media GREATER 7
               DISPLAY "aprovado"
           else
               if wrk-media > 4
                   DISPLAY "recuperacao"
               else
                   DISPLAY "reprovado"
               end-if
           END-IF.

       0200-exibe SECTION.
           DISPLAY "o valor da media foi "wrk-media.

       0300-finaliza SECTION.
            STOP RUN.
       END PROGRAM prg5.
