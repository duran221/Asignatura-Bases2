load data 
infile 'prueba.csv' 
into table prueba
fields terminated by ";"
TRAILING NULLCOLS
(ID,
NOMBRE, 
DIRECCION, 
BARRIO, 
TELEFONO, 
CANTIDADCAMAS, 
CANTIDADHABITACIONES, 
PISCINA, 
ADMINISTRADOR, 
TELEFONO2 terminated by whitespace)