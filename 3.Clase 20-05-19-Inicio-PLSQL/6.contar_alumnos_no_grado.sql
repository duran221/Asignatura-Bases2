/*
Entrar un grado por teclado y devolver un mensaje que me diga CUANTOS estudiantes no estan matriculados en ese grado;
*/
set SERVEROUTPUT ON;
DECLARE
    --Declaración de dos variables simples, una para Almacenar el grado que se ingresa, otra para almacenar
    --la cuenta de Alumnos NO MATRICULADOS:
    GRADO_CONSULTADO MATRICULAS.GRADO%TYPE:= '&GRADO';
    CONTADOR NUMBER:=0;

BEGIN
        
    DELETE FROM TEMPORAL;   
    --Para consultar adecuadamente se realiza un agrupamiento por idEstudiante y luego por grado, se filtra la condición
    -- y por último se cuentan los registros.
    SELECT COUNT(*) INTO CONTADOR FROM(
        SELECT DISTINCT IDESTUDIANTE FROM MATRICULAS
        MINUS
        SELECT DISTINCT IDESTUDIANTE
            FROM MATRICULAS WHERE GRADO=UPPER(GRADO_CONSULTADO));
    
    --Si el contador es mayor a cero es porque se encontraron registros:
    IF CONTADOR>0 THEN
        --Inserte en la tabla temporal los valores encontrados:
        INSERT INTO TEMPORAL VALUES(CONTADOR,GRADO_CONSULTADO);
        
        DBMS_OUTPUT.PUT_LINE('La cantidad de alumnos que No están matriculados en el grado '
        || GRADO_CONSULTADO || ' es ' || CONTADOR);
        
    ELSE
    
        INSERT INTO TEMPORAL VALUES(CONTADOR,GRADO_CONSULTADO);    
        DBMS_OUTPUT.PUT_LINE('No se encontraron registros');
    
    END IF;
    
--Manejo de Excepciones:
EXCEPTION
    WHEN OTHERS THEN
        NULL;

END;


    
    