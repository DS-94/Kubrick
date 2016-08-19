--select
--	businessentityid
--	,firstname
--	,lastname
--from person.person  --19972 rows
--union
--select
--	productid
--	,name
--	,productnumber
--from production.product --504


--select 
--	name
--	,ListPrice
--	,name + ' ' + cast(listprice as varchar(20)) squash
--	,case 
--		when cast(ListPrice as int) = 0 then 'FREE'
--		when cast(ListPrice as int) between 0 and 100 then 'Bargain' 
--		when cast(ListPrice as int) between 101 and 500 then 'Decent'
--		when cast(ListPrice as int) > 500 then 'Naa bruv' 
--	end PriceDescription
--from [Production].[Product]

select 
	[FirstName] + ' ' + isnull([MiddleName],'') + ' ' + [LastName] WholeName
	,[FirstName]
	,isnull(nullif(middlename,'b'),'badname')
	,[MiddleName]
	,[LastName]
from [Person].[Person]


