CREATE DATABASE ct_usm_postulaciones;
USE ct_usm_postulaciones;

-- CREACIÓN DE LAS TABLAS
CREATE TABLE Sede(
    ID_Sede INT PRIMARY KEY,
    Nombre_Sede VARCHAR(100) NOT NULL
);

CREATE TABLE Region(
    ID_Region INT PRIMARY KEY,
    Nombre_Region VARCHAR(100) NOT NULL
);

CREATE TABLE Tamanio_Empresa(
    ID_Tamanio INT PRIMARY KEY,
    Nombre_Tamanio VARCHAR(20) NOT NULL
);

CREATE TABLE Tipo_Iniciativa(
    ID_tipo_iniciativa INT PRIMARY KEY,
    Nombre_Tipo_Iniciativa VARCHAR(100) NOT NULL
);

CREATE TABLE Tipo_Persona(
    ID_Tipo_Persona INT PRIMARY KEY,
    Nombre_Tipo_Persona VARCHAR(100) NOT NULL
);

CREATE TABLE Estado_Postulacion(
    ID_Estado INT PRIMARY KEY,
    Nombre_Estado VARCHAR(100) NOT NULL
);


-- DATOS A LAS TABLAS ??
INSERT INTO Sede(ID_Sede, Nombre_Sede) VALUES
(01, 'Casa Central Valparaíso'),
(02, 'Campus Santiago San Joaquín'),
(03, 'Campus Santiago Vitacura'),
(04, 'Sede Viña del Mar'),
(05, 'Sede Concepción');

INSERT INTO Region(ID_Region, Nombre_Region) VALUES
(01, 'Arica y Parinacota'),
(02, 'Tarapacá'),
(03, 'Antofagasta'),
(04, 'Atacama'),
(05, 'Coquimbo'),
(06, 'Valparaíso'),
(07, 'Metropolitana'),
(08, 'O''Higgins'),
(09, 'Maule'),
(10, 'Ñuble'),
(11, 'Biobío'),
(12, 'La Araucanía'),
(13, 'Los Ríos'),
(14, 'Los Lagos'),
(15, 'Aysén'),
(16, 'Magallanes');

INSERT INTO Tamanio_Empresa(ID_Tamanio, Nombre_Tamanio) VALUES
(01, 'MicroEmpresa'),
(02, 'Mediana'),
(03, 'Grande');

INSERT INTO Tipo_Iniciativa(Id_Tipo_Iniciativa, Nombre_Tipo_Iniciativa) VALUES
(01, 'Nueva'),
(02, 'Existente');

INSERT INTO Tipo_Persona(ID_Tipo_Persona, Nombre_Tipo_Persona) VALUES
(01, 'Profesor'),
(02, 'Estudiante');

INSERT INTO Estado_Postulacion(ID_Estado, Nombre_Estado) VALUES
(01, 'En Revisión'),
(02, 'Aprobada'),
(03, 'Rechazada'),
(04, 'Cerrada');