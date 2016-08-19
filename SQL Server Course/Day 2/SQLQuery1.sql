select 
	 p.name as [Product Name]
	,p.listprice
	,cast(p.standardcost as decimal(10,2))
	,p.color
	,sod.CarrierTrackingNumber
	,sod.OrderQty
	,sod.LineTotal
	,sod.UnitPrice
	,sod.SalesOrderID
	,cast(soh.OrderDate as date) OrderDate
	,datename(yy,soh.OrderDate) OrderYear
	,datename(qq,soh.OrderDate) OrderQuarter
	,datename(mm,soh.OrderDate) OrderMonth
	,convert(date,soh.orderdate,13)
	,DATEADD(month, DATEDIFF(month, 0, soh.OrderDate), 0)-1
	,datediff(month,0,soh.orderdate)
	,datediff(mm,cast(soh.OrderDate as date),getdate())
/*
from [Sales].[SalesOrderDetail],[Production].[Product] 
where [Sales].[SalesOrderDetail].[ProductID] = [Production].[Product].[ProductID]
*/

from [Sales].[SalesOrderDetail] as sod with (nolock)
inner join [Production].[Product] as p with (nolock)
	on isnull(sod.[ProductID],'zzzz') = p.[ProductID]
inner join [Sales].[SalesOrderHeader] as soh
	on soh.[SalesOrderID] = sod.[SalesOrderID]
where 1=1

	--and datediff(mm,cast(soh.OrderDate as date),getdate())


--select getdate()
