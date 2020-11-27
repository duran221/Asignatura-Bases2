/*        CONDICIONALES:

La l�gica viene siendo la misma de cualquier lenguaje de programaci�n, tenemos
el com�n 'IF', 'ELSE' y 'ELSIF'
*/

--Inicio de bloque an�nimo:
DECLARE
  --Dos condiciones booleanas para este ejercicio:
	VERDADERO BOOLEAN:=TRUE;
	FALSO BOOLEAN :=FALSE;

BEGIN
  --(IF CONDICION THEN), si la condici�n es verdadera ingresa a el bloque interno, de lo contrario, no:
  IF VERDADERO THEN
		
		DBMS_OUTPUT.put_line('Condici�n cumplida');	

  ELSE
		
	  DBMS_OUTPUT.put_line('La condici�n no se ha cumplido');  
	
	END IF;

--Manejo de excepciones:
EXCEPTION
  WHEN OTHERS THEN
		NULL;

--Final de el bloque an�nimo:
END;		  
