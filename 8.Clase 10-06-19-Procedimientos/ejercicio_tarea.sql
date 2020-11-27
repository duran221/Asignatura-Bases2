/*

Hacer un procedimiento almacenado en donde ingresa un número cualquiera y una especialidad y ese procedimiento va a 
actualizar los creditos de los estudiantes que estudian esa especialidad incrementandoles ese número que ingreso
se va a llamar ModifiqueE creditos, opera siempre y cuando esos creditos no desborden a el mínimo de creditos


A todos los estudiantes que estudian 'Musica' y que estan matriculados, les va a actualizar los creditos
teniendo en cuenta que el numero no sea inferior a el minimo de creditos, o que no sea superior a el máximo de creditos
si lo desborda mostrar un mensaje

Validar que la especialidad exista.
Los creditos desbordan en Num el valor de creditos
Mostrar un mensaje que diga cuantos procesó (Actualizó)

*/


SET SERVEROUTPUT ON;
CREATE OR REPLACE PROCEDURE ModifiqueE(
Vnumero IN NUMBER,
Vespecialidad IN ESTUDIANTES.ESPECIALIDAD%TYPE
)
AS
    --Se declaran las variables necesarias para el procedimiento:
    cantidad_especialidad NUMBER:=0;
    minimo_creditos NUMBER:=0;
    maximo_creditos NUMBER:=0;
    id_actual NUMBER:=0;
    numero_modificados NUMBER:=0;
    
    --Un cursor que me permite obtener el id sólo de los estudiantes matriculados:
    CURSOR estudiantes_matriculados IS select distinct(id) from estudiantes est join matriculas mat on est.id=mat.idestudiante;

BEGIN
    
    --Primero verifico que haya al menos un estudiante matriculado con la especialidad indicada pero además
    --en la misma consulta extraigo el MÁXIMO y MÍNIMO número de créditos para esa especialidad:
    select count(ID),MAX(EST.CREDITOS),MIN(EST.CREDITOS) INTO cantidad_especialidad,maximo_creditos,minimo_creditos
        from estudiantes est join matriculas mat on est.id=mat.idestudiante
        where TRIM(UPPER(est.especialidad))=TRIM(UPPER(Vespecialidad));
        
    --Si existe al menos un estudiante con la especialidad proporcionada
    IF cantidad_especialidad>0 THEN
         
        --Si el número de creditos no excede el mínimo y máximo de creditos en esa especialidad:   
        IF Vnumero>=minimo_creditos AND Vnumero<=maximo_creditos THEN
            
            dbms_output.put_line('HOLA');
            
            --Abriendo el cursor:
            OPEN estudiantes_matriculados;
            --El bucle recorrerá uno a uno los registros de el cursor con los id de estudiantes matriculados:
            LOOP
                
                EXIT WHEN estudiantes_matriculados%NOTFOUND; 

                --Extraigo ID por ID en la variable especificada:
                FETCH estudiantes_matriculados INTO id_actual;
                
                --Actualizo los creditos a los estudiantes que correspondan a el ID actual pero que su especialidad
                --sea equivalente a la ingresada:
                UPDATE ESTUDIANTES SET CREDITOS=CREDITOS+Vnumero
                    WHERE ID=id_actual AND TRIM(UPPER(ESPECIALIDAD))=TRIM(UPPER(Vespecialidad));

                --Si se realizó por lo menos una modificacion:  
                IF SQL%ROWCOUNT>0 THEN
                    
                    --Vaya incrementando la variable numero_modificados:
                    numero_modificados:= numero_modificados+SQL%ROWCOUNT;
                
                END IF;
                    
             
            --Fin de el bucle:       
            END LOOP;
            
            --Se cierra el cursor
            CLOSE estudiantes_matriculados;
            
            --Se muestra la información con el número de registros actualizados en el procedimiento:
            dbms_output.put_line('Registros actualizados: ' || numero_modificados);
        
        --Si el número de créditos ingresado es menor a el mínimo de creditos:
        ELSIF Vnumero<minimo_creditos THEN
            
            dbms_output.put_line('El numero de creditos ingresado desvorda en ' || TO_CHAR(Vnumero-minimo_creditos) || ' El minimo de créditos');
        
        --Si no, por ultimo significa que el número de creditos ingresado es mayor a el máximo de créditos:
        ELSE
            
            dbms_output.put_line('El numero de creditos ingresado excede en ' ||TO_CHAR(Vnumero-maximo_creditos) || ' El máximo de créditos aprovado');
        
        END IF;
     
    --Si la especialidad no se encuentra:   
    ELSE
        
        dbms_output.put_line('La especialidad ingresada no existe');
        
    END IF;


--Fin de el procedimiento:
END ModifiqueE;
/
SHOW ERRORS;

EXECUTE modifiquee(7,'Computacion');