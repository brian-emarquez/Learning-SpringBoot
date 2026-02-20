<h2 align="center">🗄️ Esquema de Base de Datos - Virtual Learning System</h2>

<p align="center">
  <strong>Diseño normalizado y escalable para un sistema de gestión de cursos online</strong>
</p>

---

## 📋 Descripción General

Este esquema de base de datos está diseñado para soportar una **plataforma de educación en línea** con gestión de cursos, módulos, lecciones e instructores. Implementa principios de **normalización relacional** y es totalmente compatible con **Spring Data JPA**.

---

## 🏗️ Arquitectura del Modelo de Datos

```
CATEGORIAS (1) ────────< CURSOS >────────── (1) INSTRUCTORES
                          |
                          | N
                          v
                      MODULOS
                          |
                          | N
                          v
                      LECCIONES
```

### Descripción de Relaciones

- **CATEGORIAS** → CURSOS (1:N)
  - Una categoría contiene múltiples cursos
  
- **INSTRUCTORES** → CURSOS (1:N)
  - Un instructor puede enseñar múltiples cursos

- **CURSOS** → MODULOS (1:N)
  - Un curso tiene varios módulos

- **MODULOS** → LECCIONES (1:N)
  - Un módulo contiene múltiples lecciones

---

## 📊 Entidades y Campos

### 👥 INSTRUCTORES
```sql
- id_instructor (PK)
- nombre
- email
- especialidad
- experiencia
```

### 📚 CATEGORIAS
```sql
- id_categoria (PK)
- nombre
- descripcion
```

### 🎓 CURSOS
```sql
- id_curso (PK)
- titulo
- descripcion
- id_categoria (FK)
- id_instructor (FK)
- nivel
- duracion_horas
- fecha_creacion
```

### 📖 MODULOS
```sql
- id_modulo (PK)
- nombre
- descripcion
- id_curso (FK)
- orden_secuencia
- duracion_horas
```

### 📝 LECCIONES
```sql
- id_leccion (PK)
- titulo
- contenido
- id_modulo (FK)
- duracion_minutos
- tipo_contenido (video, texto, quiz)
- orden_secuencia
```

---

## ✨ Ventajas del Diseño

✅ **Normalizado** - Cumple con 3FN (Tercera Forma Normal)  
✅ **Escalable** - Fácil agregar nuevas entidades  
✅ **No redundante** - Evita duplicación de datos  
✅ **Ideal para microservicios** - Estructura modular y desacoplada  
✅ **Spring Data JPA compatible** - Listo para implementación inmediata  
✅ **Nivel empresarial** - Usado en proyectos de tesis y producción  

---

## 🔧 Scripts SQL Base

### Crear Tablas

```sql
-- Tabla de Instructores
CREATE TABLE instructores (
    id_instructor INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE,
    especialidad VARCHAR(100),
    experiencia INT
);

-- Tabla de Categorías
CREATE TABLE categorias (
    id_categoria INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    descripcion VARCHAR(500)
);

-- Tabla de Cursos
CREATE TABLE cursos (
    id_curso INT PRIMARY KEY AUTO_INCREMENT,
    titulo VARCHAR(150) NOT NULL,
    descripcion VARCHAR(500),
    id_categoria INT,
    id_instructor INT,
    nivel VARCHAR(50),
    duracion_horas INT,
    fecha_creacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_categoria) REFERENCES categorias(id_categoria),
    FOREIGN KEY (id_instructor) REFERENCES instructores(id_instructor)
);

-- Tabla de Módulos
CREATE TABLE modulos (
    id_modulo INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(150) NOT NULL,
    descripcion VARCHAR(500),
    id_curso INT,
    orden_secuencia INT,
    duracion_horas INT,
    FOREIGN KEY (id_curso) REFERENCES cursos(id_curso)
);

-- Tabla de Lecciones
CREATE TABLE lecciones (
    id_leccion INT PRIMARY KEY AUTO_INCREMENT,
    titulo VARCHAR(150) NOT NULL,
    contenido LONGTEXT,
    id_modulo INT,
    duracion_minutos INT,
    tipo_contenido VARCHAR(50),
    orden_secuencia INT,
    FOREIGN KEY (id_modulo) REFERENCES modulos(id_modulo)
);
```

---

## 🎯 Casos de Uso Soportados

- ✅ Crear y gestionar cursos con múltiples módulos
- ✅ Asignar instructores a cursos
- ✅ Organizar contenido en lecciones progresivas
- ✅ Categorizar cursos por tema
- ✅ Rastrear tiempo de duración de cursos
- ✅ Permitir consultas complejas con JOINs
- ✅ Auditoría con timestamps

---

## 🔍 Consultas Comunes

```sql
-- Cursos por categoría
SELECT c.* FROM cursos c 
WHERE c.id_categoria = 1;

-- Módulos de un curso
SELECT m.* FROM modulos m 
WHERE m.id_curso = 5;

-- Lecciones de un módulo
SELECT l.* FROM lecciones l 
WHERE l.id_modulo = 10;

-- Cursos impartidos por un instructor
SELECT c.* FROM cursos c 
WHERE c.id_instructor = 3;

-- Estructura completa de un curso
SELECT c.titulo, m.nombre as modulo, l.titulo as leccion
FROM cursos c
JOIN modulos m ON c.id_curso = m.id_curso
JOIN lecciones l ON m.id_modulo = l.id_modulo
WHERE c.id_curso = 1
ORDER BY m.orden_secuencia, l.orden_secuencia;
```

---

## 🚀 Integración con Spring Data JPA

Este esquema está optimizado para ser usado con **Spring Data JPA**:

```java
// Ejemplo de repositorio
public interface CursoRepository extends JpaRepository<Curso, Integer> {
    List<Curso> findByCategoria(Categoria categoria);
    List<Curso> findByInstructor(Instructor instructor);
}
```

---

## 📈 Mejoras Futuras Posibles

- Agregar tabla de **ESTUDIANTES** para tracking de inscritos
- Agregar **EVALUACIONES** y **CALIFICACIONES**
- Implementar **COMENTARIOS** en lecciones
- Agregar **RECURSOS** (archivos, links externos)
- Tabla de **PROGRESO** del estudiante

---

## 📄 Notas Importantes

⚠️ Todas las claves primarias son auto-incrementables  
⚠️ Usar índices en claves foráneas para optimizar consultas  
⚠️ Implementar triggers para auditoría si es necesario  
⚠️ Considerar particionamiento para tablas grandes

---

<p align="center">
  <strong>Diseño optimizado para educación en línea escalable 📚</strong>
</p>