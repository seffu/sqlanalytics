-- For these, AdventureWorks is the default database.

SET STATISTICS IO ON

SELECT
    CustomerID,
    SalesOrderID,
    OrderDate,
    TotalDue,
    -- SUM(TotalDue) OVER (PARTITION BY SalesOrderid) AS RunningTotal,
    SUM(TotalDue) OVER (PARTITION BY SalesOrderid ROWS UNBOUNDED PRECEDING) AS RunningTotal2
FROM Sales.SalesOrderHeader
ORDER BY SalesOrderID



SELECT 
    PurchaseOrderID,
    PurchaseOrderDetailID,
    ProductID,
    LineTotal,
    SUM(LineTotal) OVER (PARTITION BY PurchaseOrderID ROWS UNBOUNDED PRECEDING) AS TotalDue,
    SUM(LineTotal) OVER (PARTITION BY PurchaseOrderID ROWS BETWEEN CURRENT ROW AND UNBOUNDED FOLLOWING) AS TotalDue,
    SUM(LineTotal) OVER (PARTITION BY PurchaseOrderID ROWS BETWEEN 1 PRECEDING AND 1 FOLLOWING) AS ThreeRows
FROM Purchasing.PurchaseOrderDetail


SELECT 
    *,
    FIRST_VALUE(ClosePrice) OVER (PARTITION BY MONTH(Date),YEAR(Date) ORDER BY Date) AS FirstClosePrice,
    LAST_VALUE(ClosePrice) OVER (PARTITION BY MONTH(Date),YEAR(Date) ORDER BY Date ROWS BETWEEN CURRENT ROW AND UNBOUNDED FOLLOWING) AS LastClosePrice,
FROM MicrosoftStockHistory
ORDER BY Date

