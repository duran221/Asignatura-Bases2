/*
Entrar un grado por teclado y devolver un mensaje que me diga CUANTOS estudiantes estan matriculados en ese grado;
*/

DECLARE
    --Declaración de dos variables, una que recibe el grado a ingrasar y 'CANT' que me almacena la cantidad de alumnos
    GRADO_ELEGIDO MATRICULAS.GRADO%TYPE:= '&Grado';
    CANT NUMBER;


BEGIN
    --Borro la basura de temporal:
    DELETE FROM TEMPORAL;
    --Se agrupa por IDESTUDIANTE Y GRADO en donde el grado sea equivalente a el grado ingresado por teclado, por último se muestran
    --los resultados:
    SELECT COUNT(*) INTO CANT FROM(SELECT IDESTUDIANTE,GRADO
    FROM MATRICULAS GROUP BY IDESTUDIANTE,GRADO HAVING GRADO=UPPER(GRADO_ELEGIDO));
    
    IF CANT>0 THEN
        --Insertando los registros en la tabla TEMPORAL
        INSERT INTO TEMPORAL VALUES(CANT,GRADO_ELEGIDO);
        DBMS_OUTPUT.PUT_LINE('La cantidad de alumnos registrados en el grado ' || GRADO_ELEGIDO || ' es ' || CANT);
    ELSE
        DBMS_OUTPUT.PUT_LINE('No se encontraron registros');
    END IF;

EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Ha ocurrido un error');
END;

 
