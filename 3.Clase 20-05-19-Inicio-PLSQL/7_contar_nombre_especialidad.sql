/*

Hacer un bloque anonimo que dada una cadena de texto y una especialidad almacene en temporal el número de personas cuyo nombre
contienen dicha cadena de texto en esa especialidad.
*/
set SERVEROUTPUT ON;
DECLARE
    --Se declaran las variabes que reciben: la cadena con el nombre o fragmento de nombre y una especialidad, por ultimo el contador 
    --donde mostraré los resultados de la consulta:
    NOMBRE_EST VARCHAR2(30) := '&nombre';
    ESPECIALIDAD_EST ESTUDIANTES.ESPECIALIDAD%TYPE := '&especialidad';
    CONTADOR NUMBER;
    
BEGIN
    --Borro la basura de la tabla temporal:
    DELETE FROM TEMPORAL;
    --La consulta hace uso de el operador 'LIKE' para obtener el resultado a partir de un fragmento de el nombre ingresado:
    SELECT COUNT(*) INTO CONTADOR  
    FROM ESTUDIANTES WHERE UPPER(ESPECIALIDAD)= UPPER(ESPECIALIDAD_EST) AND UPPER(NOMBRE) LIKE '%'||UPPER(NOMBRE_EST)||'%';
    
    --Insertando y mostrando el resultado obtenido
    INSERT INTO TEMPORAL(COLUMNANUMERICA) VALUES(CONTADOR);
    DBMS_OUTPUT.PUT_LINE(CONTADOR);
EXCEPTION
    WHEN OTHERS THEN
        NULL;


END;