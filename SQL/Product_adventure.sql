-- Products info:

SELECT 
  p.ProductKey, 
  p.ProductAlternateKey AS [Product Item Code], 
  p.EnglishProductName AS [Product Name], 
  ISNULL(
    ps.EnglishProductSubcategoryName, 
    'NA'
  ) AS [Sub Category], 
  ISNULL(
    pc.EnglishProductCategoryName, 'NA'
  ) AS Category, 
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
order by 
  p.ProductKey asc
