/*
Hacer con WHILE:
--pedir un numero por teclado comprendido entre 1 y 9, insertar en la tabla temporal
--insertar los id de las personas que son multiplos de esos numeros, pero cuando ese id, el nombre y el apellido
--empiece por consonante, insertar el nombre y el apellido n veces;

Nota:que sea menor o igual a el número de veces
*/



DECLARE
    --Se pide un número comprendido entre 1 y 9:
    numero NUMBER:= &InserteNumero;
    --Me permite indicar cuántas veces se va a insertar un nombre y apellido en la tabla temporal:
    nveces NUMBER:=3;
    
		--Me va contando de uno en uno los ID:
    contador NUMBER:=1;
		--El total estudiantes que se debe recorrer:
    iteraciones NUMBER:=0;
		
		--Me indica si se encontraron o no estudiantes con los criterios de el ejercicio:
		numero_encontrados NUMBER:=0;
    
		--En caso de que se haya encontrado estudiantes en estas variables se guarda su nombre y apellidos:
    nombreE estudiantes.nombre%TYPE;
    apellidoE estudiantes.apellido%TYPE;


BEGIN
    --Borre toda la basura que haya en la tabla temporal:
    DELETE FROM TEMPORAL;
    
		--Aquí conocemos cuántas iteraciones se debe hacer(Cuantos estudiantes hay):
    SELECT COUNT(*) INTO iteraciones from estudiantes;
		
    WHILE contador<=iteraciones
        LOOP
          --Se pregunta si el contador(ID ACTUAL) es multiplo de el número ingresado por teclado:
					IF MOD(contador,numero)=0 THEN
	            --Inserto en temporal el valor de el id que se encontró como multiplo
							INSERT INTO TEMPORAL(COLUMNANUMERICA) VALUES(contador);
	            
							--Ahora consulto si el nombre y epellido de ese estudiante identificado con ese id empieza por consonante:
							SELECT COUNT(*) INTO numero_encontrados
                     FROM ESTUDIANTES WHERE ID=contador AND
                     UPPER(SUBSTR(NOMBRE,1,1)) NOT IN('A','E','I','O','U')
						         AND UPPER(SUBSTR(APELLIDO,1,1)) NOT IN('A','E','I','O','U');
            
					    --Si se encontró al menos un registro que coincida con los criterios de la consulta:
	            IF numero_encontrados>0 THEN

								 --Consulte el nombre y el apellido de ese estudiante
							   SELECT NOMBRE,APELLIDO INTO nombreE,apellidoE
								        FROM ESTUDIANTES WHERE ID=contador;
								

								--El for simplemente me permite insertar ese nombre y apellido nveces en la tabla temporal:
							   FOR i IN 1..nveces
									 LOOP
									   
										 --Insertando en la tabla temporal el nombre y el apellido
									   INSERT INTO TEMPORAL(COLUMNACARACTER) VALUES(nombreE || ' '|| apellidoE);
										 
									 END LOOP;
									 
							END IF;          
	            
					END IF;
        
				  contador:= contador+1;
				
        END LOOP;
    
    
EXCEPTION

    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Error generado, no se encontraron datos');

END;