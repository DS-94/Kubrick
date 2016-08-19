select
	 avg(sod.LineTotal) AvgSpend
	,stdev(sod.LineTotal) StDevSpend
	,min(sod.LineTotal) MinSpend
	,max(sod.LineTotal) MaxSpend
	,datename(yy,soh.OrderDate) + ' ' + datename(qq,soh.OrderDate) 

from [Sales].[SalesOrderDetail] as sod with (nolock)
inner join [Production].[Product] as p with (nolock)
	on isnull(sod.[ProductID],'zzzz') = p.[ProductID]
inner join [Sales].[SalesOrderHeader] as soh
	on soh.[SalesOrderID] = sod.[SalesOrderID]
group by 
	 datename(yy,soh.OrderDate) + ' ' + datename(qq,soh.OrderDate)

