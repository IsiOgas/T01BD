DROP DATABASE IF EXISTS ct_usm_postulaciones;
CREATE DATABASE ct_usm_postulaciones;
USE ct_usm_postulaciones;

-- CREACIÓN DE LAS TABLAS
CREATE TABLE Sede(
    ID_Sede INT PRIMARY KEY,
    Nombre_Sede VARCHAR(100) NOT NULL
) ENGINE=InnoDB;

CREATE TABLE Region(
    ID_Region INT PRIMARY KEY,
    Nombre_Region VARCHAR(100) NOT NULL
) ENGINE=InnoDB;

CREATE TABLE Tamanio_Empresa(
    ID_Tamanio INT PRIMARY KEY,
    Nombre_Tamanio VARCHAR(20) NOT NULL
) ENGINE=InnoDB;

CREATE TABLE Tipo_Iniciativa(
    ID_tipo_iniciativa INT PRIMARY KEY,
    Nombre_Tipo_Iniciativa VARCHAR(100) NOT NULL
) ENGINE=InnoDB;

CREATE TABLE Tipo_Persona(
    ID_Tipo_Persona INT PRIMARY KEY,
    Nombre_Tipo_Persona VARCHAR(100) NOT NULL
) ENGINE=InnoDB;

CREATE TABLE Estado_Postulacion(
    ID_Estado INT PRIMARY KEY,
    Nombre_Estado VARCHAR(100) NOT NULL
) ENGINE=InnoDB;


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


-- Tablas principales
CREATE TABLE Entidad_Empresa(
    Rut_Empresa VARCHAR(10) PRIMARY KEY,
    Nombre_Empresa VARCHAR(100) NOT NULL,
    Representante_Empresa VARCHAR(100) NOT NULL,
    Mail_Representante VARCHAR(100) NOT NULL,
    Convenio_USM BOOLEAN NOT NULL,
    Telefono_Representante VARCHAR(20) NOT NULL,
    ID_Tamanio INT NOT NULL, -- SEPARADOS CON LA LINEA DE ABAJO O NOS DA ERROR
    FOREIGN KEY (ID_Tamanio) REFERENCES Tamanio_Empresa(ID_Tamanio)
) ENGINE=InnoDB;

CREATE TABLE Postulacion(
    Numero_Postulacion INT PRIMARY KEY,
    Fecha_Postulacion DATE NOT NULL, -- para guardar fechas es el date tipo aaaa-mm-dd
    Codigo_Postulacion VARCHAR(100) NOT NULL UNIQUE,
    Presupuesto_Total DECIMAL(11,5) NOT NULL,
    Nombre_Responsable_1 VARCHAR(100) NOT NULL,
    Nombre_Responsable_2 VARCHAR(100) NOT NULL,

    Rut_Empresa VARCHAR(10) NOT NULL,
    FOREIGN KEY (Rut_Empresa) REFERENCES Entidad_Empresa(Rut_Empresa),

    ID_Sede INT NOT NULL,
    FOREIGN KEY (ID_Sede) REFERENCES Sede(ID_Sede),

    ID_Region_Ejecucion INT NOT NULL,
    FOREIGN KEY (ID_Region_Ejecucion) REFERENCES Region(ID_Region),

    ID_Region_Impacto INT NOT NULL,
    FOREIGN KEY (ID_Region_Impacto) REFERENCES Region(ID_Region),

    ID_Tipo_Iniciativa INT NOT NULL,
    FOREIGN KEY (ID_Tipo_Iniciativa) REFERENCES Tipo_Iniciativa(ID_Tipo_Iniciativa),

    ID_Estado INT NOT NULL,
    FOREIGN KEY (ID_Estado) REFERENCES Estado_Postulacion(ID_Estado)
) ENGINE=InnoDB;

CREATE TABLE Iniciativa(
    ID_Iniciativa INT PRIMARY KEY AUTO_INCREMENT,
    Documentos VARCHAR(100), -- np hay q ponerle el not null porque es opcional!!
    Nombre_Iniciativa VARCHAR(100) NOT NULL,
    Objetivo_Iniciativa VARCHAR(255) NOT NULL,
    Descripcion_Soluciones VARCHAR(255) NOT NULL,
    Resultados_Esperados VARCHAR(255) NOT NULL,
    ID_Postulacion INT NOT NULL,
    FOREIGN KEY (ID_Postulacion) REFERENCES Postulacion(Numero_Postulacion)
) ENGINE=InnoDB;

