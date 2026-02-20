<h2 align="center">Java Learning - Spring Boot 🍃</h2>

<p align="center">
  <a href="https://github.com/brian-emarquez/Learning-SpringBoot/stargazers">
    <img src="https://img.shields.io/github/stars/brian-emarquez/Learning-SpringBoot.svg?style=flat" alt="Stars">
  </a>
  <a href="https://github.com/brian-emarquez/Learning-SpringBoot/network">
    <img src="https://img.shields.io/github/forks/brian-emarquez/Learning-SpringBoot.svg?style=flat" alt="Forks">
  </a>
  <img src="https://img.shields.io/github/languages/top/brian-emarquez/Learning-SpringBoot?color=red" alt="Java">
  <img src="https://img.shields.io/github/last-commit/brian-emarquez/Learning-SpringBoot?color=darkgreen">
  <a href="https://github.com/brian-emarquez/Learning-SpringBoot/blob/main/LICENCE">
    <img src="https://img.shields.io/badge/License-MIT-blue">
  </a>
</p>

---

## 📋 Descripción

Repositorio educativo para aprender **Spring Boot** desde cero. Contiene múltiples proyectos prácticos que cubren desde conceptos básicos hasta implementación de vistas con Thymeleaf.

> Spring Boot es un framework moderno de Java que facilita la creación de aplicaciones empresariales con configuración mínima.

---

## 📦 Requisitos Previos

- **[JDK 8+](https://www.oracle.com/java/technologies/javase/javase-jdk8-downloads.html)** - Java Development Kit
- **[Maven](https://maven.apache.org/download.cgi)** - Gestor de dependencias
- **[IntelliJ IDEA](https://www.jetbrains.com/idea/download/#section=windows)** o editor de tu preferencia
- **[Lombok](https://projectlombok.org/download)** - Librería para reducir código boilerplate (opcional)

---

## 🚀 Proyectos Incluidos

| # | Proyecto | Descripción | Tecnologías |
|---|----------|-------------|-------------|
| 1 | **HolaMundo** | API REST básica con controlador Spring | Spring Boot, REST |
| 2 | **HolaMundoSpringNetbeans** | Segundo proyecto "Hola Mundo" | Spring Boot, Maven |
| 3 | **HolaMundoThymeleaf** | Aplicación web con vistas HTML | Spring Boot, Thymeleaf, HTML |

---

## ⚡ Quick Start

### 1. Clonar el repositorio
```bash
git clone https://github.com/brian-emarquez/Learning-SpringBoot.git
cd Learning-SpringBoot
```

### 2. Ejecutar un proyecto
```bash
cd HolaMundo
mvn clean install
mvn spring-boot:run
```

### 3. Acceder a la aplicación
```
http://localhost:8080/
```

---

## 🔧 Comandos Útiles

**Verificar puertos en uso:**
```bash
netstat -ano | findstr LISTENING | findstr 8080
```

**Liberar un puerto:**
```bash
taskkill /PID <PID> /F
```

**Limpiar e instalar dependencias:**
```bash
mvn clean install
```

**Ejecutar la aplicación:**
```bash
mvn spring-boot:run
```

---

## ⚙️ Configuración Personalizada

### Cambiar el puerto HTTP

En el archivo [application.properties](application.properties):

```properties
server.port=7070
```

Esto cambiará el puerto de la aplicación del 8080 (por defecto) al 7070.

---

## 📚 Estructura del Proyecto

```
Learning-SpringBoot/
├── HolaMundo/                  # Primer proyecto básico
│   ├── src/main/java/          # Código fuente
│   ├── src/test/java/          # Tests
│   └── pom.xml                 # Configuración Maven
├── HolaMundoSpringNetbeans/   # Segundo proyecto
├── HolaMundoThymeleaf/        # Proyecto con Thymeleaf
└── README.md                    # Este archivo
```

---

## 🎯 Conceptos Cubiertos

- ✅ Configuración básica de Spring Boot
- ✅ Creación de controladores REST
- ✅ Manejo de propiedades de la aplicación
- ✅ Integración con Thymeleaf para vistas dinámicas
- ✅ Maven como gestor de dependencias
- ✅ Estructura de proyectos Spring

---

## 🔗 Enlaces Relacionados

📖 [Documentación oficial de Spring Boot](https://spring.io/projects/spring-boot)  
📖 [Spring.io Generator](https://start.spring.io/)  
📚 [Learning Java Avanzado](https://github.com/brian-emarquez/Learning-Java)  
🎵 [Playlist Spotify - Java & Spring](https://open.spotify.com/playlist/1UMfu4axebdOMeM996K0xP)

---

## 💝 Apoya el Proyecto

Si este repositorio te ha sido útil, considera hacer una donación:

🎁 [Donar a través de PayPal](https://www.paypal.com/donate?hosted_button_id=98U3T62494H9Y)

---

## 📄 Licencia

Este proyecto está bajo la licencia MIT. Consulta el archivo [LICENCE](LICENCE) para más detalles.

---

<p align="center">
  <strong>Hecho con ☕ por <a href="https://github.com/brian-emarquez">Brian Emáquez</a></strong>
</p>