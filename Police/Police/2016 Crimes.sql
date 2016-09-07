alter view [2016 Table]
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



,Crime2016
as
(
select count(*) [No of Crimes], [Constabulary] from [dbo].[Police_Data]
where 1=1
and ([Month] = '2015-04' or [Month] = '2015-05' or [Month] = '2015-06' or [Month] = '2015-07' or [Month] = '2015-08' or [Month] = '2015-09'
or [Month] = '2015-10' or [Month] = '2015-11' or [Month] = '2015-12' or [Month] = '2016-01' or [Month] = '2016-02' or [Month] = '2016-03')
group by [Constabulary]
)


select
	r.[Constabulary ],
	r.[2014 Population],
	r.[2016PoliceOnDuty],
	c16.[No of Crimes] [2016 No of Crimes],
	cast(((c16.[No of Crimes]/r.[2014 Population])*1000) as float) [2016 Crime Per 1000 People],
	cast(((c16.[No of Crimes]/r.[2016PoliceOnDuty])*1000) as float) [2016 Crime Per 1000 Police Officers]
	from  Rounding r
inner join Crime2016 c16
on replace(replace(replace(replace(ltrim(rtrim(r.[Constabulary ])), 'Constabulary', ''), 'Police', ''), 'Service', ''), 'and', '&') = replace(replace(replace(replace(ltrim(rtrim(c16.[Constabulary])), 'Constabulary', ''), 'Police', ''), 'Service', ''), 'and', '&')