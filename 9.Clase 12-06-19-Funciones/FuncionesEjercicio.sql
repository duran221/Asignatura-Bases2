--Actulizar el campo nestudiantes de la tabla cursos
CREATE OR REPLACE PROCEDURE actualizacur (
    vncurso   IN        cursos.ncurso%TYPE,
    vdept     IN        cursos.departamento%TYPE
) AS
    cant NUMBER := 0;
BEGIN
    SELECT
        COUNT(DISTINCT m.idestudiante)
    INTO cant
    FROM
        estudiantes   e
        JOIN matriculas    m ON e.id = m.idestudiante
    WHERE
        m.departamento = vdept
        AND m.ncurso = vncurso;

    UPDATE cursos
    SET
        nestudiantes = cant
    WHERE
        departamento = vdept
        AND ncurso = vncurso;

END actualizacur;
/

SHOW ERRORS;

CREATE OR REPLACE FUNCTION actualizacursos RETURN VARCHAR2 AS
    CURSOR mic IS
    SELECT
        c.departamento   AS dept,
        c.ncurso         AS ncurso
    FROM
        cursos c;

BEGIN FOR x IN mic LOOP 
execute IMMEDIATE actualizacur(x.ncurso, x.dept);
    endloop;
    RETURN 'Se actualizó el campo nestudiantes en cursos';
END actualizacursos;


