-- Archivo: 01_books.dml.sql
-- Descripción: Sentencias DML de ejemplo para poblar las tablas definidas en 00_books.ddl.sql
-- Instrucciones: ejecutar con psql: psql -d <tu_base> -f database/01_books.dml.sql

BEGIN;

-- 1) Usuarios (tuser)
INSERT INTO tuser (username, dob, update_at, activo)
VALUES
	(ROW('Juan','Pérez')::fullname, '1985-03-15 00:00:00'::timestamp, NOW(), TRUE),
	(ROW('María','Gómez')::fullname, '1992-07-22 00:00:00'::timestamp, NOW(), TRUE),
	(ROW('Ana','López')::fullname, '1978-11-02 00:00:00'::timestamp, NOW(), FALSE);

-- 2) Correos de usuario (user_email)
INSERT INTO user_email (id_user, email, is_primary)
VALUES
	(1, 'juan.perez@example.com', TRUE),
	(1, 'jperez@otrodominio.com', FALSE),
	(2, 'maria.gomez@example.com', TRUE),
	(3, 'ana.lopez@example.com', TRUE);

-- 3) Autores
INSERT INTO author (author_name)
VALUES
	(ROW('Gabriel','García')::fullname),
	(ROW('Isabel','Allende')::fullname),
	(ROW('Jorge','Luis')::fullname);

-- 4) Libros
INSERT INTO book (name_book, sinopsis, isbn, publish_date, update_at)
VALUES
	('Cien años de soledad', 'Novela que recorre varias generaciones de la familia Buendía.', '9780307474728', '1967-06-05 00:00:00'::timestamp, NOW()),
	('La casa de los espíritus', 'Saga familiar con elementos realistas y fantásticos.', '9780553383802', '1982-01-01 00:00:00'::timestamp, NOW()),
	('Relatos cortos', 'Colección de relatos variados.', '9781234567897', '2000-05-15 00:00:00'::timestamp, NOW());

-- 5) Relación libro - autor (book_author)
-- Asignamos: libro 1 -> autor 1 (principal), libro 2 -> autor 2 (principal), libro 3 -> autor 3
INSERT INTO book_author (id_book, id_author, is_main)
VALUES
	(1, 1, TRUE),
	(2, 2, TRUE),
	(3, 3, TRUE);

-- 6) Préstamos (borrow)
INSERT INTO borrow (id_book, id_user, borrow_date, due_date)
VALUES
	(1, 1, NOW(), NOW() + INTERVAL '14 days'),
	(2, 2, NOW(), NOW() + INTERVAL '7 days');

COMMIT;

-- Alinear secuencias (Postgres): ajustar los nombres de secuencia si difieren
SELECT setval('tuser_id_user_seq', COALESCE((SELECT MAX(id_user) FROM tuser), 0), TRUE);
SELECT setval('user_email_id_user_email_seq', COALESCE((SELECT MAX(id_user_email) FROM user_email), 0), TRUE);
SELECT setval('author_id_author_seq', COALESCE((SELECT MAX(id_author) FROM author), 0), TRUE);
SELECT setval('book_id_book_seq', COALESCE((SELECT MAX(id_book) FROM book), 0), TRUE);
SELECT setval('borrow_id_borrow_seq', COALESCE((SELECT MAX(id_borrow) FROM borrow), 0), TRUE);

-- Notas:
-- - Si las secuencias en tu instalación tienen nombres distintos, reemplaza los nombres usados arriba.
-- - Ajusta los valores de ejemplo según tus necesidades (fechas, ISBN, nombres, etc.).

