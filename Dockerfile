# Imagen base oficial de Postgres
FROM postgres:15

# Variables de entorno para crear la BD inicial
ENV POSTGRES_USER=un_usuario
ENV POSTGRES_PASSWORD=un4_contr4s3n14
ENV POSTGRES_DB=bancaria

# Copiar todos los scripts SQL de inicialización
# Se ejecuta automáticamente al iniciar por primera vez el contenedor
COPY ./*.sql /docker-entrypoint-initdb.d/

EXPOSE 5432