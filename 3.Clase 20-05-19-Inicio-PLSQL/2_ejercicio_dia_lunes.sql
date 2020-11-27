
1--Primer ejercicio:
--Hacer un bloque anónimo que diga, esta en lo cierto, si el dia de hoy es lunes:
--Para manejo de dias, el primer dia empieza con Domingo 1


set SERVEROUTPUT ON;
BEGIN
    ---TO_CHAR PASA A CADENA (Pase a cadena, el SYSDATE) y devuelvamex
    IF TO_CHAR(SYSDATE,'Day')='Lunes' THEN
        DBMS_OUTPUT.PUT_LINE('Esta en lo cierto');
    ELSE
    
        DBMS_OUTPUT.PUT_LINE('Esta en lo cierto');

    END IF;

END;
