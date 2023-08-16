-- Date information going to be used from the DIM_DateTable: 

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
