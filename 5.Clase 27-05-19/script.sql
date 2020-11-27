DECLARE

    Vnombre ESTUDIANTES.NOMBRE%TYPE:= '&InserteNombre';
    Vapellido ESTUDIANTES.APELLIDO%TYPE:= '&InserteApellido';
    
    Vcreditos NUMBER:= &InserteCreditos;
    
    Vespecialidad ESTUDIANTES.ESPECIALIDAD%TYPE:= '&InserteEspecialidad';
    
    MaximoCreditos NUMBER:=0;
    MinimoCreditos NUMBER:=0;
    NumeroModificados NUMBER:=0;
    NumeroEncontrados NUMBER:=0;
    
    Vid NUMBER:=0;
    

BEGIN

    DELETE FROM TEMPORAL;
    SELECT MAX(CREDITOS) INTO MaximoCreditos FROM ESTUDIANTES;
    SELECT MIN(CREDITOS) INTO MinimoCreditos FROM ESTUDIANTES;
    
    SELECT COUNT(*) INTO NumeroEncontrados FROM ESTUDIANTES WHERE UPPER(ESPECIALIDAD)= UPPER(Vespecialidad);
    
    IF maximocreditos<Vcreditos OR Minimocreditos>Vcreditos OR Vcreditos<0 THEN
    
        INSERT INTO TEMPORAL(COLUMNACARACTER) VALUES('Créditos no son validos');
        
    ELSIF NumeroEncontrados=0 THEN
        INSERT INTO TEMPORAL(COLUMNACARACTER) VALUES('Especialidad no valida');
    
    ELSE
        
        UPDATE ESTUDIANTES
          SET CREDITOS = CREDITOS+Vcreditos
          WHERE UPPER(NOMBRE)= UPPER(Vnombre) AND UPPER(APELLIDO)=UPPER(Vapellido);
          
        IF SQL%FOUND THEN
            NumeroModificados:=SQL%ROWCOUNT;
            INSERT INTO TEMPORAL VALUES(NumeroModificados,'Registros modificados');
            
            
        ELSE
            
            SELECT MAX(ID)+1 INTO Vid
            FROM ESTUDIANTES;
            
            SELECT MAX(CREDITOS) INTO Vcreditos
            FROM ESTUDIANTES WHERE UPPER(ESPECIALIDAD)=Vespecialidad;
        
            INSERT INTO ESTUDIANTES VALUES(Vid,Vnombre,Vapellido,Vespecialidad,Vcreditos);
            INSERT INTO TEMPORAL(COLUMNACARACTER) VALUES('REGISTRO ADICIONADO');
        
        END IF;      
    
    END IF;

EXCEPTION
    WHEN OTHERS THEN
        NULL;

END;