/*
Entra una espcialidad y decir a travez de mensaje cuantos alumnos que estudian esa especialidad 
no estan matriculados en ningun curso

*/

DECLARE
    --Se dos variables, una recibe una especialidad, otra que me guarda el número de alumnos retornado en la consulta
    VESPECIALIDAD ESTUDIANTES.ESPECIALIDAD%TYPE:= '&Especialidad';
    CONTADOR NUMBER;
    
BEGIN
    --A los alumnos filtrados por la especialidad, se les resta los alumnos que si están matriculados para obtener los que no están
    --matriculados en esa especialidad
    SELECT COUNT(*) INTO CONTADOR FROM(
        SELECT DISTINCT ID FROM ESTUDIANTES WHERE UPPER(ESPECIALIDAD)=UPPER(VESPECIALIDAD)
        MINUS
        SELECT DISTINCT ID FROM ESTUDIANTES EST JOIN MATRICULAS MAT ON EST.ID=MAT.IDESTUDIANTE);
    
    --Escribiendo el resultado
    DBMS_OUTPUT.put_line('El numero de alumnos que estudian '|| VESPECIALIDAD || ' y no estan matriculados en ningun curso es de '||CONTADOR);

--Manejo de excepciones:
EXCEPTION
    WHEN OTHERS THEN
        NULL;

END;