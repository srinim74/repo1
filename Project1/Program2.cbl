       $SET SQL(DBMAN=ODBC)
       IDENTIFICATION DIVISION.
       PROGRAM-ID. PROGRAM2.
       ENVIRONMENT DIVISION.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 WS-ID        PIC S9(9) COMP-5.
       01 WS-ADDRESS   PIC X(50). 
       EXEC SQL INCLUDE SQLCA END-EXEC.
       PROCEDURE DIVISION.
           EXEC SQL CONNECT TO "PostgreSQL30" USER postgres
               USING Dec2018!
           END-EXEC.
           IF SQLCODE = 0
                DISPLAY 'CONNECTION SUCCESSFUL' 
           ELSE
                DISPLAY 'CONNECTION FAILED'
                STOP RUN
           END-IF.
           EXEC SQL
                   SELECT ID, ADDRESS
                     INTO :WS-ID, :WS-ADDRESS
                   FROM COMPANY
                   WHERE ID = 1
           END-EXEC.
           IF SQLCODE = 0
                DISPLAY 'ADDRESS : ' WS-ADDRESS
           ELSE
                DISPLAY 'ERROR RETRIEVING DATA ' SQLCODE
           END-IF.
           DISPLAY 'CHANGE 001'.
           DISPLAY 'JAN 7TH 2019'. 
           STOP RUN.
