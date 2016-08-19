select
	 name
	,isnull(color,'NA')
	,listprice
	,rank() over (partition by color order by listprice asc) Rank
	,row_number() over (partition by color order by listprice asc) RowNo
	,DENSE_RANK() over (partition by color order by listprice asc) DenseRank
	,ntile(10) over (order by listprice asc) 
from production.product 
order by ntile(10) over (order by listprice asc)
