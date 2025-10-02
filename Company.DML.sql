-- =====================================================
-- INSERCIÓN DE DATOS DE EJEMPLO
-- =====================================================

-- Empresas
INSERT INTO Company VALUES (1, '2000-05-10', 'TechCorp');
INSERT INTO Company VALUES (2, '2010-03-15', 'InnovaSoft');

-- Staff
INSERT INTO Staff VALUES (101, '1985-07-20', 'Alice Johnson', '123 Main St', 1, '2015-08-01');
INSERT INTO Staff VALUES (102, '1990-11-05', 'Bob Smith', '456 Oak Ave', 2, '2018-04-12');

-- Phones
INSERT INTO Phone VALUES ('3001234567', 101, 'Bogotá');
INSERT INTO Phone VALUES ('3019876543', 101, 'Cali');
INSERT INTO Phone VALUES ('3205556677', 102, 'Medellín');

-- Tasks
INSERT INTO Task VALUES (501, 2, 'Develop new software module');
INSERT INTO Task VALUES (502, 1, 'Database maintenance');

-- Perform (quién hace qué tarea)
INSERT INTO Perform VALUES (101, 501, '2023-02-01');
INSERT INTO Perform VALUES (102, 501, '2023-02-01');
INSERT INTO Perform VALUES (102, 502, '2023-03-15');

-- Wife
INSERT INTO Wife VALUES (101, 1, '1987-12-12', 'Clara Johnson', '123 Main St');
INSERT INTO Wife VALUES (102, 1, '1991-05-08', 'Diana Smith', '456 Oak Ave');

-- Child
INSERT INTO Child VALUES (101, 1, '2010-06-25', 'Sophie Johnson');
INSERT INTO Child VALUES (101, 2, '2013-09-14', 'Lucas Johnson');
INSERT INTO Child VALUES (102, 1, '2020-01-05', 'Emma Smith');
