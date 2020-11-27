/*
Hacer un script ingresar un nombre y guardarlo en la tabla temporal la palabra Si o No
La palabra si, el nombre existe,
La palabra no, si no existe.
*/

DECLARE
    --Se declaran las variables necesarias:
    nombreE ESTUDIANTES.NOMBRE%TYPE := '&Inserte_Nombre';
    numregistros NUMBER:=0;
    esta CHAR(2) := 'SI';


BEGIN
    --Borro la basura de TEMPORAL:
    DELETE FROM TEMPORAL;
    --Consulto cuantos registros hay y los almaceno es la tabla ESTUDIANTES:
    SELECT COUNT(*) INTO numregistros FROM ESTUDIANTES WHERE UPPER(NOMBRE)=UPPER(nombreE);
    
    IF numregistros>0 THEN
        INSERT INTO TEMPORAL(COLUMNACARACTER) VALUES(esta);
    
    ELSE
        INSERT INTO TEMPORAL(COLUMNACARACTER) VALUES('No');
        
    END IF;
    
END;