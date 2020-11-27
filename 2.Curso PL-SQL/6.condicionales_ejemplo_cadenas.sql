
DECLARE

--Declarando dos variables con que tienen la misma palabra pero con sútiles diferencias:
VAR1 VARCHAR2(20):= 'Codigo';
VAR2 VARCHAR2(20):= 'codigo  ';

BEGIN
	/*
	'UPPER' Esta función hace una conversión a mayusculas para limitar errores por entrada de el usuario:
	'TRIM' Función que elimina los posibles espacios al principio y al final de la palabra:
	'LIKE' Este operador se recomienda para comparar cadenas de texto:
	*/
	IF UPPER(TRIM(VAR1)) LIKE UPPER(TRIM(VAR2)) THEN
		
		DBMS_OUTPUT.put_line('Las palabras son las mismas');
		
	ELSE
		DBMS_OUTPUT.put_line('Las palabras no son iguales');

  END IF;
	
EXCEPTION
  WHEN OTHERS THEN
		NULL;

END;		  
