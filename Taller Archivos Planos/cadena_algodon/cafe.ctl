load data
infile 'algodon.csv' 
into table EXPORTACIONES_ALGODON
fields terminated by ";"
TRAILING NULLCOLS
(ID,
ANIO,
MES,
CODIGOPAIS,
PAISDESTINO,
CODIGODEPTO,
DEPARTAMENTOORIGEN, 
PARTIDA,
CADENA, 
PRODUCTO,
CODIGOUNIDAD,
CANTIDADUNIDADES, 
VALORMILESFOBDOL,
VALORMILESPESOS,
VOLUMENTONELADAS terminated by whitespace)