load data
infile 'archivo_limpio3.csv' 
into table EXPORTACIONES
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