-- Insertar Publishers
INSERT INTO Publisher VALUES ('Pearson', 'New York, USA', '123-4567');
INSERT INTO Publisher VALUES ('McGraw-Hill', 'Boston, USA', '987-6543');

-- Insertar Books
INSERT INTO Book VALUES (1, 'Database Systems', 'Pearson');
INSERT INTO Book VALUES (2, 'Operating Systems', 'McGraw-Hill');

-- Autores
INSERT INTO Book_Authors VALUES (1, 'Ramakrishnan');
INSERT INTO Book_Authors VALUES (1, 'Gehrke');
INSERT INTO Book_Authors VALUES (2, 'Silberschatz');

-- Sucursales
INSERT INTO Library_Branch VALUES (101, 'Central', 'Downtown');
INSERT INTO Library_Branch VALUES (102, 'North', 'Uptown');

-- Copias de libros
INSERT INTO Book_Copies VALUES (1, 101, 5);
INSERT INTO Book_Copies VALUES (1, 102, 2);
INSERT INTO Book_Copies VALUES (2, 101, 3);

-- Prestatarios
INSERT INTO Borrower VALUES (1001, 'Alice', 'Main St', '555-1234');
INSERT INTO Borrower VALUES (1002, 'Bob', 'Second St', '555-5678');

-- Préstamos
INSERT INTO Book_Loans VALUES (1, 101, 1001, '2025-09-20', '2025-10-05');
INSERT INTO Book_Loans VALUES (2, 101, 1002, '2025-09-25', '2025-10-10');
