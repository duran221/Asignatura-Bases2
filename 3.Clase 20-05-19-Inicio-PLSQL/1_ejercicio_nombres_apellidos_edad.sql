
set SERVEROUTPUT ON;

--Zona de declaración de varables:
DECLARE

nombres VARCHAR2(60):='Cristian Fernando';
apellidos VARCHAR2(60):='Duran Londoño';
carrera VARCHAR2(30):= 'Ingenieria De Sistemas';
edad NUMBER(2):=24;
BEGIN
    
    DBMS_OUTPUT.PUT_LINE('Sus nombres: ' || nombres);
    DBMS_OUTPUT.PUT_LINE('Sus apellidos: ' || apellidos);
    DBMS_OUTPUT.PUT_LINE('Su carrera:' || carrera);
    DBMS_OUTPUT.PUT_LINE('Su edad: ' || edad);
    

END;
