      ******************************************************************
      * Author:
      * Date:
      * Purpose: receber dados, realizar calculo considerando valor com sinal,
      * mascara e mover valor entre variaveis
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. prg2.
       ENVIRONMENT DIVISION.

       DATA DIVISION.
       FILE SECTION.
       WORKING-STORAGE SECTION.
       77 wrk-val1             pic 9(05) value ZERO.
       77 wrk-val2             pic 9(05) value ZERO.
       77 wrk-resultado        pic S9(07)v99 value ZERO.
       77 wrk-resultado-ed     pic -ZZ,ZZ9,99 value zero.
       PROCEDURE DIVISION.
       MAIN-PROCEDURE.

           DISPLAY "digite o primeiro valor"
               ACCEPT wrk-val1.
           DISPLAY "digite o segundo valor"
               ACCEPT wrk-val2.

           compute wrk-resultado = wrk-val1 + wrk-val2.
           MULTIPLY 100 by wrk-resultado.
           MOVE wrk-resultado to wrk-resultado-ed.
           DISPLAY "soma dos valores " wrk-resultado-ed.

           compute wrk-resultado = wrk-val1 - wrk-val2.
           MULTIPLY 100 by wrk-resultado.
           MOVE wrk-resultado to wrk-resultado-ed.
           DISPLAY "subtracao dos valores " wrk-resultado-ed.

           compute wrk-resultado = wrk-val1 * wrk-val2.
           MULTIPLY 100 by wrk-resultado.
           MOVE wrk-resultado to wrk-resultado-ed.
           DISPLAY "multiplicacao dos valores " wrk-resultado-ed.

           compute wrk-resultado = wrk-val1 / wrk-val2.
      *    //o valor deve ser multiplicado pela forma como o cobol interpreta
      *    e formata as diferentes variaveis
           MULTIPLY 100 by wrk-resultado.
           MOVE wrk-resultado to wrk-resultado-ed.
           DISPLAY "divisao dos valores " wrk-resultado-ed.

           STOP RUN.
       END PROGRAM prg2.
