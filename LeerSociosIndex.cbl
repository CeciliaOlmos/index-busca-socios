      ******************************************************************
      * Author:
      * Date:
      * Purpose:
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. LEER-SOCIOS.
       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION. SPECIAL-NAMES. DECIMAL-POINT IS COMMA.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT SOCIOS
           ASSIGN TO '..\socios.dat'
           ORGANIZATION IS INDEXED
           ACCESS MODE IS SEQUENTIAL
           RECORD KEY IS soc-llave.

       DATA DIVISION.
       FILE SECTION.
       FD  SOCIOS.
       01  soc-reg.
           03 soc-llave.
               05 soc-filial pic 9999.
               05 soc-cod pic 9999.
           03 soc-nom pic x(20).
           03 soc-saldo pic s9(7)v99.
       WORKING-STORAGE SECTION.
       01  w-flag pic 9 value ZERO.
       01  lin-titulo.
           03 filler pic x(5) value spaces.
           03 filler pic x(7) value "FILIAL:".
           03 filler pic x(3) value spaces.
           03 filler pic x(8) value "SOC.COD:".
           03 filler pic x(3) value spaces.
           03 filler pic x(7) value "NOMBRE:".
           03 filler pic x(18) value spaces.
           03 filler pic x(6) value "SALDO:".
       01  lin-detalle.
           03 filler pic x(5) value spaces.
           03 l-fil-cod pic zzz9.
           03 filler pic x(5) value spaces.
           03 l-soc-cod pic zzz9.
           03 filler pic x(8) value spaces.
           03 l-soc-nom pic x(20).
           03 filler pic x(2) value spaces.

           03 l-soc-saldo pic z.zzz.zz9,99.
       PROCEDURE DIVISION.
       MAIN-PROCEDURE.

           PERFORM 100-INICIO-LECTURA.
           PERFORM 200-LEE-ARCH-SOCIOS.
           PERFORM UNTIL w-flag is equal 1
               PERFORM 300-PROCESO-LECTURA
               PERFORM 200-LEE-ARCH-SOCIOS
           END-PERFORM.
           PERFORM 400-FIN-LECTURA.
            STOP RUN.

       100-INICIO-LECTURA.
           PERFORM 130-ABRIR-ARCHIVOS.
           PERFORM 150-LISTAR-ENCABEZADO.

       130-ABRIR-ARCHIVOS.
           open INPUT SOCIOS.

       150-LISTAR-ENCABEZADO.
           DISPLAY lin-titulo.

       200-LEE-ARCH-SOCIOS.
           READ socios next at end move 1 to w-flag.

       300-PROCESO-LECTURA.
           MOVE soc-filial to l-fil-cod.
           MOVE soc-cod to l-soc-cod.
           MOVE soc-nom to l-soc-nom.
           MOVE soc-saldo to l-soc-saldo.
           DISPLAY lin-detalle.

       400-FIN-LECTURA.
           close SOCIOS.
       END PROGRAM LEER-SOCIOS.
