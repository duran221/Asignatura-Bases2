
--Como aquí la consulta involucraba actualización operación DML se usó cursor implicito.
DECLARE 
  --Declaro una variable de sustitución:
	--Con esto garantizo que los tipos son compatibles a los de la tabla para hacer la búsqueda
    Vn estudiantes.nombre%type :='&Inserte_Nombre';
	Va estudiantes.apellido%type := '&Inserte_Apellido';
	
	--Defino la variable que me procesa el ID, en caso de que el alumno no exista
	Vid number:=0;
	
	-- Defino la variable que me calcula los Créditos:
	Vc number:=0;
	
	--Defino el cursor: --Cuando son explícitos se definen en la zona de declaración, cuando son implícitos se nombran en la zona de
	--Código
	
BEGIN
	--Borro la tabla temporal.
    DELETE FROM TEMPORAL;
	
	--Como el update hace una búsqueda para actualizar, es absurdo hacer un SELECT.

    
	UPDATE ESTUDIANTES 
	SET CREDITOS=CREDITOS+2
	WHERE UPPER(NOMBRE)=UPPER(Vn) AND UPPER(APELLIDO)=UPPER(Va);
	
	--Despues de que se evalúa la actualización se genera un Cursor IMPLÍCITO con LAS FILAS que se actualizaron.
	--Siendo así vamos a evalúar si hay gente con ese nombre y apellido
	--Si se encontró el cursor
	IF SQL%FOUND THEN
		--Inserte 
		INSERT INTO TEMPORAL(COLUMNACARACTER) VALUES('REGISTROS MODIFICADOS');
		
	--Si no había ninguna persona con ese nombre y apellido:
	ELSE
		
		--Me falta calcular el id y los créditos para hacer la inserción:
		--Debo garantizar que el ID no se vaya a repetir ni el sea nulo:
		--Le sumo 1 el máximo id que exista
		SELECT MAX(ID)+1 INTO Vid
		FROM ESTUDIANTES;
		
		--Ahora calculamos los créditos:
		SELECT MAX(CREDITOS) INTO Vc
		FROM ESTUDIANTES WHERE UPPER(ESPECIALIDAD)='MUSICA';
		
		--Insertamos en la tabla ESTUDIANTES 
		INSERT INTO ESTUDIANTES(Vid,Vn,Va,'MUSICA',Vc);
		
		INSERT INTO TEMPORAL(COLUMNACARACTER) VALUES('REGISTRO ADICIONADO');
		
	END IF,
		
END;  
