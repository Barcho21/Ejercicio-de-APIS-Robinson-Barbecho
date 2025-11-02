# Proyecto: Ejercicio de APIS - PetStore (Karate + Screenplay)

## 1️ Prerrequisitos

Antes de ejecutar el proyecto, asegúrate de tener instalado y configurado lo siguiente:

- Sistema Operativo: Windows 10 o superior  
- IDE: IntelliJ IDEA (versión 2023.1 o superior)  
- JDK: versión 1.8 o superior (debe estar configurado en la variable de entorno JAVA_HOME)  
- Maven: versión 3.8.6 o superior (debe estar configurado en la variable de entorno PATH)  
- Karate Framework: integrado mediante dependencias Maven  
- Conexión a Internet (requerida para conectarse con la API pública de PetStore)

---

## 2️ Comandos de instalación

Ejecuta los siguientes comandos en la raíz del proyecto para instalar dependencias y preparar el entorno:

```bash
mvn clean install -DskipTests
```

Este comando descargará automáticamente todas las dependencias declaradas en el archivo `pom.xml`.

---

## 3️ Instrucciones para ejecutar los test

Para correr los tests del proyecto y generar el reporte automático en HTML, utiliza el siguiente comando según su sistema operativo:

### Windows:
```bash
mvn clean test -Dtest=runners.PetStoreRunner && start target/karate-reports/karate-summary.html
```

### Linux / macOS:
```bash
mvn clean test -Dtest=runners.PetStoreRunner && xdg-open target/karate-reports/karate-summary.html
```

El reporte se generará automáticamente en la carpeta:
```
target/karate-reports/karate-summary.html
```

y se abrirá en el navegador mostrando el resultado de cada escenario ejecutado.

---

## 4 Información adicional

### Falla conocida del API pública de PetStore

Durante las ejecuciones, se identificó una intermitencia en el entorno público de PetStore (`https://petstore.swagger.io/v2`), la cual afecta las peticiones `GET` y `DELETE`.  
El comportamiento observado es el siguiente:

- La API no garantiza persistencia de los recursos creados mediante `POST /pet`.  
  Esto significa que las mascotas creadas son eliminadas automáticamente por el servidor luego de unos segundos o por reinicios del entorno compartido.  
- Como consecuencia, las peticiones subsecuentes (`GET /pet/{id}` o `DELETE /pet/{id}`) pueden responder con:
  ```json
  {
    "code": 1,
    "type": "error",
    "message": "Pet not found"
  }
  ```
  con un HTTP 404 Not Found, aunque la mascota haya sido creada correctamente.


## Referencia

Repositorio del proyecto en GitHub:  
https://github.com/Barcho21/Ejercicio-de-APIS-Robinson-Barbecho

