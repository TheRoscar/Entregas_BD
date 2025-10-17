CREATE TABLE Usuario (
  usuario_id SERIAL PRIMARY KEY,
  nombre VARCHAR(100),
  apellido VARCHAR(100),
  tipo_usuario VARCHAR(50),
  condicion_especial VARCHAR(100),
  ciudad_id INT
);

CREATE TABLE Empleado (
  empleado_id SERIAL PRIMARY KEY,
  usuario_id INT,
  cargo VARCHAR(80),
  departamento VARCHAR(80),
  CONSTRAINT fk_usuario FOREIGN KEY (usuario_id)
      REFERENCES Usuario(usuario_id)
);
