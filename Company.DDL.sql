-- =====================================================
-- CREACIÓN DE TABLAS
-- =====================================================

CREATE TABLE Company (
    idCompany     INT PRIMARY KEY,
    dof           DATE,
    nameCompany   VARCHAR(100)
);

CREATE TABLE Staff (
    idStaff       INT PRIMARY KEY,
    dob           DATE,
    nameStaff     VARCHAR(100),
    address       VARCHAR(150),
    idCompany     INT,
    doi           DATE,
    FOREIGN KEY (idCompany) REFERENCES Company(idCompany)
);

CREATE TABLE Phone (
    phoneNumber   VARCHAR(20),
    idStaff       INT,
    region        VARCHAR(50),
    PRIMARY KEY (phoneNumber, idStaff),
    FOREIGN KEY (idStaff) REFERENCES Staff(idStaff)
);

CREATE TABLE Task (
    idTask        INT PRIMARY KEY,
    staffRequired INT,
    description   VARCHAR(200)
);

CREATE TABLE Perform (
    idStaff       INT,
    idTask        INT,
    dot           DATE,
    PRIMARY KEY (idStaff, idTask),
    FOREIGN KEY (idStaff) REFERENCES Staff(idStaff),
    FOREIGN KEY (idTask) REFERENCES Task(idTask)
);

CREATE TABLE Wife (
    idStaff       INT,
    idWife        INT,
    dob           DATE,
    nameWife      VARCHAR(100),
    address       VARCHAR(150),
    PRIMARY KEY (idStaff, idWife),
    FOREIGN KEY (idStaff) REFERENCES Staff(idStaff)
);

CREATE TABLE Child (
    idStaff       INT,
    idChild       INT,
    dob           DATE,
    nameChild     VARCHAR(100),
    PRIMARY KEY (idStaff, idChild),
    FOREIGN KEY (idStaff) REFERENCES Staff(idStaff)
);
