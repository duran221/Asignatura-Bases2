---Bloque anónimo:
DECLARE
--Zona de declaración
Vn VARCHAR2(35):='Cristian';
Vs NUMBER(8) :=50000;
--Tres espacios de los cuales dos son decimales:
Vx NUMBER(3,2) := 1.90;

--Lo siguiente estaría malo en el DECLARE:
--Vn:=30;  Para eso está el BEGIN:
--No insert, No declare , No update
--
BEGIN
--Toda la lógica de programacion
--Todas las operaciones DML ()
--Por ahora no se usa INSERT aquí.

--Mostrando nuestro nombre en la base de dato 
    DBMS_OUTPUT.PUT_LINE('Nombre: ' || Vn || ' Salario: ' || Vs || 'Estatura: ' || Vx);

--EXCEPTION:
--Zona de control de errores:

--todo BEGIN tiene un END;
END;
