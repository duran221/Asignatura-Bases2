/*
Implementar un bloque anonimo que almacene en la tabla temporal el total de número de estudiantes
matriculados cuyo nombre empieza por vocal y el número de estudiantes cuyo nombre empieza por 
consonante, listar por pantalla los subtotales para cada total
*/

set SERVEROUTPUT ON;
DECLARE 
    --Se declaran las variables en las cuales almacenaré los totales que voy obteniendo:
    NUMVOCALES NUMBER:=0; --Se calcula
    NUMCONSONANTES NUMBER:=0;
    NUMA NUMBER:=0;
    NUME NUMBER:=0;
    NUMI NUMBER:=0;
    NUMO NUMBER:=0;
    NUMU NUMBER:=0;
    TOTAL NUMBER:=0;

BEGIN
    --Borro la basura que pueda haber en la tabla temporal
    DELETE FROM TEMPORAL;
    
    --Consultando el número alumnos matriculados que empiecen por vocal:
    --Observación: la función 'SUBSTR' la uso para extraer el primer caracter de el NOMBRE que se está consultando (1,1) 
    SELECT COUNT(DISTINCT ID) INTO NUMVOCALES FROM ESTUDIANTES EST JOIN MATRICULAS MAT ON EST.ID=MAT.IDESTUDIANTE
    WHERE UPPER(SUBSTR(NOMBRE, 1, 1)) IN('A','E','I','O','U'); 
    

    --Consultando el número de alumnos matriculados que empiecen por consonante:
    SELECT COUNT(DISTINCT ID) INTO NUMCONSONANTES FROM ESTUDIANTES EST JOIN MATRICULAS MAT ON EST.ID=MAT.IDESTUDIANTE
    WHERE UPPER(SUBSTR(NOMBRE, 1, 1)) NOT IN('A','E','I','O','U');
    
  
    --Consultando el número de alumnos matriculados que empiecen por A:    
    SELECT COUNT(DISTINCT ID) INTO NUMA FROM ESTUDIANTES EST JOIN MATRICULAS MAT ON EST.ID=MAT.IDESTUDIANTE
    WHERE UPPER(SUBSTR(NOMBRE, 1, 1)) IN('A');
    
    --Consultando el número de alumnos matriculados que empiecen por E:       
    SELECT COUNT(DISTINCT ID) INTO NUME FROM ESTUDIANTES EST JOIN MATRICULAS MAT ON EST.ID=MAT.IDESTUDIANTE
    WHERE UPPER(SUBSTR(NOMBRE, 1, 1)) IN('E');
    
    --Consultando el número de alumnos matriculados que empiecen por I:    
    SELECT COUNT(DISTINCT ID) INTO NUMI FROM ESTUDIANTES EST JOIN MATRICULAS MAT ON EST.ID=MAT.IDESTUDIANTE
    WHERE UPPER(SUBSTR(NOMBRE, 1, 1)) IN('I');
    
    --Consultando el número de alumnos matriculados que empiecen por O:    
    SELECT COUNT(DISTINCT ID) INTO NUMO FROM ESTUDIANTES EST JOIN MATRICULAS MAT ON EST.ID=MAT.IDESTUDIANTE
    WHERE UPPER(SUBSTR(NOMBRE, 1, 1)) IN('O');
    
    --Consultando el número de alumnos matriculados que empiecen por U:    
    SELECT COUNT(DISTINCT ID) INTO NUMU FROM ESTUDIANTES EST JOIN MATRICULAS MAT ON EST.ID=MAT.IDESTUDIANTE
    WHERE UPPER(SUBSTR(NOMBRE, 1, 1)) IN('U');
    

    --Consultando el total de estudiantes matriculados:
    SELECT COUNT(DISTINCT ID) INTO TOTAL FROM ESTUDIANTES EST JOIN MATRICULAS MAT ON EST.ID=MAT.IDESTUDIANTE;
    
    --Insertando la cantidad de alumnos matriculados por consonante y por vocales:
    INSERT INTO TEMPORAL VALUES(NUMVOCALES,'Total matriculados vocal');
    INSERT INTO TEMPORAL VALUES(NUMCONSONANTES,'Total matriculados consonante');
   

    --Imprimiendo los totales calculados:
    DBMS_OUTPUT.PUT_LINE('Total Matriculados vocal A: '||NUMA);
    DBMS_OUTPUT.PUT_LINE('Total Matriculados vocal E: '||NUME);
    DBMS_OUTPUT.PUT_LINE('Total Matriculados vocal I: '||NUMI);
    DBMS_OUTPUT.PUT_LINE('Total Matriculados vocal O: '||NUMO);
    DBMS_OUTPUT.PUT_LINE('Total Matriculados vocal U: '||NUMU);

--Manejo de excepciones:
EXCEPTION

    WHEN OTHERS THEN
        NULL;

--Fin de el bloque anónimo
END;
/


SELECT * FROM TEMPORAL;