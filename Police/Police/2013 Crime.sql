alter view [2013 Table]
as

with Rounding 
as
(
select 
	round([2016 Police Force], 0) [2016PoliceOnDuty],
	round([2015 Police Force], 0) [2015PoliceOnDuty],
	round([2014 Police Force], 0) [2014PoliceOnDuty],
	round([2013 Police Force], 0) [2013PoliceOnDuty],
	round([2012 Police Force], 0) [2012PoliceOnDuty],
	[Constabulary ],
	[2014 Population]
from [dbo].[Sheet1$]
)



,Crime2013
as
(
select count(*) [No of Crimes], [Constabulary] from [dbo].[Police_Data]
where 1=1
and ([Month] = '2012-04' or [Month] = '2012-05' or [Month] = '2012-06' or [Month] = '2012-07' or [Month] = '2012-08' or [Month] = '2012-09'
or [Month] = '2012-10' or [Month] = '2012-11' or [Month] = '2012-12' or [Month] = '2013-01' or [Month] = '2013-02' or [Month] = '2013-03')
group by [Constabulary]

)


select
	r.[Constabulary ],
	r.[2014 Population],
	r.[2013PoliceOnDuty],
	c13.[No of Crimes] [2013 No Of Crimes],
	cast(c13.[No of Crimes]/r.[2014 Population]*1000 as float) [2013 Crime Per 1000 People],
	cast(c13.[No of Crimes]/r.[2013PoliceOnDuty]*1000 as float) [2013 Crime Per 1000 Police Officers]
	from  Rounding r
inner join Crime2013 c13
on replace(replace(replace(replace(ltrim(rtrim(r.[Constabulary ])), 'Constabulary', ''), 'Police', ''), 'Service', ''), 'and', '&') = replace(replace(replace(replace(ltrim(rtrim(c13.[Constabulary])), 'Constabulary', ''), 'Police', ''), 'Service', ''), 'and', '&')