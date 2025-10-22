## Usa la imagen oficial de postgres en su version 14
FROM postgres:14

# Variables de entorno para la DB
ENV POSTGRES_DB=sisga_db
ENV POSTGRES_USER=sisga_user
ENV POSTGRES_PASSWORD=sisga_pass

## Copiar los archivos SQL a la imagen
## Para que cree la DB y las tablas automaticamente
COPY ./*.sql /docker-entrypoint-intidb.d/

## EXPONER el puerto
EXPOSE 5432