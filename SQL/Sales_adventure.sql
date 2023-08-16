-- Internet SALES info:

SELECT 
  ProductKey, 
  OrderDateKey, 
  DueDateKey, 
  ShipDateKey, 
  CustomerKey, 
  SalesOrderNumber, 
  ROUND(SalesAmount, 0) AS Sales 
FROM 
  FactInternetSales 
WHERE 
  LEFT(OrderDateKey, 4) >= YEAR(
    GETDATE()
  ) -2 
ORDER BY 
  OrderDateKey ASC; ; 
