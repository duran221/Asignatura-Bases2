/*
2.  Hay una columna  en cursos que indica cuántos estudiantes están matriculados en un curso
Hacer un bloque anónimo que cuando se ejecute ese bloque mantenga la información de cuántos estudiantes hay por curso
es decir. 
*/
SET SERVEROUTPUT ON;
DECLARE

    --LO PRIMERO QUE YO HARIA ES DECLARAR EL CURSOR CON EL QUE VOY A RECORRER LOS CURSOS:
    CURSOR cursos IS SELECT * FROM CURSOS;

    --Una variable también que me permite identificar cuántos estudiantes hay matriculados por curso:
    num_estudiantes NUMBER:=0;

BEGIN
    --Un for que recorrerá uno a uno cada uno de los cursos: 
    --A tener en cuenta: Se compararan los nombres de los cursos ya que los id no identifican a un único curso:
    FOR curso IN cursos

        LOOP

            --Ahora queremos consultar la cantidad de estudiantes que hay matriculados en el curso consultado:
            
            SELECT COUNT(*) INTO num_estudiantes 
                FROM ESTUDIANTES EST JOIN MATRICULAS MAT ON EST.ID=MAT.IDESTUDIANTE 
                JOIN CURSOS CUR ON MAT.NCURSO=CUR.NCURSO AND MAT.DEPARTAMENTO=CUR.DEPARTAMENTO
                WHERE UPPER(CUR.DEPARTAMENTO)=UPPER(CURSO.DEPARTAMENTO)
                AND CUR.NCURSO=CURSO.NCURSO;
                
            --Y actualizamos cada uno de los valores en la tabla cursos donde el la descripción del curso coincida.
            UPDATE CURSOS SET NESTUDIANTES=num_estudiantes
                WHERE  NCURSO=curso.NCURSO AND DEPARTAMENTO=CURSO.DEPARTAMENTO;

            DBMS_OUTPUT.put_line(num_estudiantes);               

        END LOOP;
  
EXCEPTION
        WHEN OTHERS THEN
          NULL;

END;
