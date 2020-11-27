--Bloque almacenado que permita ingresar un char 'u' o 'p' , un n�mero (15) y el nombre de una tabla
--almacena en la tabla temporal los �ltimos 15 propietarios y nombre del hotel
--para las dem�s tablas de estudiantes mostrar todo
--CONSULTAR: rowid, rownum, TYPE MIC REF CURSOR

CREATE OR REPLACE FUNCTION consultar(
CARACTER IN CHAR(1),
CANTIDAD_REGISTROS IN NUMBER,
NOMBRETABLA IN VARCHAR2(30)
)
RETURN VARCHAR2
AS

    SALIDA VARCHAR2(100) :='No se encuentra la tabla || NOMBRETABLA';

    LONGITUD_TABLA NUMBER:=0;

    CURSOR tabla IS SELECT TABLE_NAME FROM USER_TABLES WHERE TABLE_NAME=TRIM(UPPER(NOMBRETABLA));

    CURSOR DATOSPRIMEROS IS SELECT * FROM TRIM(UPPER(NOMBRETABLA)) WHERE rownum<=CANTIDAD_REGISTROS;

    CURSOR DATOSULTIMOS IS SELECT * FROM TRIM(UPPER(NOMBRETABLA)) WHERE rownum>=LONGITUD_TABLA-CANTIDAD_REGISTROS;

    
BEGIN
    
    OPEN tabla;

    IF  tabla%ROWCOUNT>0 THEN
        IF CANTIDAD_REGISTROS<0 THEN
            DELETE FROM TEMPORAL;

            IF TRIM(UPPER(CARACTER))='U' THEN

                SELECT COUNT(*) INTO LONGITUD_TABLA FROM TRIM(UPPER(NOMBRETABLA));

                IF LONGITUD_TABLA<=CANTIDAD_REGISTROS THEN
                    
                    FOR REGISTRO IN DATOSULTIMOS
                    LOOP

                        IF NOMBRETABLA = TRIM(hotelesdorada) THEN

                            INSERT INTO TEMPORAL(COLUMNACARACTER) VALUES(REGISTRO.ADMINISTRADOR);

                        
                        ELSE

                            INSERT INTO TEMPORAL(COLUMNACARACTER) VALUES(REGISTRO.ID ||' '||REGISTRO.NOMBRE ||' '||REGISTRO.DIRECCION);
                            SALIDA:= 'PROCE';

                        END IF;


                    END LOOP;


                ELSE

                    SALIDA:= 'La CANTIDAD DE REGISTROS INGRESADOS EXCEDE EL TOTAL DE ESTUDIANTES';

                END IF;    
                

            ELSIF TRIM(UPPER(CARACTER))='P' THEN

            ELSE

                SALIDA:= 'EL CÁRACTER INGRESADO ||TRIM(CARACTER) || NO ES UNA OPCIÓN VÁLIDA';

            END IF;

        ELSE

            SALIDA:= 'LA CANTIDAD DE REGISTROS A MOSTRAR NO PUEDE SER MENOR QUE CERO.'

        END IF;
    ELSE

        RETURN SALIDA;

    END IF;


RETURN
EXCEPTION
    WHEN no_data_found THEN 
        RETURN SALIDA;


END consultar;
/
SHOW ERRORS;