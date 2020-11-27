/*
Ejemplo: Pedir por pantalla dos valores e insertar en la tabla temporal los números comprendidos entre esos valores
Ejemplo: Pedir por pantalla un número entero de un dígito y almacenar en temporal los primeros 20 números múltiplos de ese número
Ejemplo: Pedir por pantalla dos valores e insertar en la tabla temporal los números primos comprendidos entre

*/

-----------------------------------------------------Ejercicio 1------------------------------------------------------
--Ejemplo: Pedir por pantalla dos valores e insertar en la tabla temporal los números comprendidos entre esos valores
DECLARE

    --Se piden los dos números para verificar el límite
    NUM1 NUMBER:= &Inserte_numero_1;
    NUM2 NUMBER:= &Inserte_numero_2;

BEGIN

    --Se borra la basura de la tabla temporal:
    DELETE FROM TEMPORAL;

    --El 'FOR' es muy similar a el de python, cabe aclarar que NUM1,NUM2 ambos son incluidos a la hora de realizar la iteración:
    FOR NUM IN NUM1..NUM2
    LOOP                            --Palabra reservada para denotar que hay un bucle
        
        --Conjunto de instrucciones a realizar dentro de el LOOP:
        dbms_output.put_line(NUM);
        INSERT INTO TEMPORAL(COLUMNANUMERICA) VALUES(NUM);
    
    --Indicando que aquí termina el FOR:
    END LOOP;

EXCEPTION
        WHEN OTHERS THEN
            NULL;

END;
/

-----------------------------------------------Solución usando LOOP-------------------------------------------------------------------

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
----------------------------------------------------Solución usando WHILE:

set SERVEROUTPUT ON;
DECLARE

    NUM1 NUMBER:= &Inserte_numero;
    NUM2 NUMBER:= &Inserte_numero;

BEGIN
    
    DELETE FROM TEMPORAL;
    --La sintaxis de la estructura WHILE es similar a la de python: se especifica una condición y como sintaxis adicional se añade un bloque
    --LOOP con su correspondiente cierre.
    WHILE NUM1<=NUM2
        LOOP
            INSERT INTO TEMPORAL(COLUMNANUMERICA) VALUES(NUM1);
            DBMS_OUTPUT.PUT_LINE(NUM1);
            NUM1:= NUM1+1;
                      
        
        END LOOP;


EXCEPTION

    WHEN OTHERS THEN
        NULL;


END;
/



-----------------------------------------------------Ejercicio 2------------------------------------------------------
--Ejemplo: Pedir por pantalla un número entero de un dígito y almacenar en temporal los primeros 20 números múltiplos de ese número

set SERVEROUTPUT ON;
DECLARE
    --Número al que yo le quiero calcular los múltiplos:
    NUM1 NUMBER := &Inserte_numero;
    --Una variable para conocer cuando obtenga los 20 múltiplos:
    CONTADOR NUMBER:=0;
    --El número que se va evaluando:
    NUMERO NUMBER:=0;

BEGIN
    --Se borra la tabla temporal:
    DELETE FROM TEMPORAL;
    --Para evitar conflictos se pregunta si el número a el cual le voy a calcular los múltiplos es diferente de cero:
    IF NUM1 <> 0 THEN
        --Cuando el contador llegue a 20 el saltará del ciclo:
        WHILE CONTADOR<20
            LOOP
                --Preguntando si el residuo de la división entre ambos números es cero:
                IF MOD(NUMERO,NUM1)=0 THEN
                    
                    INSERT INTO TEMPORAL(COLUMNANUMERICA) VALUES(NUMERO);
                    DBMS_OUTPUT.PUT_LINE(NUMERO);
                    CONTADOR:=CONTADOR+1;
                    NUMERO:= NUMERO+1;

                ELSE
                    NUMERO:= NUMERO+1;
                
                --Fin de condición IF
                END IF;

            --Fin de bucle:
            END LOOP;

    ELSE

        DBMS_OUTPUT.PUT_LINE(0);

    END IF;

--Manejo de excepciones:
EXCEPTION

    WHEN OTHERS THEN
        NULL;

--Fin de bloque anónimo:
END;
/
SELECT * FROM TEMPORAL;