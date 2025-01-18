      ******************************************************************
      * Author:
      * Date:
      * Purpose: arquivo de dados - leitura
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. prg16.
       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
       INPUT-OUTPUT SECTION.

       FILE-CONTROL.
       SELECT CLIENTES ASSIGN TO ".\clientes.dat"
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
       77 wrk-codigo pic 9(04) value ZERO.

       PROCEDURE DIVISION.

       0050-principal section.
           PERFORM 0100-inicializar.
           perform 0105-ler.
           perform 0300-finalizar.
           STOP RUN.

       0100-inicializar SECTION.
           open input CLIENTES.
               evaluate fs-clientes
               when 00
                   display "codigo a ser localizado"
                   ACCEPT wrk-codigo
               when 35
                   move "arquivo nao encontrado" to msg-erro
                   perform 0900-trata-erro
               when 37
                   move "arquivo incompativel" to msg-erro
                   perform 0900-trata-erro
               END-EVALUATE.

       0105-ler SECTION.
           read CLIENTES.
               EVALUATE fs-clientes
               when 10
                   DISPLAY "arquivo vazio"
               when OTHER
                   perform until fs-clientes not equal 00
                       if reg-id EQUAL wrk-codigo
                           DISPLAY "ID..."REG-ID
                           DISPLAY "NOME."REG-NOME
                           DISPLAY "TEL.."REG-TEL

                           close CLIENTES
                           GOBACK
                       end-if
                       read CLIENTES
                   end-perform
               END-EVALUATE.

       0300-finalizar SECTION.
           DISPLAY "finalizar".
           CLOSE CLIENTES.

       0900-trata-erro SECTION.
           DISPLAY msg-erro.
           GOBACK.

       END PROGRAM prg16.
