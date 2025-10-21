INSERT INTO Usuario (usuario_id, nombre, apellido, tipo_usuario, condicion, ciudad_id, codigo_postal)
VALUES
(1, 'Laura', 'Gómez', 'Cliente', 'Embarazo', 1, '760001'),
(2, 'Carlos', 'Pérez', 'Proveedor', 'Ninguna', 2, '110111'),
(3, 'María', 'Rodríguez', 'Empleado', 'Silla de ruedas', 1, '760001'),
(4, 'Jorge', 'Martínez', 'Cliente', 'Adulto mayor', 3, '050010'),
(5, 'Sofía', 'López', 'Cliente', 'Ninguna', 2, '110111'),
(6, 'Andrés', 'Castro', 'Proveedor', 'Ninguna', 3, '050010'),
(7, 'Daniela', 'Ramírez', 'Empleado', 'Ninguna', 1, '760001'),
(8, 'Luis', 'Torres', 'Cliente', 'Embarazo', 4, '170001'),
(9, 'Camila', 'Moreno', 'Empleado', 'Ninguna', 4, '170001'),
(10, 'Felipe', 'Vargas', 'Proveedor', 'Ninguna', 2, '110111');

INSERT INTO Empleado (empleado_id, usuario_id, cargo, departamento)
VALUES
(1, 3, 'Asesor de atención', 'Atención al Cliente'),
(2, 7, 'Técnico de soporte', 'Tecnología'),
(3, 9, 'Encargado de logística', 'Operaciones'),
(4, 1, 'Coordinadora de servicios', 'Administración'),
(5, 5, 'Analista de datos', 'Planeación'),
(6, 2, 'Supervisor de proveedores', 'Compras'),
(7, 4, 'Auxiliar administrativo', 'Recursos Humanos'),
(8, 6, 'Gerente de sucursal', 'Dirección'),
(9, 8, 'Asistente de mantenimiento', 'Infraestructura'),
(10, 10, 'Especialista en calidad', 'Control de Procesos');
