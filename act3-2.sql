-- Create OrdersTable
CREATE TABLE OrdersTable (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE,
    TotalAmount DECIMAL(10,2),
    Status VARCHAR(50)
);

-- Create OrderHistoryTable
CREATE TABLE OrderHistoryTable (
    OrderHistoryID INT PRIMARY KEY,
    OrderID INT,
    StatusChangeDate DATETIME,
    NewStatus VARCHAR(50),
    FOREIGN KEY (OrderID) REFERENCES OrdersTable(OrderID)
);

-- Create stored procedure
DELIMITER //
CREATE PROCEDURE UpdateOrderStatus(IN order_id INT, IN new_status VARCHAR(50))
BEGIN
    -- Update the OrdersTable
    UPDATE OrdersTable
    SET Status = new_status
    WHERE OrderID = order_id;

    -- Insert a record into the OrderHistoryTable
    INSERT INTO OrderHistoryTable (OrderID, StatusChangeDate, NewStatus)
    VALUES (order_id, NOW(), new_status);
END //
DELIMITER ;