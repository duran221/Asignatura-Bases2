------------AREA DE BORRADO DE TABLAS-----------------
DROP TABLE TEMPORAL;
DROP TABLE ERRORES;
DROP TABLE CAMBIOS;
DROP TABLE ESPECIALIDADES;
DROP TABLE MATRICULAS;
DROP TABLE CURSOS;
DROP TABLE AULAS;
DROP TABLE ESTUDIANTES;



---------------AREA DE CREACIÓN DE TABLAS------------
CREATE TABLE ESTUDIANTES ( 
    Id NUMBER,
    nombre CHAR(20),
    apellido CHAR(20),
    especialidad CHAR(30),
    creditos NUMBER,
    CONSTRAINT "PK_ESTUDIANTES" PRIMARY KEY (Id) );


CREATE TABLE AULAS (
    Idaula NUMBER(5),
    edificio CHAR(15),
    numeroaula NUMBER(4),
    numeroasientos NUMBER(4),
    descripcionaula CHAR(50),
    CONSTRAINT "PK_AULAS" PRIMARY KEY (Idaula)
);


CREATE TABLE ESPECIALIDADES (
    Especialidad CHAR(30),
    totalcreditos NUMBER,
    totalestudiantes NUMBER    
);

CREATE TABLE CURSOS (
    Departamento CHAR(3),
    ncurso NUMBER(3),
    descripcioncurso CHAR(20),
    cupoestudiantes NUMBER(3),
    nestudiantes NUMBER(3),
    ncreditos NUMBER(1),
    idaula NUMBER(5),
    CONSTRAINT "PK_CURSOS" PRIMARY KEY (Departamento,ncurso)

);

CREATE TABLE MATRICULAS (
    Idestudiante NUMBER NOT NULL,
    departamento CHAR(3) NOT NULL,
    ncurso NUMBER(3) NOT NULL,
    grado CHAR(1)
);

CREATE TABLE CAMBIOS (
    Tipo CHAR(1) NOT NULL,
    razon CHAR(8) NOT NULL,
    fecha DATE NOT NULL,
    antiguoestudiante NUMBER(5),
    antiguodepartamento CHAR(3),
    antiguocurso NUMBER(3),
    antiguogrado CHAR(1),
    nuevoestudiante NUMBER(5),
    nuevodepartamento CHAR(5),
    nuevocurso NUMBER(3),
    nuevogrado CHAR(1)

);

CREATE TABLE ERRORES(
    Codigo NUMBER,
    mensaje VARCHAR2(200),
    informacion VARCHAR2(200)

);

CREATE TABLE TEMPORAL(
    Columnanumerica NUMBER,
    columnacaracter VARCHAR2(200)
);


---------------------AREA DE INGRESO DE RESTRICCIONES FORANEAS---------------------

--Restricciones foraneas de la tabla CURSOS
ALTER TABLE CURSOS ADD CONSTRAINT "FK_AULAS" FOREIGN KEY (idaula) REFERENCES AULAS (Idaula);

--Restricciones foraneas de la tabla MATRICULAS:
ALTER TABLE MATRICULAS ADD CONSTRAINT "FK_ESTUDIANTES" FOREIGN KEY (Idestudiante) REFERENCES ESTUDIANTES(Id);
ALTER TABLE MATRICULAS ADD CONSTRAINT "FK_CURSOS" FOREIGN KEY(departamento,ncurso) REFERENCES CURSOS(departamento,ncurso);


-----------------AREA DE INGRESO DE RESTRICCIONES 'CHECK'---------------------------
ALTER TABLE MATRICULAS ADD CONSTRAINT "CK_MATRICULAS" CHECK (grado IN('A','B','C','D','E'));
