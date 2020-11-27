
--Primero declaramos el bloque anónimo:
DECLARE

--Declarando dos variales simples:
CADENA1 VARCHAR2(50):= 'Cristian Duran';
CADENA2 VARCHAR2(70):= 'Alex Rodriguez';

BEGIN
	--Aqui vamos a imprimir la primer variable:
	dbms_output.put_line(CADENA1);
	
	--Aquí empieza un bloque anónimo interno:
	BEGIN
		dbms_output.put_line(CADENA2);
		
	EXCEPTION
		WHEN OTHERS THEN
			dbms_output.put_line('Algo ha fallado en el bloque interno');
			
	END;

EXCEPTION
	WHEN OTHERS THEN
		dbms_output.put_line('Ha ocurrido un error en el bloque principal');


END;