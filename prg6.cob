      ******************************************************************
      * Author:
      * Date:
      * Purpose: comando decisao evaluate(case)
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. prg6.
       DATA DIVISION.
       FILE SECTION.
       WORKING-STORAGE SECTION.
       77 wrk-produto pic x(10) value SPACES.
       77 wrk-estado pic x(02) value SPACES.
       77 wrk-valor pic 9(08)v99 value ZERO.
       77 wrk-frete pic 9(08)v99 value ZERO.

       PROCEDURE DIVISION.
       0100-recebe SECTION.
           DISPLAY "Entre o nome do produto"
               ACCEPT wrk-produto.
           DISPLAY "Entre o estado 'SP', 'ES, 'RJ'"
               ACCEPT wrk-estado.
           DISPLAY "Entre o valor do produto"
               ACCEPT wrk-valor.

       0150-processa section.

           EVALUATE wrk-estado
               WHEN "SP"
               compute wrk-frete = wrk-valor * 0.10

               when "ES"
               compute wrk-frete = wrk-valor * 0.15

               when "RJ"
               compute wrk-frete = wrk-valor * 0.20

               when OTHER
               DISPLAY "nao � possivel calcular o frete"

           END-EVALUATE.


       0200-exibe SECTION.
           if wrk-frete GREATER ZERO
               DISPLAY "o valor do frete para o produto "wrk-produto
               " � "wrk-frete " mais o valor do produto "wrk-valor
               " para o estado "wrk-estado
           end-if.


       0300-finaliza SECTION.
            STOP RUN.
       END PROGRAM prg6.
