USE [AdventureWorks2022]
GO
/****** Object:  StoredProcedure [dbo].[DashboardQuery]    Script Date: 30/04/2024 11:42:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[DashboardQuery]
AS
BEGIN
	SELECT 
	soh.[SalesOrderID]
	,psc.[name] as [Product Group]
	,prodcat.[Name] as [Product Category]
	,prod.[name] as [Product Name]
	,prod.Class
	,prod.ProductLine
	,[SalesOrderNumber]
	,[PurchaseOrderNumber]
	,soh.[AccountNumber]
	,[OrderDate]
	,[DueDate]
	,[ShipDate]
	,day([OrderDate]) as [DAY]
	,Month([OrderDate]) as [Month]
	,Year([OrderDate]) as [year]
	,format([ORDERDate],'MMM') as MonthName
	,(
		SELECT
		case
		when day([orderdate]) BETWEEN 1 AND 7 then 1
		when day([orderdate]) BETWEEN 7 AND 14 then 2
		when day([orderdate]) BETWEEN 14 AND 21 then 3
		when day([orderdate]) BETWEEN 21 AND 28 then 4
		when day([orderdate])BETWEEN 28 AND 31 then 5
		end as weeknum
	) as WeekOfMonth

	,[SubTotal]
	,[TaxAmt]
	,[Freight]
	,[TotalDue]
	,pa.PostalCode
	,sod.OrderQty
	,sod.LineTotal
	,sod.UnitPrice
	,geo.Latitude
	,geo.Longitude
	,geo.PlaceName
	,pa.PostalCode
	,geo.Latitude
	,geo.Longitude
	,geo.[country]
	,geo.AdminName1
	,1 as [counter]
	FROM [AdventureWorks2022].[Sales].[SalesOrderHeader] as soh
	inner join  [Sales].[SalesOrderDetail] as sod on sod.SalesOrderID=soh.SalesOrderID
	inner join Production.Product as prod on prod.ProductID=sod.ProductID
	inner join production.ProductCategory as prodcat on prodcat.ProductCategoryID=prod.ProductSubcategoryID
	inner join [Production].[ProductSubcategory] as psc on psc.ProductSubcategoryID=prod.ProductSubcategoryID
	inner join sales.SalesPerson as sp on sp.BusinessEntityID=soh.SalesPersonID
	inner join [Person].[BusinessEntity] as be on be.BusinessEntityID=sp.BusinessEntityID
	inner join [Person].[BusinessEntityAddress] as bea on bea.BusinessEntityID=be.BusinessEntityID
	inner join [Person].[Address] as pa on pa.AddressID=bea.AddressID
	left join [2026_geodata].[dbo].[PostcodeLatLong] as geo on geo.postalcode=pa.PostalCode cOLLATE SQL_Latin1_General_CP1_CI_AS
	where soh.OrderDate < '2014-01-01'
END


