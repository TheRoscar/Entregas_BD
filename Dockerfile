# Imagen base oficial de Postgres
FROM postgres:14

# Variables de entorno para crear la BD inicial
ENV POSTGRES_USER=aerogalaxy
ENV POSTGRES_PASSWORD=aerogalaxy_db 
ENV POSTGRES_DB=aerogalaxy_db

# Copiar todos los scripts SQL de inicialización
# Se ejecuta automáticamente al iniciar por primera vez el contenedor
COPY ./*.sql /docker-entrypoint-initdb.d/

EXPOSE 5432