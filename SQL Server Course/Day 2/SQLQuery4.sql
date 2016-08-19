select
	 [SalesOrderID]
	,[SalesOrderDetailID]
	,lead([SalesOrderDetailID]) over (partition by [SalesOrderID] order by [SalesOrderDetailID] asc)
	,lag([SalesOrderDetailID]) over (partition by [SalesOrderID] order by [SalesOrderDetailID] asc)
	,first_value([SalesOrderDetailID]) over (partition by [SalesOrderID] order by [SalesOrderDetailID] asc)
	,last_value([SalesOrderDetailID]) over (partition by [SalesOrderID] order by [SalesOrderDetailID] asc rows between unbounded preceding and unbounded following)
	,[LineTotal]
	,[ProductID]

from [Sales].[SalesOrderDetail]
order by 1,2