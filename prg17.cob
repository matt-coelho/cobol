      ******************************************************************
      * Author:
      * Date:
      * Purpose: arquivo de dados - gravacao
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. prg17.
       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
       INPUT-OUTPUT SECTION.

       FILE-CONTROL.
       SELECT CLIENTES ASSIGN TO ".\clientesg.dat"
               FILE STATUS IS FS-CLIENTES.
       DATA DIVISION.
       FILE SECTION.
           FD CLIENTES.
               01 REG-CLIENTES.
                   02 REG-ID PIC 9(04).
                   02 REG-NOME PIC X(20).
                   02 REG-TEL PIC X(11).
       WORKING-STORAGE SECTION.
       77 fs-clientes pic 9(02) value ZERO.
       77 msg-erro pic x(30) VALUE SPACE.

       77 wrk-id pic 9(04) value ZERO.
       77 wrk-nome pic x(20) VALUE SPACE.
       77 wrk-tel pic x(11) VALUE SPACE.

       PROCEDURE DIVISION.

       0050-principal section.
           PERFORM 0100-inicializar.
           perform 0110-gravar.
           perform 0300-finalizar.
           STOP RUN.

       0100-inicializar SECTION.
           open output CLIENTES.
               evaluate fs-clientes
               when 00
                   display "arquivo aberto com sucesso"
                   perform 0105-pedir-dados
               when 35
                   move "arquivo nao encontrado" to msg-erro
                   perform 0900-trata-erro
               when 37
                   move "arquivo incompativel" to msg-erro
                   perform 0900-trata-erro
               END-EVALUATE.

       0105-pedir-dados SECTION.
           DISPLAY "digite o id"
               ACCEPT wrk-id.
           DISPLAY "digite o nome"
               ACCEPT wrk-nome.
           DISPLAY "digite o telefone"
               ACCEPT wrk-tel.

       0110-gravar section.
           move wrk-id to REG-ID.
           move wrk-nome to REG-NOME.
           move wrk-tel to REG-TEL.
           write REG-CLIENTES.

       0300-finalizar SECTION.
           DISPLAY "finalizar".
           CLOSE CLIENTES.

       0900-trata-erro SECTION.
           DISPLAY msg-erro.
           GOBACK.

       END PROGRAM prg17.
