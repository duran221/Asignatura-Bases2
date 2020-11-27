CREATE OR REPLACE PROCEDURE PUNTO_1(
ORIGEN IN EXPORTACIONES.DEPARTAMENTOORIGEN%TYPE
)
AS
    
    CURSOR TOTAL_ANIO IS SELECT ANIO,PAISDESTINO,DEPARTAMENTOORIGEN,sum(VALORMILEsFOBDOL) SUMA_ANIO
        FROM EXPORTACIONES
        WHERE ANIO>=2012
        GROUP BY ANIO,PAISDESTINO,DEPARTAMENTOORIGEN
            HAVING TRIM(UPPER(DEPARTAMENTOORIGEN))=TRIM(UPPER(ORIGEN))
            ORDER BY ANIO DESC,PAISDESTINO;
            
    
    CURSOR TOTAL_SEMESTRE_1 IS SELECT ANIO,PAISDESTINO,DEPARTAMENTOORIGEN,sum(VALORMILEsFOBDOL) SUMA_SEMESTRE1
        FROM EXPORTACIONES
        WHERE TRIM(UPPER(MES)) IN('ENERO','FEBRERO','MARZO','ABRIL','MAYO','JUNIO')  AND ANIO>=2012
        GROUP BY ANIO,PAISDESTINO,DEPARTAMENTOORIGEN
            HAVING TRIM(UPPER(DEPARTAMENTOORIGEN))=TRIM(UPPER(ORIGEN))
            ORDER BY ANIO DESC,PAISDESTINO;
         
            
    CURSOR TOTAL_SEMESTRE_2 IS SELECT ANIO,PAISDESTINO,DEPARTAMENTOORIGEN,sum(VALORMILEsFOBDOL) SUMA_SEMESTRE2
        FROM EXPORTACIONES
        WHERE TRIM(UPPER(MES)) IN('JULIO','AGOSTO','SEPTIEMBRE','OCTUBRE','NOVIEMBRE','DICIEMBRE') AND ANIO>=2012
        GROUP BY ANIO,PAISDESTINO,DEPARTAMENTOORIGEN
            HAVING TRIM(UPPER(DEPARTAMENTOORIGEN))=TRIM(UPPER(ORIGEN))
            ORDER BY ANIO DESC,PAISDESTINO;
            

    --El porcentaje de ValorMileSFOBDol que Se va calculando:
    PORCENTAJE NUMBER(10,3):=0;
    
    TotalMiles_anio NUMBER:=0;
    
BEGIN
    DBMS_OUTPUT.PUT_LINE('AÑO           SEMESTRE            PAISDESTINO         DEPARTAMENTOORIGEN              PORCENTAJE');
    FOR VALOR_ANIO IN TOTAL_ANIO
    LOOP
    
        FOR SEMESTRE1 IN TOTAL_SEMESTRE_1
        LOOP
            IF VALOR_ANIO.ANIO=SEMESTRE1.ANIO AND VALOR_ANIO.PAISDESTINO=SEMESTRE1.PAISDESTINO THEN
                
                PORCENTAJE:= ROUND((SEMESTRE1.SUMA_SEMESTRE1*100)/VALOR_ANIO.SUMA_ANIO,3);
                
                DBMS_OUTPUT.PUT_LINE(SEMESTRE1.ANIO||'      '||'ENERO-JUNIO'||''||'         '||SEMESTRE1.PAISDESTINO||
                '           '||SEMESTRE1.DEPARTAMENTOORIGEN||
                '           '||PORCENTAJE);

                
            END IF;
        
        END LOOP;
        
        FOR SEMESTRE2 IN TOTAL_SEMESTRE_2
        LOOP
        
            IF VALOR_ANIO.ANIO=SEMESTRE2.ANIO AND VALOR_ANIO.PAISDESTINO=SEMESTRE2.PAISDESTINO THEN
                    
                PORCENTAJE:= ROUND((SEMESTRE2.SUMA_SEMESTRE2*100)/VALOR_ANIO.SUMA_ANIO,3);
                DBMS_OUTPUT.PUT_LINE(SEMESTRE2.ANIO||'          '||'JULIO-DICIEMBRE         '||SEMESTRE2.PAISDESTINO||'      '||
                SEMESTRE2.DEPARTAMENTOORIGEN||
                '       '||PORCENTAJE);
                
            END IF;
                
        END LOOP;
        
    END LOOP;

EXCEPTION
    
    WHEN OTHERS THEN
    
        NULL;
END PUNTO_1;
/
SHOW ERRORS;

EXECUTE PUNTO_1('CaldaS'); --meibyhernandezmorales@gmail.com