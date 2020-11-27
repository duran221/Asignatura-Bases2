
--Declarando una función:
CREATE OR REPLACE FUNCTION sumarNumeros(numero2 NUMBER)
--Obligatorio, indicar el tipo de dato que retorna la función:
RETURN NUMBER
IS
       --Zona de declaración de variables:
       numero1 NUMBER:=13;
       resultado NUMBER:=0;


BEGIN
       --Aquí va la lógica de la función:
       resultado:=numero1+numero2;
       
			 --Un return en el cual el dato retornado debe ser del mismo tipo que el return que se indica al principio de la función:
       return (resultado);  

--Manejo de excepciones:
EXCEPTION
       WHEN OTHERS THEN
         RETURN 0;

--Fin de la funcion
END sumarNumeros;		  
