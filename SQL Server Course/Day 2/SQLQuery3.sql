--select
--	p.productnumber
--	,count(*) SaleCount

--from [Sales].[SalesOrderDetail] as sod with (nolock)
--inner join [Production].[Product] as p with (nolock)
--	on isnull(sod.[ProductID],'zzzz') = p.[ProductID]
--inner join [Sales].[SalesOrderHeader] as soh
--	on soh.[SalesOrderID] = sod.[SalesOrderID]
--where p.color = 'red'
--group by 
--	 p.ProductNumber
--	having count(*) >= 2000

select 
	color
	,name
	,ProductNumber
	,[Weight]
	,count(*) over (partition by color) [count by color]
	,count(*) over (partition by weight) [count by weight]
	
from production.product 
where weight is not null
order by [count by weight] desc