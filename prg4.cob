      ******************************************************************
      * Author:
      * Date:
      * Purpose: operadores
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. prg4.
       DATA DIVISION.

       FILE SECTION.

       WORKING-STORAGE SECTION.
       77 wrk-001 pic 9(03)v9(1) value ZERO.
       77 wrk-002 pic 9(03)v9(1) value zero.
       77 wrk-resultado-soma pic s9(04) value zero.
       77 wrk-resultado-subtracao pic s9(04) value zero.
       77 wrk-resultado-multiply pic s9(06) value zero.
       77 wrk-resultado-divide pic s9(06)v99 value zero.
       77 wrk-resultado-compute pic s9(06)v99 value zero.

       PROCEDURE DIVISION.
       0100-recebe SECTION.
           DISPLAY "digite numero 1"
               ACCEPT wrk-001.
           DISPLAY "digite numero 2"
               ACCEPT wrk-002.

       0150-processa SECTION.
      *add preserva a variavel resultado
           ADD wrk-001 wrk-002 to wrk-resultado-soma.

      *giving zera a variavel resultado
           ADD wrk-001 wrk-002 GIVING wrk-resultado-soma.

      *subtract utiliza from, subtract from, subtrai do segundo valor
           SUBTRACT wrk-001 from wrk-002 wrk-resultado-subtracao.

      *multiply utiliza by e giving
           MULTIPLY wrk-001 by wrk-002 giving wrk-resultado-multiply.

      *divide o primeiro pelo segundo
           DIVIDE wrk-001 by wrk-002 GIVING wrk-resultado-divide
               ON SIZE ERROR
               DISPLAY "Divisao por zero".

      *compute
           compute wrk-resultado-compute = (wrk-001 + wrk-002)
                   - (wrk-001 * wrk-002) / (wrk-001 * wrk-002).

       0200-exibe SECTION.
           DISPLAY "resultado soma "wrk-resultado-soma.
           DISPLAY "resultado subtracao "wrk-resultado-subtracao.
           DISPLAY "resultado multiplicacao "wrk-resultado-multiply.
           DISPLAY "resultado divisao "wrk-resultado-divide.
           DISPLAY "resultado expressao "wrk-resultado-compute.

       0300-finaliza SECTION.
            STOP RUN.
       END PROGRAM prg4.
