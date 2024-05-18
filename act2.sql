-- Table Creation
CREATE TABLE Sales (
    SalesID INTEGER PRIMARY KEY,
    ProductID INTEGER,
    SaleDate DATE,
    QuantitySold INTEGER,
    SaleAmount REAL
);

-- Data Population
INSERT INTO Sales VALUES
    (1, 101, '2022-01-01', 10, 100.0),
    (2, 102, '2022-01-02', 5, 50.0),
    (3, 103, '2022-01-03', 8, 80.0),
    (4, 101, '2022-01-04', 12, 120.0),
    (5, 102, '2022-01-05', 3, 30.0),
    (6, 103, '2022-01-06', 6, 60.0),
    (7, 101, '2022-01-07', 9, 90.0),
    (8, 102, '2022-01-08', 7, 70.0),
    (9, 103, '2022-01-09', 4, 40.0),
    (10, 101, '2022-01-10', 11, 110.0),
    (11, 102, '2022-01-11', 2, 20.0),
    (12, 103, '2022-01-12', 5, 50.0),
    (13, 101, '2022-01-13', 8, 80.0),
    (14, 102, '2022-01-14', 6, 60.0),
    (15, 103, '2022-01-15', 3, 30.0),
    (16, 101, '2022-01-16', 10, 100.0),
    (17, 102, '2022-01-17', 4, 40.0),
    (18, 103, '2022-01-18', 7, 70.0),
    (19, 101, '2022-01-19', 9, 90.0),
    (20, 102, '2022-01-20', 5, 50.0);

-- Sales Analysis
SELECT ProductID, COUNT(*) AS TotalSales, SUM(SaleAmount) AS TotalSaleAmount
FROM Sales
GROUP BY ProductID;

-- Monthly Sales Report
SELECT strftime('%Y-%m', SaleDate) AS Month, SUM(SaleAmount) AS TotalSaleAmount
FROM Sales
GROUP BY Month;

-- Top Performing Products
SELECT ProductID, SUM(SaleAmount) AS TotalSaleAmount
FROM Sales
GROUP BY ProductID
ORDER BY TotalSaleAmount DESC
LIMIT 5;

-- Average Sales per Day
SELECT DATE(SaleDate) AS SaleDay, AVG(SaleAmount) AS AverageSaleAmount
FROM Sales
WHERE SaleDate >= date('now','-3 month')
GROUP BY SaleDay;