/*
Usando cursores: 

--pedir un numero por teclado comprendido entre 1 y 9, insertar en la tabla temporal
--insertar los id de las personas que son multiplos de esos numeros, pero cuando ese id, el nombre y el apellido
--empiece por consonante, insertar el nombre y el apellido n veces;
*/
DECLARE
    --Se pide un número comprendido entre 1 y 9:
    numero NUMBER:= &InserteNumero;
    --Me permite indicar cuántas veces se va a insertar un nombre y apellido en la tabla temporal:
    nveces NUMBER:=3;
    
    --Se declara el cursor:
    CURSOR cursor_estudiantes IS SELECT ID,NOMBRE,APELLIDO FROM ESTUDIANTES;

BEGIN
    --Borre toda la basura que haya en la tabla temporal:
    DELETE FROM TEMPORAL;

    FOR estudiante IN cursor_estudiantes
        LOOP
          --Se pregunta si el contador(ID ACTUAL) es multiplo de el número ingresado por teclado:
                IF MOD(estudiante.id,numero)=0 THEN

                  --Inserto en temporal el valor de el id que se encontró como multiplo
                  INSERT INTO TEMPORAL(COLUMNANUMERICA) VALUES(estudiante.ID);
                    
                  --Ahora pregunto si el nombre y el apellido de el estudiante empieza por a:
                  IF UPPER(SUBSTR(estudiante.NOMBRE,1,1)) NOT IN('A','E','I','O','U') AND 
                  UPPER(SUBSTR(estudiante.APELLIDO,1,1)) NOT IN('A','E','I','O','U') THEN
                    
                    --Si es así entonces inserte el for el número de veces especificados:
                    FOR I IN 1..nveces
                      LOOP
                          
                        INSERT INTO TEMPORAL(COLUMNACARACTER) VALUES(estudiante.NOMBRE || '' || estudiante.APELLIDO);

                      END LOOP;
                     
                  END IF;         

                END IF;
        END LOOP;
    
EXCEPTION

    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Error generado, no se encontraron datos');

END;