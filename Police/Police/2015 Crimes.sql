alter view [2015 Table]
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



,Crime2015
as
(
select count(*) [No of Crimes], [Constabulary] from [dbo].[Police_Data]
where 1=1
and ([Month] = '2014-04' or [Month] = '2014-05' or [Month] = '2014-06' or [Month] = '2014-07' or [Month] = '2014-08' or [Month] = '2014-09'
or [Month] = '2014-10' or [Month] = '2014-11' or [Month] = '2014-12' or [Month] = '2015-01' or [Month] = '2015-02' or [Month] = '2015-03')
group by [Constabulary]
)


select
	r.[Constabulary ],
	r.[2014 Population],
	r.[2015PoliceOnDuty],
	c15.[No of Crimes] [2015 No Of Crimes],
	cast(c15.[No of Crimes]/r.[2014 Population]*1000 as float) [2015 Crime Per 1000 People],
	cast(c15.[No of Crimes]/r.[2015PoliceOnDuty]*1000 as float) [2015 Crime Per 1000 Police Officers]
	from  Rounding r
inner join Crime2015 c15
on replace(replace(replace(replace(ltrim(rtrim(r.[Constabulary ])), 'Constabulary', ''), 'Police', ''), 'Service', ''), 'and', '&') = replace(replace(replace(replace(ltrim(rtrim(c15.[Constabulary])), 'Constabulary', ''), 'Police', ''), 'Service', ''), 'and', '&')