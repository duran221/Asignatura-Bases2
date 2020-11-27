--------------------Haciendo un FOR-LOOP con números:-------------------------

--Inicio de bloque anónimo:
DECLARE
  --Usadas en el for 1:
	NUMERO1 NUMBER:=1;
	NUMERO2 NUMBER:=10;
  CONTADOR NUMBER:=1;
	

BEGIN
	--El for es muy similar a python, un elemento inicial y uno final:
  FOR numero IN NUMERO1..NUMERO2
		--Etiqueta independiente pero que siempre debe ser incluida en la sintaxis de el for y el while:
		LOOP
			DBMS_OUTPUT.put_line('ITERACIÓN NÚMERO ' || numero);
			CONTADOR:= CONTADOR+2;
			DBMS_OUTPUT.put_line('VALOR DE EL CONTADOR: ' || CONTADOR);
    --Fin de nuestro bucle:
		END LOOP;
		
	--Tambien podemos hacer estructuras 'For-loop' con el orden invertido, veamos:
	--Para el siguiente ejemplo hacemos uso de la palabra reservada 'REVERSE': (Observación)
  --El bucle se realiza entre el rango de 5 y 2 (Ambos incluidos):
	FOR registro  IN REVERSE 2..5
		LOOP
			DBMS_OUTPUT.put_line('ITERACIÓN NÚMERO ' || registro);
		END LOOP;
			 	
END;  



-----------------------Haciendo un FOR-LOOP con registros de tablas:-----------------

BEGIN
	--Haciendo un 'FOR-LOOP' que recorrerá posición por posición los registros de la tabla:
	FOR registro IN (SELECT * FROM AEROEMPLEADOS)
		LOOP
			--Si el salario es mayor a 3000, muestre el registro:
			IF registro.salario>3000 THEN
				DBMS_OUTPUT.put_line(registro.nombreemp || ' ' || registro.salario );
			--Fin de el if
			END IF;
		--Fin de el for:
		END LOOP;


END;

