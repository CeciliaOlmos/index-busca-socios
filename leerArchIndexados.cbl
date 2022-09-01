      ******************************************************************
      * Author:
      * Date:
      * Purpose:
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. LEE-FILIALES.
       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION. SPECIAL-NAMES. DECIMAL-POINT IS COMMA.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT FILIALES
           ASSIGN TO '..\filiales.dat'
           ORGANIZATION IS INDEXED
           ACCESS MODE IS SEQUENTIAL
           RECORD KEY IS fil-cod.
       DATA DIVISION.
       FILE SECTION.
       FD  FILIALES.
       01  fil-reg.
           03 fil-cod pic 9999.
           03 fil-nom pic x(20).
       WORKING-STORAGE SECTION.
       01  lin-titulo-filial.
           03 filler pic x(23) value spaces.
           03 filler pic x(7) value "Codigo:".
           03 filler pic x(4) value spaces.
           03 filler pic x(20) value "Filial:".
       01  lin-detalle.
           03 filler pic x(23) value spaces.
           03 l-fil-cod pic zzz9.
           03 filler pic x(3) value " - ".
           03 l-fil-nom pic x(20).
       01  w-flag-filial pic 9 value zero.
       PROCEDURE DIVISION.
       MAIN-PROCEDURE.
           PERFORM 100-INICIO-PROGRAMA.
           PERFORM 200-LEER-ARCHIVO.
            PERFORM UNTIL w-flag-filial is equal 1
               PERFORM 300-PROCESO
               PERFORM 200-LEER-ARCHIVO
            END-PERFORM.
           PERFORM 500-FIN-PROGRAMA.
           STOP RUN.

       100-INICIO-PROGRAMA.
           OPEN INPUT FILIALES.
           DISPLAY lin-titulo-filial.
       200-LEER-ARCHIVO.
           READ FILIALES AT END MOVE 1 TO w-flag-filial.
       300-PROCESO.
           MOVE fil-cod TO l-fil-cod.
           MOVE fil-nom TO l-fil-nom.
           DISPLAY lin-detalle.
       500-FIN-PROGRAMA.
           CLOSE FILIALES.
       END PROGRAM LEE-FILIALES.
