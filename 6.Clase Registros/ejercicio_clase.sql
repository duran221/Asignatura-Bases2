
--realizar una función o procedimiento el cual puede ser invocado en el bloque 
--que va a almacenar en la tabla temporal los id de los estudiantes,curso,grado,sus tres parciales
--sólo de aquellos que ganaron el curso, entre esos parciales habia por lo menos dos 4 o dos 5 o dos 3
--o dos 2 o dos 1

--Tactica 1, convertir en varchar2 el número a consultar, segundo usar la función subst o instr

--Sólo se le puede llamar con un parametro

CREATE OR REPLACE PROCEDURE CONSULTAR(
estudiante IN VARCHAR2(500)
)

As

    NOTA_DEFINITIVA NUMBER:=0;



BEGIN

    NOTA_DEFINITIVA:=



EXCEPTION
    WHEN OTHERs THEN
        NULL;


END;