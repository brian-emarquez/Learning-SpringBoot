CREATE DATABASE crudREST;
GO

USE crudREST;
GO

CREATE TABLE categorias (
    id BIGINT IDENTITY(1,1) PRIMARY KEY,
    nombre NVARCHAR(100) NOT NULL,
    descripcion NVARCHAR(255),
    estado BIT NOT NULL DEFAULT 1,
    fecha_creacion DATETIME2 NOT NULL DEFAULT SYSDATETIME()
);

CREATE TABLE instructores (
    id BIGINT IDENTITY(1,1) PRIMARY KEY,
    nombres NVARCHAR(100) NOT NULL,
    apellidos NVARCHAR(100) NOT NULL,
    email NVARCHAR(150) NOT NULL UNIQUE,
    especialidad NVARCHAR(150),
    estado BIT NOT NULL DEFAULT 1,
    fecha_creacion DATETIME2 NOT NULL DEFAULT SYSDATETIME()
);

CREATE TABLE cursos (
    id BIGINT IDENTITY(1,1) PRIMARY KEY,
    titulo NVARCHAR(150) NOT NULL,
    descripcion NVARCHAR(500) NOT NULL,
    duracion_horas INT NOT NULL CHECK (duracion_horas > 0),
    nivel NVARCHAR(50) NOT NULL, -- Básico, Intermedio, Avanzado
    categoria_id BIGINT NOT NULL,
    instructor_id BIGINT NOT NULL,
    precio DECIMAL(10,2) NOT NULL DEFAULT 0,
    estado BIT NOT NULL DEFAULT 1,
    fecha_creacion DATETIME2 NOT NULL DEFAULT SYSDATETIME(),
    fecha_actualizacion DATETIME2,

    CONSTRAINT fk_curso_categoria
        FOREIGN KEY (categoria_id) REFERENCES categorias(id),

    CONSTRAINT fk_curso_instructor
        FOREIGN KEY (instructor_id) REFERENCES instructores(id)
);

CREATE TABLE modulos (
    id BIGINT IDENTITY(1,1) PRIMARY KEY,
    curso_id BIGINT NOT NULL,
    titulo NVARCHAR(150) NOT NULL,
    orden INT NOT NULL,
    estado BIT NOT NULL DEFAULT 1,

    CONSTRAINT fk_modulo_curso
        FOREIGN KEY (curso_id) REFERENCES cursos(id)
        ON DELETE CASCADE
);

CREATE TABLE lecciones (
    id BIGINT IDENTITY(1,1) PRIMARY KEY,
    modulo_id BIGINT NOT NULL,
    titulo NVARCHAR(150) NOT NULL,
    contenido NVARCHAR(MAX),
    duracion_minutos INT NOT NULL CHECK (duracion_minutos > 0),
    orden INT NOT NULL,
    tipo NVARCHAR(50) NOT NULL, -- Video, PDF, Quiz
    estado BIT NOT NULL DEFAULT 1,

    CONSTRAINT fk_leccion_modulo
        FOREIGN KEY (modulo_id) REFERENCES modulos(id)
        ON DELETE CASCADE
);

CREATE INDEX idx_cursos_categoria ON cursos(categoria_id);
CREATE INDEX idx_cursos_instructor ON cursos(instructor_id);
CREATE INDEX idx_modulos_curso ON modulos(curso_id);
CREATE INDEX idx_lecciones_modulo ON lecciones(modulo_id);

INSERT INTO categorias (nombre, descripcion)
VALUES 
('Programación', 'Cursos de desarrollo de software'),
('Diseño', 'Diseño gráfico y UX/UI'),
('DevOps', 'Infraestructura y despliegue');

INSERT INTO instructores (nombres, apellidos, email, especialidad)
VALUES
('Juan', 'Pérez', 'juan.perez@email.com', 'Spring Boot'),
('Ana', 'Torres', 'ana.torres@email.com', 'UX/UI');

INSERT INTO cursos (titulo, descripcion, duracion_horas, nivel, categoria_id, instructor_id, precio)
VALUES
('Spring Boot Profesional',
 'API REST y Microservicios con Java',
 40, 'Avanzado', 1, 1, 120.00);

 INSERT INTO modulos (curso_id, titulo, orden)
VALUES
(1, 'Introducción a Spring Boot', 1),
(1, 'JPA y Hibernate', 2),
(1, 'Microservicios', 3);

INSERT INTO lecciones (modulo_id, titulo, contenido, duracion_minutos, orden, tipo)
VALUES
(1, '¿Qué es Spring Boot?', 'Conceptos base', 20, 1, 'Video'),
(1, 'Arquitectura', 'Capas y patrones', 30, 2, 'Video');