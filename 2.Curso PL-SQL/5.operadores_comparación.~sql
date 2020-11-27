
DECLARE

  --Declaración de variables:
  NUMERO1 NUMBER:=3;
  NUMERO2 NUMBER:=2;

BEGIN
	--Verificando condición de igualdad con el operador '=':
  IF NUMERO1=NUMERO2 THEN
		DBMS_OUTPUT.put_line('Los dos números son iguales');
	
	--Operador >= 
	ELSIF NUMERO1>=NUMERO2 THEN
		DBMS_OUTPUT.put_line('El número 1 es mayor a el número 2');
	
	--Operado <=
	ELSIF NUMERO1<=NUMERO2 THEN
		DBMS_OUTPUT.put_line('El número 1 es menor a el número 2');
  
	--Una opción para comparar si son diferentes:
	ELSIF NUMERO1<>NUMERO2 THEN
		DBMS_OUTPUT.put_line('Ambos números son distintos');
  
  --Otra variante para comparar si son diferentes:  
	ELSIF NUMERO1 != NUMERO2 THEN
		DBMS_OUTPUT.put_line('También determino si los número son distintos');
    
	ELSE
		DBMS_OUTPUT.put_line('Ninguna condición ha sido cumplida');
	
	--Fin de el bloque 'IF':
	END IF;

--Manejo de excepciones:
EXCEPTION
	WHEN OTHERS THEN
		NULL;

END;		  
