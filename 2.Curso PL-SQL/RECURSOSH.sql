
--Como aqu� la consulta involucraba actualizaci�n operaci�n DML se us� cursor implicito.
DECLARE 
  --Declaro una variable de sustituci�n:
	--Con esto garantizo que los tipos son compatibles a los de la tabla para hacer la b�squeda
    Vn estudiantes.nombre%type :='&Inserte_Nombre';
	Va estudiantes.apellido%type := '&Inserte_Apellido';
	
	--Defino la variable que me procesa el ID, en caso de que el alumno no exista
	Vid number:=0;
	
	-- Defino la variable que me calcula los Cr�ditos:
	Vc number:=0;
	
	--Defino el cursor: --Cuando son expl�citos se definen en la zona de declaraci�n, cuando son impl�citos se nombran en la zona de
	--C�digo
	
BEGIN
	--Borro la tabla temporal.
    DELETE FROM TEMPORAL;
	
	--Como el update hace una b�squeda para actualizar, es absurdo hacer un SELECT.

    
	UPDATE ESTUDIANTES 
	SET CREDITOS=CREDITOS+2
	WHERE UPPER(NOMBRE)=UPPER(Vn) AND UPPER(APELLIDO)=UPPER(Va);
	
	--Despues de que se eval�a la actualizaci�n se genera un Cursor IMPL�CITO con LAS FILAS que se actualizaron.
	--Siendo as� vamos a eval�ar si hay gente con ese nombre y apellido
	--Si se encontr� el cursor
	IF SQL%FOUND THEN
		--Inserte 
		INSERT INTO TEMPORAL(COLUMNACARACTER) VALUES('REGISTROS MODIFICADOS');
		
	--Si no hab�a ninguna persona con ese nombre y apellido:
	ELSE
		
		--Me falta calcular el id y los cr�ditos para hacer la inserci�n:
		--Debo garantizar que el ID no se vaya a repetir ni el sea nulo:
		--Le sumo 1 el m�ximo id que exista
		SELECT MAX(ID)+1 INTO Vid
		FROM ESTUDIANTES;
		
		--Ahora calculamos los cr�ditos:
		SELECT MAX(CREDITOS) INTO Vc
		FROM ESTUDIANTES WHERE UPPER(ESPECIALIDAD)='MUSICA';
		
		--Insertamos en la tabla ESTUDIANTES 
		INSERT INTO ESTUDIANTES(Vid,Vn,Va,'MUSICA',Vc);
		
		INSERT INTO TEMPORAL(COLUMNACARACTER) VALUES('REGISTRO ADICIONADO');
		
	END IF,
		
END;  
