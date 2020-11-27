CREATE TABLE  EXPORTACIONES
	(	"ID" NUMBER, 
	"ANIO" NUMBER, 
	"MES" VARCHAR2(100), 
	"CodigoPais" NUMBER, 
	"PaisDestino" VARCHAR2(100), 
	"CodigoDepto" NUMBER, 
	"DepartamentoOrigen" VARCHAR2(100), 
	"Partida" VARCHAR2(300),
	"Cadena" VARCHAR2(100), 
	"Producto" VARCHAR2(100),
	"CodigoUnidad" VARCHAR2(10),
	"CantidadUnidades" NUMBER,
	"ValorMilesFOBDol" NUMBER,
	"ValorMilesPesos" NUMBER,
	"VolumenToneladas" NUMBER
   )
/