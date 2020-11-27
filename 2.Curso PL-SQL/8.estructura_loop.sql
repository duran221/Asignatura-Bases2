--Ejemplo: Pedir por pantalla dos valores e insertar en la tabla temporal los números comprendidos entre esos valores
DECLARE

    --Se piden los dos números para verificar el límite
    NUM1 NUMBER:= &Inserte_numero_1;
    NUM2 NUMBER:= &Inserte_numero_2;

BEGIN
    --Borro de la tabla TEMPORAL la basura innecesaria:
    DELETE FROM TEMPORAL;
    
    --Estas estructuras me permiten repetir iteraciones limitadas por una condición escrita a el final de el bucle:
    LOOP
        
        INSERT INTO TEMPORAL(COLUMNANUMERICA) VALUES(NUM1);
        DBMS_OUTPUT.PUT_LINE (NUM1);
        
        --Importante sumarlo para que no se vaya a quedar infinito:
        NUM1:= NUM1+1;
        
        --Condición de escape para el CICLO, aquí es donde yo indico cuando debe salir de la estructura LOOP
        EXIT WHEN NUM1=NUM2;
    --Fin de bloque LOOP:
    END LOOP;
    
EXCEPTION
        WHEN OTHERS THEN
            NULL;

END;
/

SELECT * FROM TEMPORAL;