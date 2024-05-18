-- Create InventoryTable
CREATE TABLE InventoryTable (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(90),
    Stock INT,
    ReorderLevel INT
);

-- Create stored procedure
CREATE PROCEDURE UpdateInventoryStock
    @ProductID INT,
    @Quantity INT
AS
BEGIN
    -- Check if sufficient stock exists
    IF (SELECT Stock FROM InventoryTable WHERE ProductID = @ProductID) >= @Quantity
    BEGIN
        -- Deduct the quantity from the inventory
        UPDATE InventoryTable
        SET Stock = Stock - @Quantity
        WHERE ProductID = @ProductID;

        -- Return success message
        SELECT 'Success: Stock has been updated.' AS Message;
    END
    ELSE
    BEGIN
        -- Return error message
        SELECT 'Error: Insufficient stock.' AS Message;
    END
END;