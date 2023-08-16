--Customer and City info:

SELECT 
  c.CustomerKey AS Customer_Key, 
  c.FirstName AS [First Name], 
  c.LastName AS [Last Name], 
  c.FirstName + ' ' + c.LastName AS [Full Name], 
  CASE WHEN Gender = 'M' THEN 'Male' WHEN Gender = 'F' THEN 'Female' END AS Gender, 
  c.DateFirstPurchase as Date_First_Purchase, 
  g.City AS Customer_City,
  g.CountryRegionCode AS CountryCode
FROM 
  DimCustomer c 
  LEFT JOIN DimGeography g ON g.GeographyKey = c.GeographyKey
ORDER BY
	c.CustomerKey ASC;
