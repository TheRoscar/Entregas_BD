--Entidad planeta: permite la identificacion de destino de las naves, misiones y cargas
CREATE TABLE planeta (
    planeta_id SERIAL PRIMARY KEY,
    nombre_planeta VARCHAR(100) NOT NULL
);


-- Entidad nave: permite la identificacion de las naves espaciales
CREATE TABLE nave (
    nave_id SERIAL PRIMARY KEY,
    nombre_nave VARCHAR(100) NOT NULL,
    capacidad INT NOT NULL,
    asiento INT NOT NULL  
);


-- Entidad mision: permite la gestion de las misiones espaciales
CREATE TABLE mision (
    mision_id SERIAL PRIMARY KEY,
    nave_id INT NOT NULL,
    planeta_id INT NOT NULL,
    fecha_lanzamiento TIMESTAMP NOT NULL,
    fecha_aterrizaje TIMESTAMP,
    FOREIGN KEY (nave_id) REFERENCES nave(nave_id),
    FOREIGN KEY (planeta_id) REFERENCES planeta(planeta_id)
);

-- Entidad carga: permite la identificacion de las cargas transportadas por las naves
CREATE TABLE carga (
    carga_id SERIAL PRIMARY KEY,
    tipo_carga VARCHAR(100) NOT NULL,
    descripcion VARCHAR(255) NOT NULL,
    peso_kg DECIMAL(10, 2) NOT NULL,
    mision_id INT NOT NULL,
    FOREIGN KEY (mision_id) REFERENCES mision(mision_id)
);

-- Entidad usuario: permite la identificacion de los usuarios del sistema
CREATE TABLE usuario (
    usuario_id SERIAL PRIMARY KEY,
    nombre_usuario VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE
);

-- Entidad reserva: permite la gestion de las reservas de naves por parte de los usuarios
CREATE TABLE reserva (
    reserva_id SERIAL PRIMARY KEY,
    usuario_id INT NOT NULL,
    nave_id INT NOT NULL,
    planeta_id INT NOT NULL,
    estado_reserva BOOLEAN NOT NULL DEFAULT TRUE,
    fecha_reserva TIMESTAMP NOT NULL,
    FOREIGN KEY (usuario_id) REFERENCES usuario(usuario_id),
    FOREIGN KEY (nave_id) REFERENCES nave(nave_id),
    FOREIGN KEY (planeta_id) REFERENCES planeta(planeta_id)
);


-- Entidad notificacion: permite la gestion de las notificaciones enviadas a los usuarios
CREATE TABLE notificacion (
    notificacion_id SERIAL PRIMARY KEY,
    usuario_id INT NOT NULL,
    mensaje VARCHAR(255) NOT NULL,
    fecha_envio TIMESTAMP NOT NULL,
    leido BOOLEAN NOT NULL DEFAULT FALSE,
    FOREIGN KEY (usuario_id) REFERENCES usuario(usuario_id)
);