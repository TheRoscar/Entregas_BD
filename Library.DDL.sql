-- ========================
-- Tabla Publisher
-- ========================
CREATE TABLE Publisher (
    PublisherName VARCHAR(100) PRIMARY KEY,
    Address VARCHAR(200),
    Phone VARCHAR(20)
);

-- ========================
-- Tabla Book
-- ========================
CREATE TABLE Book (
    BookID INT PRIMARY KEY,
    Title VARCHAR(200) NOT NULL,
    PublisherName VARCHAR(100),
    FOREIGN KEY (PublisherName) REFERENCES Publisher(PublisherName)
);

-- ========================
-- Tabla Book_Authors (atributo multivaluado)
-- ========================
CREATE TABLE Book_Authors (
    BookID INT,
    AuthorName VARCHAR(100),
    PRIMARY KEY (BookID, AuthorName),
    FOREIGN KEY (BookID) REFERENCES Book(BookID)
);

-- ========================
-- Tabla Library_Branch
-- ========================
CREATE TABLE Library_Branch (
    BranchID INT PRIMARY KEY,
    BranchName VARCHAR(100) NOT NULL,
    Address VARCHAR(200)
);

-- ========================
-- Tabla Book_Copies (N a N con atributo)
-- ========================
CREATE TABLE Book_Copies (
    BookID INT,
    BranchID INT,
    NoOfCopies INT DEFAULT 0,
    PRIMARY KEY (BookID, BranchID),
    FOREIGN KEY (BookID) REFERENCES Book(BookID),
    FOREIGN KEY (BranchID) REFERENCES Library_Branch(BranchID)
);

-- ========================
-- Tabla Borrower
-- ========================
CREATE TABLE Borrower (
    CardNo INT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Address VARCHAR(200),
    Phone VARCHAR(20)
);

-- ========================
-- Tabla Book_Loans
-- ========================
CREATE TABLE Book_Loans (
    BookID INT,
    BranchID INT,
    CardNo INT,
    DateOut DATE,
    DueDate DATE,
    PRIMARY KEY (BookID, BranchID, CardNo),
    FOREIGN KEY (BookID) REFERENCES Book(BookID),
    FOREIGN KEY (BranchID) REFERENCES Library_Branch(BranchID),
    FOREIGN KEY (CardNo) REFERENCES Borrower(CardNo)
);
