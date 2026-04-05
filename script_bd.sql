DROP DATABASE IF EXISTS ct_usm_postulaciones;
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
(1, 'Casa Central Valparaíso'),
(2, 'Campus Santiago San Joaquín'),
(3, 'Campus Santiago Vitacura'),
(4, 'Sede Viña del Mar'),
(5, 'Sede Concepción');

INSERT INTO Region(ID_Region, Nombre_Region) VALUES
(1, 'Arica y Parinacota'),
(2, 'Tarapacá'),
(3, 'Antofagasta'),
(4, 'Atacama'),
(5, 'Coquimbo'),
(6, 'Valparaíso'),
(7, 'Metropolitana'),
(8, 'O''Higgins'),
(9, 'Maule'),
(10, 'Ñuble'),
(11, 'Biobío'),
(12, 'La Araucanía'),
(13, 'Los Ríos'),
(14, 'Los Lagos'),
(15, 'Aysén'),
(16, 'Magallanes');

INSERT INTO Tamanio_Empresa(ID_Tamanio, Nombre_Tamanio) VALUES
(1, 'MicroEmpresa'),
(2, 'Mediana'),
(3, 'Grande');

INSERT INTO Tipo_Iniciativa(Id_Tipo_Iniciativa, Nombre_Tipo_Iniciativa) VALUES
(1, 'Nueva'),
(2, 'Existente');

INSERT INTO Tipo_Persona(ID_Tipo_Persona, Nombre_Tipo_Persona) VALUES
(1, 'Profesor'),
(2, 'Estudiante');

INSERT INTO Estado_Postulacion(ID_Estado, Nombre_Estado) VALUES
(1, 'En Revisión'),
(2, 'Aprobada'),
(3, 'Rechazada'),
(4, 'Cerrada');