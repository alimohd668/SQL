-- Table Creation
CREATE TABLE Sales (
    SalesID INTEGER PRIMARY KEY,
    ProductID INTEGER,
    SaleDate DATE,
    QuantitySold INTEGER,
    SaleAmount REAL,
    CustomerID INTEGER
);

CREATE TABLE Customers (
    CustomerID INTEGER PRIMARY KEY,
    FirstName TEXT,
    LastName TEXT,
    Email TEXT,
    Phone TEXT
);

-- Data Population
INSERT INTO Sales VALUES (1, 101, '2022-01-01', 10, 100.0, 1);
INSERT INTO Customers VALUES (1, 'John', 'Doe', 'john.doe@gmail.com', '1234567890');

INSERT INTO Sales VALUES (2, 102, '2022-01-02', 5, 50.0, 2);
INSERT INTO Customers VALUES (2, 'Jane', 'Smith', 'jane.smith@gmail.com', '9876543210');

INSERT INTO Sales VALUES (3, 103, '2022-01-03', 8, 80.0, 3);
INSERT INTO Customers VALUES (3, 'Michael', 'Johnson', 'michael.johnson@gmail.com', '5555555555');

INSERT INTO Sales VALUES (4, 104, '2022-01-04', 12, 120.0, 4);
INSERT INTO Customers VALUES (4, 'Robert', 'Johnson', 'robert.johnson@gmail.com', '2222222222');

INSERT INTO Sales VALUES (5, 105, '2022-01-05', 7, 70.0, 5);
INSERT INTO Customers VALUES (5, 'Emily', 'Brown', 'emily.brown@gmail.com', '3333333333');

INSERT INTO Sales VALUES (6, 106, '2022-01-06', 9, 90.0, 6);
INSERT INTO Customers VALUES (6, 'William', 'Jones', 'william.jones@gmail.com', '4444444444');

INSERT INTO Sales VALUES (7, 107, '2022-01-07', 6, 60.0, 7);
INSERT INTO Customers VALUES (7, 'Olivia', 'Davis', 'olivia.davis@gmail.com', '5555555555');

INSERT INTO Sales VALUES (8, 108, '2022-01-08', 11, 110.0, 8);
INSERT INTO Customers VALUES (8, 'James', 'Miller', 'james.miller@gmail.com', '6666666666');

INSERT INTO Sales VALUES (9, 109, '2022-01-09', 4, 40.0, 9);
INSERT INTO Customers VALUES (9, 'Sophia', 'Wilson', 'sophia.wilson@gmail.com', '7777777777');

INSERT INTO Sales VALUES (10, 110, '2022-01-10', 8, 80.0, 10);
INSERT INTO Customers VALUES (10, 'Benjamin', 'Taylor', 'benjamin.taylor@gmail.com', '8888888888');

INSERT INTO Sales VALUES (11, 111, '2022-01-11', 3, 30.0, 11);
INSERT INTO Customers VALUES (11, 'Mia', 'Anderson', 'mia.anderson@gmail.com', '9999999999');

INSERT INTO Sales VALUES (12, 112, '2022-01-12', 10, 100.0, 12);
INSERT INTO Customers VALUES (12, 'Liam', 'Thomas', 'liam.thomas@gmail.com', '1010101010');

INSERT INTO Sales VALUES (13, 113, '2022-01-13', 5, 50.0, 13);
INSERT INTO Customers VALUES (13, 'Charlotte', 'Jackson', 'charlotte.jackson@gmail.com', '1212121212');

INSERT INTO Sales VALUES (14, 114, '2022-01-14', 8, 80.0, 14);
INSERT INTO Customers VALUES (14, 'Amelia', 'White', 'amelia.white@gmail.com', '1313131313');

INSERT INTO Sales VALUES (15, 115, '2022-01-15', 6, 60.0, 15);
INSERT INTO Customers VALUES (15, 'Harper', 'Harris', 'harper.harris@gmail.com', '1414141414');

INSERT INTO Sales VALUES (16, 116, '2022-01-16', 9, 90.0, 16);
INSERT INTO Customers VALUES (16, 'Evelyn', 'Martin', 'evelyn.martin@gmail.com', '1515151515');

INSERT INTO Sales VALUES (17, 117, '2022-01-17', 7, 70.0, 17);
INSERT INTO Customers VALUES (17, 'Aiden', 'Thompson', 'aiden.thompson@gmail.com', '1616161616');

INSERT INTO Sales VALUES (18, 118, '2022-01-18', 12, 120.0, 18);
INSERT INTO Customers VALUES (18, 'Avery', 'Garcia', 'avery.garcia@gmail.com', '1717171717');

INSERT INTO Sales VALUES (19, 119, '2022-01-19', 4, 40.0, 19);
INSERT INTO Customers VALUES (19, 'Ella', 'Martinez', 'ella.martinez@gmail.com', '1818181818');

INSERT INTO Sales VALUES (20, 120, '2022-01-20', 15, 150.0, 20);
INSERT INTO Customers VALUES (20, 'Sarah', 'Williams', 'sarah.williams@gmail.com', '1111111111');

-- Subquery Usage
SELECT COUNT(*)
FROM Sales
WHERE CustomerID IN (
    SELECT CustomerID
    FROM Customers
    WHERE Email LIKE '%@gmail.com'
);

SELECT AVG(SaleAmount)
FROM Sales
WHERE QuantitySold > 5;

-- Data Manipulation
UPDATE Sales
SET SaleAmount = 0
WHERE SaleAmount IS NULL;

DELETE FROM Sales
WHERE SaleDate < '2022-01-01'; -- Replace with your date

-- Reporting
SELECT strftime('%Y-%m', SaleDate) AS Month, SUM(SaleAmount) AS TotalSaleAmount, SUM(QuantitySold) AS TotalQuantitySold
FROM Sales
GROUP BY Month;

SELECT c.CustomerID, c.FirstName, c.LastName, SUM(s.SaleAmount) AS TotalRevenue
FROM Sales s
JOIN Customers c ON s.CustomerID = c.CustomerID
GROUP BY c.CustomerID
ORDER BY TotalRevenue DESC
LIMIT 10;