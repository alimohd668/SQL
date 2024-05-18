-- Table Creation
CREATE TABLE Employees (
    EmployeeID INTEGER PRIMARY KEY,
    FirstName TEXT,
    LastName TEXT,
    DepartmentID INTEGER,
    Position TEXT,
    Age INTEGER
);

-- Data Population
INSERT INTO Employees VALUES (1, 'John', 'Doe', 1, 'Marketing Manager', 35);
INSERT INTO Employees VALUES (2, 'Jane', 'Smith', 2, 'Sales Representative', 28);
INSERT INTO Employees VALUES (3, 'Michael', 'Johnson', 1, 'Marketing Coordinator', 32);
INSERT INTO Employees VALUES (4, 'Emily', 'Williams', 3, 'HR Manager', 40);
INSERT INTO Employees VALUES (5, 'David', 'Brown', 2, 'Sales Manager', 38);
INSERT INTO Employees VALUES (6, 'Sarah', 'Jones', 4, 'IT Specialist', 30);
INSERT INTO Employees VALUES (7, 'Daniel', 'Taylor', 3, 'HR Coordinator', 29);
INSERT INTO Employees VALUES (8, 'Jessica', 'Anderson', 2, 'Sales Representative', 27);
INSERT INTO Employees VALUES (9, 'Matthew', 'Thomas', 1, 'Marketing Assistant', 24);
INSERT INTO Employees VALUES (10, 'Olivia', 'Martinez', 4, 'IT Manager', 42);
INSERT INTO Employees VALUES (11, 'Andrew', 'Wilson', 3, 'HR Assistant', 26);
INSERT INTO Employees VALUES (12, 'Sophia', 'Brown', 2, 'Sales Coordinator', 31);
INSERT INTO Employees VALUES (13, 'William', 'Davis', 1, 'Marketing Specialist', 33);
INSERT INTO Employees VALUES (14, 'Ava', 'Miller', 4, 'IT Assistant', 23);
INSERT INTO Employees VALUES (15, 'James', 'Anderson', 3, 'HR Representative', 36);
INSERT INTO Employees VALUES (16, 'Mia', 'Garcia', 2, 'Sales Assistant', 25);
INSERT INTO Employees VALUES (17, 'Benjamin', 'Rodriguez', 1, 'Marketing Analyst', 29);
INSERT INTO Employees VALUES (18, 'Charlotte', 'Lopez', 4, 'IT Coordinator', 34);
INSERT INTO Employees VALUES (19, 'Daniel', 'Hernandez', 3, 'HR Specialist', 27);

-- Query to Retrieve Employee Information
SELECT FirstName, LastName, Position
FROM Employees
WHERE DepartmentID = 1;

-- Update Operations
UPDATE Employees
SET Position = 'Senior Marketing Manager'
WHERE EmployeeID = 5;

-- Subquery Usage
SELECT COUNT(*)
FROM Employees
WHERE DepartmentID = 2 AND Position = 'Sales Representative';

-- Complex Query
SELECT FirstName, LastName, Position
FROM Employees
WHERE FirstName LIKE 'j%' AND DepartmentID BETWEEN 2 AND 4;

-- Aggregate Function
SELECT AVG(Age)
FROM Employees
WHERE DepartmentID = 3;