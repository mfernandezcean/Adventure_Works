# Adventure_Works
From Raw data to a Dashboard (Sql-Power Bi)
--
### Mail from Managment
**Sales Manager:**

Hi Martin!
I hope you are doing well. We need to improve our ***internet sales*** reports and want to move from static reports to ***visual dashboards***.

Essentially, we want to focus it on how ***much we have sold of what products***, to which clients and how it has been over time.

**Seeing as each sales person** works on different products and customers it would be beneficial to be able to filter them also.

We measure our numbers against budget so I added that in a spreadsheet so we can compare our values against performance.

The budget is for 2021 and we usually look ***2 years back*** in time when we do analysis of sales.
Let me know if you need anything else!  
  
// Steven

---

###  Selectiong the Data to answers the questions:

- Customers:


```
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
```

- Sales:

```

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
  LEFT(OrderDateKey, 4) >= YEAR( GETDATE()) -2 
ORDER BY 
  OrderDateKey ASC;
```

- Products: 

```
SELECT 
	  p.ProductKey, 
	  p.ProductAlternateKey AS [Product Item Code], 
	  p.EnglishProductName AS [Product Name], 
	  ISNULL(ps.EnglishProductSubcategoryName, 'NA') AS [Sub Category], 
	  ISNULL(pc.EnglishProductCategoryName, 'NA') AS Category, 
	  p.Color AS [Product Color], 
	  ISNULL(p.Size, 'NA') AS [Product Size], 
	  ISNULL(p.ProductLine, 'NA') AS [Product Line], 
	  ISNULL(p.ModelName, 'NA') AS [Product Model Name], 
	  ISNULL(p.EnglishDescription, 'NA') AS [Product Description], 
	  ISNULL(p.Status, 'Outdated') AS [Product Status] 
FROM 
  DimProduct as p
  LEFT JOIN DimProductSubcategory AS ps ON ps.ProductSubcategoryKey = p.ProductSubcategoryKey 
  LEFT JOIN DimProductCategory AS pc ON ps.ProductCategoryKey = pc.ProductCategoryKey 
ORDER BY
  p.ProductKey asc;
```

- Date:

  ```
  SELECT 
	  DateKey, 
	  FullDateAlternateKey AS Date, 
	  EnglishDayNameOfWeek AS Day,
	  WeekNumberOfYear AS WeekNr,
	  EnglishMonthName AS Month,
	  LEFT(EnglishMonthName,3) AS MonthShort,
	  MonthNumberOfYear AS MonthNumber, 
	  CalendarQuarter AS Quarter, 
	  CalendarYear AS Year 
  FROM 
  	DimDate 
  WHERE 
  	CalendarYear >= 2019;
  ```

---

### Dashboard: 

![dwqwdqdwq](https://github.com/mfernandezcean/Adventure_Works/assets/105746149/8bd2048a-fceb-4204-901d-cd380173e005)
