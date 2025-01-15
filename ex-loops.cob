      ******************************************************************
      * Author:
      * Date:
      * Purpose: comandos repeticao - perform
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. ex-loops.
       DATA DIVISION.
       FILE SECTION.
       WORKING-STORAGE SECTION.
       77 wrk-produto     pic x(15) value SPACES.
       77 wrk-valor       pic 9(04) value zeros.
       77 wrk-vlacm       pic 9(06) value zeros.
       77 wrk-qtdprodutos pic 9(06) value zeros.

       PROCEDURE DIVISION.

       0050-principal section.
           PERFORM 0100-processar.
           perform 0200-exibir.
           perform 0300-finalizar.

       0100-processar SECTION.
           PERFORM until wrk-valor EQUAL 9999
               DISPLAY "digite o nome do produto"
                   ACCEPT wrk-produto
               DISPLAY "digite o valor do produto (9999 para finalizar)"
                   ACCEPT wrk-valor

               if wrk-valor not EQUAL 9999
                   add 1 to wrk-qtdprodutos
                   compute wrk-vlacm = wrk-vlacm + wrk-valor
               END-IF
           END-PERFORM.

       0200-exibir SECTION.
           DISPLAY "valor total="wrk-vlacm.
           DISPLAY "quantidade de produtos: "wrk-qtdprodutos.

       0300-finalizar SECTION.
           STOP RUN.
       END PROGRAM ex-loops.
