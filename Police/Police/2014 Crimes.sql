alter view [2014 Table]
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



,Crime2014
as
(
select count(*) [No of Crimes], [Constabulary] from [dbo].[Police_Data]
where 1=1
and ([Month] = '2013-04' or [Month] = '2013-05' or [Month] = '2013-06' or [Month] = '2013-07' or [Month] = '2013-08' or [Month] = '2013-09'
or [Month] = '2013-10' or [Month] = '2013-11' or [Month] = '2013-12' or [Month] = '2014-01' or [Month] = '2014-02' or [Month] = '2014-03')
group by [Constabulary]
)


select
	r.[Constabulary ],
	r.[2014 Population],
	r.[2014PoliceOnDuty],
	c14.[No of Crimes] [2014 No Of Crimes],
	cast(c14.[No of Crimes]/r.[2014 Population]*1000 as float) [2014 Crime Per 1000 People],
	cast(c14.[No of Crimes]/r.[2014PoliceOnDuty]*1000 as float) [2014 Crime Per 1000 Police Officers]
	from  Rounding r
inner join Crime2014 c14
on replace(replace(replace(replace(ltrim(rtrim(r.[Constabulary ])), 'Constabulary', ''), 'Police', ''), 'Service', ''), 'and', '&') = replace(replace(replace(replace(ltrim(rtrim(c14.[Constabulary])), 'Constabulary', ''), 'Police', ''), 'Service', ''), 'and', '&')