CREATE TABLE Integrante_Equipo(
    ID_integrante INT PRIMARY KEY,
    Nombre_Integrante VARCHAR(100) NOT NULL,
    RUT_Integrante VARCHAR(10) NOT NULL UNIQUE,
    Departamento_Integrante VARCHAR(100) NOT NULL,
    Mail_Integrante VARCHAR(100) NOT NULL,
    Telefono_Integrante VARCHAR(20), -- tmb es opcional
    Rol_Cumple_Integrante VARCHAR(100) NOT NULL,

    ID_Tipo_Persona INT NOT NULL,
    FOREIGN KEY (ID_Tipo_persona) REFERENCES Tipo_Persona(ID_Tipo_Persona),

    ID_Sede INT NOT NULL,
    FOREIGN KEY (ID_Sede) REFERENCES Sede(ID_Sede)
) ENGINE=InnoDB;

CREATE TABLE Equipo_de_Trabajo(
    Numero_Postulacion INT NOT NULL,
    ID_integrante INT NOT NULL,
    PRIMARY KEY (Numero_Postulacion, ID_integrante), -- es una primary compuesta ambas son pk
    FOREIGN KEY (Numero_Postulacion) REFERENCES Postulacion(Numero_Postulacion),
    FOREIGN KEY (ID_integrante) REFERENCES Integrante_Equipo(ID_integrante)
) ENGINE=InnoDB;

CREATE TABLE Etapa_Cronograma(
    ID_Postulacion INT NOT NULL,
    Etapa INT NOT NULL,
    Entregable VARCHAR(100) NOT NULL,
    Plazos INT NOT NULL,

    PRIMARY KEY (ID_Postulacion, Etapa),
    FOREIGN KEY (ID_Postulacion) REFERENCES Postulacion(Numero_Postulacion)
) ENGINE=InnoDB;

INSERT INTO Integrante_Equipo (ID_integrante,Nombre_Integrante, RUT_Integrante,Departamento_Integrante,Mail_Integrante,Telefono_Integrante,Rol_Cumple_Integrante, ID_Tipo_Persona, ID_Sede)
VALUES
    ('1','Felipe','20123456-7','obras civiles','fel.s@gmail.cl','911223344', 'dibujante','2','1'),
    ('2','francisco','21000001-k','obras civiles','fra.l@gmail.cl','955667788','calculista', '2','1'),
    ('3','nicolas','20111222-1', 'obras civiles', 'nic.u@gmail.cl', '999110101', 'presupuestos','2','1'),
    ('4','diego','20800900-9','obras civiles', 'die.d@gmail.cl', '922023303', 'supervisor', '2', '1'),
    ('5','daniel','21001002-k','obras civiles', 'dan.z@gmail.cl', '912341234', 'disenador', '2', '1'),
    ('6','sergio','12000000-9','obras civiles', 'sergio.d@gmail.cl', '999999999', 'responsable1', '1', '1'),
    ('7','francisco','12000111-1','obras civiles', 'fran.d@gmail.cl', '911111111', 'responsable2', '1', '1'),
    ('8','catalina','12000222-2','obras civiles', 'catalina.d@gmail.cl', '922222222', 'supervisora', '1', '1');

INSERT INTO Entidad_Empresa(Rut_Empresa, Nombre_Empresa, Representante_Empresa, Mail_Representante, Convenio_USM, Telefono_Representante, ID_Tamanio)
VALUES
    ('71202909-9', 'FYF inmobiliaria', 'Felipe Salazar', 'felipe.sal@fyf.cl','1', '993769090','1');

INSERT INTO Postulacion(Numero_Postulacion, Fecha_Postulacion, Codigo_Postulacion, Presupuesto_Total, Nombre_Responsable_1, Nombre_Responsable_2, Rut_Empresa, ID_Sede, ID_Region_Ejecucion, ID_Region_Impacto, ID_Tipo_Iniciativa, ID_Estado)
VALUES
    ('1', '2026-04-18', 'A12','100000000','sergio','francisco','71202909-9','1','1','2','1','1');

INSERT INTO Iniciativa(Documentos, Nombre_Iniciativa, Objetivo_Iniciativa, Descripcion_Soluciones, Resultados_Esperados,ID_Postulacion)
VALUES
    ('planos detalle de refuerzo en aislacion', 'modernizacion de aislacion', 'viviendas sociales antiguas no cumplen con los estandares de aislacionmodernos', 'cambiar aislacion danada y reforzar con soluciones actuales','mejorar la aislacion termica de viviendas sociales','1');

INSERT INTO Etapa_Cronograma (ID_Postulacion, Etapa, Entregable, Plazos)
VALUES
    ('1', '1','lista de duenos y direcciones', '2'),
    ('1', '2','lista de danos de cada vivienda', '1'),
    ('1', '3','especificaciones tecnicas de solucion', '1'),
    ('1', '4','cada casa con la aislacion modernizada', '1'),
    ('1', '5','planos y memoria de calculo del resultado', '1');

INSERT INTO Equipo_de_Trabajo(Numero_Postulacion, ID_integrante)
VALUES
    ('1', '1'),
    ('1', '2'),
    ('1', '3'),
    ('1', '4'),
    ('1', '5'),
    ('1', '6'),
    ('1', '7'),
    ('1', '8');

