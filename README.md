# **README IMPLEMENTACIÓN CONTENEDORES POSTGRES Y PGADMIN**

**Curso:** 750006-C Bases de Datos Grupo 01  
**Universidad del Valle || 2025 - 2**  
**Nombre Estudiante:** Oscar Andrés Rengifo Bustos  
**Código:** 2416602  

---

## 🧩 **Descripción general**
La parte práctica implementa el despliegue de un entorno de bases de datos con **Docker**, donde se utiliza:

- **PostgreSQL** como motor de bases de datos.  
- **pgAdmin 4** como herramienta de administración.

---

## ⚙️ **Requisitos**

- Implementación de **Docker Engine** o **Docker Desktop** en el sistema  
  *(para este ejemplo práctico se utilizó una máquina virtual WSL con Ubuntu 24.04)*.  
- Conexión a Internet para la descarga de imágenes de contenedores.

---

## 🚀 **Implementación**

### 1️⃣ Descarga de imágenes de contenedores  
(PostgreSQL y pgAdmin) en caso de ser necesario.

---

### 2️⃣ Ejecución de comando para establecer el contenedor de la base de datos

```bash
docker run --name aerogalaxy -e POSTGRES_USER=aerogalaxy -e POSTGRES_PASSWORD=aerogalaxy_db -p 5432:5432 -d postgres:14
```

---

### 3️⃣ Ejecución de comando para establecer el contenedor de pgAdmin

```bash
docker run --rm -p 5050:80 --link aerogalaxy:aerogalaxy -e "PGADMIN_DEFAULT_EMAIL=usuario@aerogalaxy.com" -e "PGADMIN_DEFAULT_PASSWORD=galaxy#445" -d dpage/pgadmin4
```

---

### 4️⃣ Verificación de ejecución de contenedores

```bash
docker ps -a
```

---

### 5️⃣ Acceso a pgAdmin

- Abrir en el navegador la URL: **http://localhost:5050**  
- Esperar unos segundos mientras se inicializa el servicio.  
- Ingresar con las credenciales configuradas:  
  - **Usuario:** usuario@aerogalaxy.com 
  - **Contraseña:** galaxy#445 

---

### 6️⃣ Establecer conexión con el contenedor PostgreSQL

- Verificar el nombre del contenedor (en este caso `aerogalaxy').  
- En **Add Server**, configurar:
  - Nombre del servidor  
  - Dirección IP del host (consultar con `ifconfig` en Linux)  
  - Usuario y contraseña del contenedor:  
    - **Usuario:** aerogalaxy 
    - **Contraseña:** aerogalaxy_db

---

### 7️⃣ Implementación de DDL y DML (Estructura y registros)

- En la base de datos creada, abrir **Query Tools (Herramientas de consulta)**.  
- Ejecutar las instrucciones de creación de tablas (archivo **aerogalaxy.ddl.sql**).  
- Ejecutar las instrucciones de inserción de registros (archivo **aerogalaxy.dml.sql**).

---

### 8️⃣ Consulta de registros en la base de datos

Ejecutar en el **Query Tool**:

```sql
SELECT * FROM usuario;
SELECT * FROM empleado;
```

---

📄 *Fin del documento — README.md*
