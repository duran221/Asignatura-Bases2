--FUNCIONES--
CREATE OR REPLACE FUNCTION buscare (pid   IN    estudiantes.id%TYPE)
RETURN VARCHAR2 AS
    salida VARCHAR2(100) := 'No se encuentra id ||TO_CHAR(PID)';
BEGIN
    SELECT
        TRIM(apellido) || ' ' || TRIM(nombre) || ''|| TO_CHAR(creditos)
        INTO salida
        FROM
        estudiantes
        WHERE
        id = pid;

    RETURN salida;
EXCEPTION
    WHEN no_data_found THEN
        RETURN salida;
END buscare;
/

SHOW ERRORS;