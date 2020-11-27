/*
2--Almacenar en la tabla TEMPORAL:
Desarrolle o implemente un bloque que almacene en la tabla TEMPORAL
La especialidad de el estudiante cuyo ID  es igual a un valor que entra por teclado
*/

DECLARE

    --Indicando que esta variable tendrá el mismo tipo de dato de la columna indicada
    --Me indica que llegará una un dato pedido por el usuario:
    VID ESTUDIANTES.ID%TYPE := &Inserte_id;
    VESP ESTUDIANTES.ESPECIALIDAD%TYPE;

BEGIN
    --Borro la basura que hay en temporal:
    DELETE FROM TEMPORAL;
    --Primero consultar (Extraer) lo que necesito
    -- Van Inmediatamente despues de el Begin:
    --Almacena la respuesta en la variable VESP y se usa INTO porque se arroja un único valor
    SELECT ESPECIALIDAD 
    INTO VESP
    FROM ESTUDIANTES
    WHERE ID=VID;
    

    INSERT INTO TEMPORAL VALUES(VID,VESP);

--Control de errores dados por el programador:
EXCEPTION
    --Cuando no se encuentren dato (Excepciones preestablecidas)
    --Cuando son procedimientos no retorna excepción porque ella retorna cero
    
    WHEN NO_DATA_FOUND THEN
        VESP:= 'NO SE ENCUENTRA EL ID';
        INSERT INTO TEMPORAL VALUES(VID,VESP);
END;
