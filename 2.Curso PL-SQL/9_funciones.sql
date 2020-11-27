
--Declarando una funci�n:
CREATE OR REPLACE FUNCTION sumarNumeros(numero2 NUMBER)
--Obligatorio, indicar el tipo de dato que retorna la funci�n:
RETURN NUMBER
IS
       --Zona de declaraci�n de variables:
       numero1 NUMBER:=13;
       resultado NUMBER:=0;


BEGIN
       --Aqu� va la l�gica de la funci�n:
       resultado:=numero1+numero2;
       
			 --Un return en el cual el dato retornado debe ser del mismo tipo que el return que se indica al principio de la funci�n:
       return (resultado);  

--Manejo de excepciones:
EXCEPTION
       WHEN OTHERS THEN
         RETURN 0;

--Fin de la funcion
END sumarNumeros;		  
