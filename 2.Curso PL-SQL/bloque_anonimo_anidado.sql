
--Primero declaramos el bloque an�nimo:
DECLARE

--Declarando dos variables simples:
CADENA1 VARCHAR2(50):= 'Cristian Duran';
CADENA2 VARCHAR2(70):= 'Alex Rodriguez';

NUM1 NUMBER(10,0):=4;
NUM2 NUMBER(3,0):=2;

BEGIN
	--Aqui vamos a imprimir la primer variable:
	dbms_output.put_line(CADENA1);
	
	--Aqu� empieza un bloque an�nimo interno:
	BEGIN
		dbms_output.put_line(CADENA2);
		
	EXCEPTION
		WHEN OTHERS THEN
			dbms_output.put_line('Algo ha fallado en el bloque interno');
	
	--Aqu� termina el bloque anonimo interno	
	END;
	
	--Haciendo una sencilla suma de dos numeros:
  dbms_output.put_line(NUM1+NUM2);

--Aqui hacemos el control de errores:
EXCEPTION
	WHEN OTHERS THEN
		dbms_output.put_line('Ha ocurrido un error en el bloque principal');

--Fin De bloque an�nimo principal
END;
