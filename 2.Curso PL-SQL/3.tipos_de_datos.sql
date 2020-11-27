
--Inicio de el bloque an�nimo:
DECLARE 

		--Datos numericos: NUMBER(precisi�n,escala):
		saldo NUMBER(16,2):=150300.1;

		--Como observaci�n adicional al utilizar el operador ':=' estamos una asignaci�n,
		--si usaramos simplemente un '='  estariamos verificando igualdad

		--CHAR (Longitud m�xima):
		/*Algo particular de el tipo de dato 'CHAR' es que la longitud es fija 
			En este caso 20 posiciones, si se ocupan menos posiciones, estas son rellenadas  */
		nombre CHAR(20):= 'Hola a todos';

		--Varchar2 (Longitud m�xima):
		/*A diferencia de 'CHAR' este tipo de dato no rellena con blancos la cantidad de caracteres faltantes
		 cuando la longitud de la cadena es inferior a la longitud m�xima*/
		nombre2 VARCHAR2(20):='Cristian Duran';

		--Booleanos TRUE|FALSE:
		condicion BOOLEAN:=TRUE;

		--Fechas:
		--Usando la fecha de el sistema:
		fecha1 DATE:=SYSDATE;
		--Declaraci�n impl�cita de una fecha dd-mm-yyyy
		fecha2 DATE:='12-02-2019';


		--Variables de tipo 'TYPE' Admite un tipo de dato igual a el de la columna indicada:
		codigo_empleado AEROEMPLEADOS.IDEMPLEADO%TYPE:=2;

		--$ROWTYPE: Es un de la tabla que se declare:
		TABLA_COMPLETA AEROEMPLEADOS%ROWTYPE;

		--Inicio de la l�gica de el programa:
	
BEGIN
	
    --N�tese como se concatena texto con una variable al momento de imprimir los datos:
	  DBMS_OUTPUT.put_line('El saldo es de: ' || saldo );
		DBMS_OUTPUT.put_line('El primer nombre es: ' || nombre);
		DBMS_OUTPUT.put_line('El segundo nombre es: ' || nombre2);
		DBMS_OUTPUT.put_line('La fecha de el sistema es: ' || fecha1);
		DBMS_OUTPUT.put_line('La fecha 2 es: ' || fecha2);
		DBMS_OUTPUT.put_line('El c�digo empleado es: ' || codigo_empleado);
		
		--Llenando la variable 'TABLA_COMPLETA' con los datos de la tabla 'AEROEMPLEADOS':
		SELECT * INTO TABLA_COMPLETA
		FROM AEROEMPLEADOS;
	
	
EXCEPTION
	--Aqu� se controlan los errores:
	WHEN OTHERS THEN
		NULL;

--Fin de el bloque an�nimo:
END;	  
