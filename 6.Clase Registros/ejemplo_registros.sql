--la informacion de los estudiantes y la información de los cursos de aquellos que están matriculados

--Listar los parciales y la nota final
--Porcentajes 30,30,40
--Debe salir: id Apellido P1 P2 p3 Nota Final

SET SERVEROUTPUT ON;
DECLARE
--Es un registro:
TYPE LASNOTAS IS RECORD
(
P1 NUMBER(2,1),
P2 NUMBER(2,1),
P3 NUMBER(2,1)
);

TYPE INFO IS RECORD
(
ELESTUDIANTE ESTUDIANTES%ROWTYPE,
ELCURSO CURSOS%ROWTYPE,
SUSNOTAS LASNOTAS,
ELGRADO MATRICULAS.GRADO%TYPE
);

--No puedo trabajar directamente sobre el type, por eso se genera el objeto:
LAINFO INFO;

CURSOR MATRICULADOS IS SELECT DISTINCT ID,EST.APELLIDO,MAT.DEPARTAMENTO,MAT.NCURSO,MAT.GRADO 
                        FROM ESTUDIANTES EST JOIN MATRICULAS MAT ON EST.ID=MAT.IDESTUDIANTE;
                        
NOTAFINAL NUMBER:=0;

BEGIN

    DBMS_OUTPUT.PUT_LINE('ID    APELLIDO    DEPARTAMENTO    CURSO   GRADO   P1      P2     P3       NOTA FINAL');

    FOR I IN MATRICULADOS LOOP
        --Para acceder a un atributo de la estructura:
        --LAINFO.ELESTUDIANTE.NOMBRE

        --Round recibe dos valores (numero a redondear,cantidad de números a redondear)
        --Generando las notas con aleatorios, Nótese como los aleatorios se generan de la tabla DUAL.
        SELECT ROUND(DBMS_RANDOM.VALUE(0,5),1),
            ROUND(DBMS_RANDOM.VALUE(0,5),1),
            ROUND(DBMS_RANDOM.VALUE(0,5),1)            
            INTO LAINFO.SUSNOTAS.P1,LAINFO.SUSNOTAS.P2,LAINFO.SUSNOTAS.P3
            FROM DUAL;


        --Asignando el ID de el estudiante:
        LAINFO.ELESTUDIANTE.ID:= I.ID;
        LAINFO.ELESTUDIANTE.APELLIDO:= I.APELLIDO;
        LAINFO.ELCURSO.DEPARTAMENTO:= I.DEPARTAMENTO;
        LAINFO.ELCURSO.NCURSO:= I.NCURSO;
        LAINFO.ELGRADO:= I.GRADO;

        NOTAFINAL:= (LAINFO.SUSNOTAS.P1*0.3)+(LAINFO.SUSNOTAS.P2*0.3)+(LAINFO.SUSNOTAS.P3*0.3);

        DBMS_OUTPUT.PUT_LINE(LAINFO.ELESTUDIANTE.ID || '   '||LAINFO.ELESTUDIANTE.APELLIDO||'   '||
                LAINFO.ELCURSO.DEPARTAMENTO||'    '||LAINFO.ELCURSO.NCURSO||'       '||LAINFO.ELGRADO||'    '||
                LAINFO.SUSNOTAS.P1||'       '||LAINFO.SUSNOTAS.P1||'      '||LAINFO.SUSNOTAS.P3||'        '||NOTAFINAL);
    END LOOP;
    
END;
/