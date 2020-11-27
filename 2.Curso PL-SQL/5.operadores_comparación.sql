
DECLARE

  --Declaraci�n de variables:
  NUMERO1 NUMBER:=3;
  NUMERO2 NUMBER:=2;

BEGIN
	--Verificando condici�n de igualdad con el operador '=':
  IF NUMERO1=NUMERO2 THEN
		DBMS_OUTPUT.put_line('Los dos n�meros son iguales');
	
	--Operador >= 
	ELSIF NUMERO1>=NUMERO2 THEN
		DBMS_OUTPUT.put_line('El n�mero 1 es mayor a el n�mero 2');
	
	--Operado <=
	ELSIF NUMERO1<=NUMERO2 THEN
		DBMS_OUTPUT.put_line('El n�mero 1 es menor a el n�mero 2');
  
	--Una opci�n para comparar si son diferentes:
	ELSIF NUMERO1<>NUMERO2 THEN
		DBMS_OUTPUT.put_line('Ambos n�meros son distintos');
  
  --Otra variante para comparar si son diferentes:  
	ELSIF NUMERO1 != NUMERO2 THEN
		DBMS_OUTPUT.put_line('Tambi�n determino si los n�mero son distintos');
    
	ELSE
		DBMS_OUTPUT.put_line('Ninguna condici�n ha sido cumplida');
	
	--Fin de el bloque 'IF':
	END IF;

--Manejo de excepciones:
EXCEPTION
	WHEN OTHERS THEN
		NULL;

END;		  
