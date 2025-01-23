      ******************************************************************
      * Author:
      * Date:
      * Purpose: projeto - sistema de clientes com menu, cadastro,
      * arquivo indexado
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. projeto-clientes.
       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
               SELECT clientes ASSIGN to "./clientes_projeto.dat"
           ORGANIZATION is INDEXED
           ACCESS MODE is RANDOM
           FILE STATUS is clientes-status
           RECORD KEY is cliente-chave.

           SELECT relatorio ASSIGN to "./relatorio-clientes.txt"
           ORGANIZATION is SEQUENTIAL.

       DATA DIVISION.
       FILE SECTION.
       FD clientes.
       01 cliente-reg.
           05 cliente-chave.
               10 cliente-fone pic x(09).
           05 cliente-nome     pic x(30).
           05 cliente-email    pic x(40).

       FD relatorio.
          01 relatorio-reg.
              05 relatorio-dados pic x(79).

       WORKING-STORAGE SECTION.
       77 wrk-modulo      pic x(20) value SPACE.
       77 wrk-msgerro     pic x(20) value SPACE.
       77 wrk-opcao       pic x(01) value SPACE.
       77 wrk-tecla       pic x(01) value SPACE.
       77 clientes-status pic 9(02) value ZERO.
       77 wrk-contalinha  pic 9(03) value 0.
       77 wrk-currline    pic 9(09) value 7.
       77 wrk-tracejado   pic x(80) value
       "--------------------------------------------------------------".
       77 wrk-relatorio   pic x(80) value
       "-------------------------relatorio----------------------------".

       SCREEN SECTION.
       01 tela.
           05 limpa-tela.
              10 BLANK SCREEN.
              10 line 01 COLUMN 01 pic x(20) ERASE EOL
                   BACKGROUND-COLOR 2.
              10 line 01 column 15 pic x(20) from "sistema de clientes"
                   FOREGROUND-COLOR 4
                   BACKGROUND-COLOR 2.
              10 line 02 COLUMN 01 pic x(20) ERASE EOL
                   BACKGROUND-COLOR 1 from wrk-modulo.

       01 menu.
           05 line 07 column 15 value "1 - incluir".
           05 line 08 column 15 value "2 - consultar".
           05 line 09 column 15 value "3 - alterar".
           05 line 10 column 15 value "4 - excluir".
           05 line 11 column 15 value "5 - relatorio em tela".
           05 line 12 column 15 value "6 - relatorio em disco".
           05 line 13 column 15 value "X - sair".
           05 line 14 column 15 value "opcao...".
           05 line 14 column 23 using wrk-opcao.

       01 tela-registro.
           05 chave FOREGROUND-COLOR 2.
               10 line 10 COLUMN 10 value "telefone.".
               10 COLUMN PLUS 2 pic 9(09) using cliente-fone
                   BLANK when ZEROS.
           05 ss-dados.
               10 line 11 column 10 value "nome.....".
               10 column plus 2 pic x(30) using cliente-nome.
               10 line 12 column 10 value "email....".
               10 column plus 2 pic x(40) using cliente-email.

           01 tela-erro.
               02 msg-erro.
                   10 line 16  column 10 pic x(20)
                       BACKGROUND-COLOR 3 FROM wrk-msgerro.
                   10 column PLUS 2 pic x(01)
                       BACKGROUND-COLOR 3 USING wrk-tecla.

       PROCEDURE DIVISION.

       0050-principal SECTION.
           PERFORM 0052-abrir-arquivo.
           PERFORM 0100-menu.
           PERFORM 0105-processar until wrk-opcao EQUAL "x"
                                     OR wrk-opcao EQUAL "X".
           PERFORM 0300-finalizar.

       0051-inclusao SECTION.
           MOVE "inclusao" to wrk-modulo.
           DISPLAY tela.
           ACCEPT tela-registro.
           WRITE cliente-reg
               INVALID KEY
                   MOVE 'registro ja existe' to wrk-msgerro
                   ACCEPT tela-erro
           END-WRITE.

       0052-abrir-arquivo SECTION.
           OPEN I-O clientes
           IF clientes-status EQUAL 35
               OPEN OUTPUT clientes
               CLOSE clientes
               OPEN I-O clientes
           END-IF.

       0053-consultar SECTION.
           MOVE "consultar" to wrk-modulo.
           DISPLAY tela.
           DISPLAY tela-registro.
           ACCEPT chave.
           READ clientes
               INVALID KEY
                   MOVE "nao encontrado" to wrk-msgerro

               NOT INVALID KEY
                   DISPLAY ss-dados
           END-READ.

           ACCEPT tela-erro.

       0054-excluir SECTION.
           MOVE "excluir" to wrk-modulo.
           DISPLAY tela.
           DISPLAY tela-registro.
           ACCEPT chave.
           READ clientes
               INVALID KEY
                   MOVE "nao encontrado" to wrk-msgerro
               NOT INVALID KEY
                   MOVE "remover? (s/n)" to wrk-msgerro
                   DISPLAY ss-dados
           END-READ.

           ACCEPT tela-erro.
           IF (wrk-tecla = 'S' OR wrk-tecla = 's')
               AND clientes-status = 0
               DELETE clientes
                   INVALID KEY
                       MOVE "nao excluido" to wrk-msgerro
                       ACCEPT tela-erro
               END-DELETE
           END-IF.

       0055-alterar SECTION.
           MOVE "alterar" to wrk-modulo.
           DISPLAY tela.
           DISPLAY tela-registro.
           ACCEPT chave.
           READ clientes
               IF clientes-status EQUAL 0
                   ACCEPT ss-dados
                   REWRITE cliente-reg
                   IF clientes-status = 0
                       MOVE "registro alterado" to wrk-msgerro
                   ELSE
                       MOVE "ocorreu um erro" to wrk-msgerro
                   END-IF
               ELSE
                   MOVE "nao encontrado" to wrk-msgerro
               END-IF
               ACCEPT msg-erro.

       0056-salva SECTION.
           DISPLAY tela.

           READ clientes
                OPEN OUTPUT relatorio
                   PERFORM UNTIL clientes-status = 10
                       MOVE wrk-contalinha to wrk-msgerro
                       MOVE " exportados" to wrk-msgerro(4:17)

                       MOVE cliente-reg to relatorio-reg
                       WRITE relatorio-reg

                       ADD 1 to wrk-contalinha
                       READ clientes NEXT

                   END-PERFORM.
      *        END-READ.
           CLOSE relatorio.

           ACCEPT tela-erro.

       0100-menu SECTION.
           MOVE SPACES to wrk-msgerro cliente-nome
                          cliente-chave cliente-email
                          wrk-tecla wrk-opcao.
           MOVE ZERO to wrk-contalinha.
           DISPLAY tela.
           ACCEPT menu.

       0105-processar SECTION.
           EVALUATE wrk-opcao
           WHEN 1
               PERFORM 0051-inclusao
               PERFORM 0100-menu

           WHEN 2
               PERFORM 0053-consultar
               PERFORM 0100-menu

           WHEN 3
               MOVE "alterar" to wrk-modulo
               PERFORM 0055-alterar
               PERFORM 0100-menu

           WHEN 4
               PERFORM 0054-excluir
               PERFORM 0100-menu

           WHEN 5
               MOVE "relatorio em tela" to wrk-modulo
               PERFORM 0200-exibir
               PERFORM 0100-menu

           WHEN 6
               MOVE "relatorio em disco" to wrk-modulo
               PERFORM 0056-salva
               PERFORM 0100-menu

           WHEN OTHER
               IF wrk-opcao NOT EQUAL "x"
                   DISPLAY "opcao desconhecida"
               END-IF

           END-EVALUATE.

       0200-exibir SECTION.
           DISPLAY tela.
           DISPLAY wrk-relatorio at line 5 column 30
           DISPLAY wrk-tracejado at line 6 column 30
      *     START clientes
      *     KEY EQUAL 12345
           READ clientes
      *         INVALID KEY
      *             MOVE "nao encontrado" to wrk-msgerro
      *         NOT INVALID KEY

                   PERFORM UNTIL clientes-status = 10
                       DISPLAY cliente-fone at line wrk-currline
                                                           column 10
                       DISPLAY cliente-nome at line wrk-currline
                                                           column 20
                       DISPLAY cliente-email at line wrk-currline
                                                           column 50

                       READ clientes NEXT
                       ADD 1 to wrk-currline
                       ADD 1 to wrk-contalinha
                       IF wrk-contalinha EQUAL 5
                           MOVE 7 to wrk-currline
                           MOVE "pressione uma tecla" to wrk-msgerro
                           ACCEPT msg-erro
                           DISPLAY tela
                           DISPLAY wrk-relatorio at line 5
                                                              column 30
                           DISPLAY wrk-tracejado at line 6
                                                              column 30
                       END-IF
                   END-PERFORM.
      *     END-READ.
           ACCEPT tela-erro.

       0300-finalizar SECTION.
           CLOSE clientes.
           STOP RUN.

       END PROGRAM projeto-clientes.
