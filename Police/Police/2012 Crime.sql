alter view [2012 Table]
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



,Crime2012
as
(
select count(*) [No of Crimes], [Constabulary] from [dbo].[Police_Data]
where 1=1
and ([Month] = '2011-04' or [Month] = '2011-05' or [Month] = '2011-06' or [Month] = '2011-07' or [Month] = '2011-08' or [Month] = '2011-09'
or [Month] = '2011-10' or [Month] = '2011-11' or [Month] = '2011-12' or [Month] = '2012-01' or [Month] = '2012-02' or [Month] = '2012-03')
group by [Constabulary]

)


select
	r.[Constabulary ],
	r.[2014 Population],
	r.[2012PoliceOnDuty] [2012 Police On Duty],
	c12.[No of Crimes] [2012 No Of Crimes],
	cast(c12.[No of Crimes]/r.[2014 Population]*1000 as float) [2012 Crime Per 1000 People],
	cast(c12.[No of Crimes]/r.[2012PoliceOnDuty]*1000 as float) [2012 Crime Per 1000 Police Officers]
	from  Rounding r
inner join Crime2012 c12
on replace(replace(replace(replace(ltrim(rtrim(r.[Constabulary ])), 'Constabulary', ''), 'Police', ''), 'Service', ''), 'and', '&') = replace(replace(replace(replace(ltrim(rtrim(c12.[Constabulary])), 'Constabulary', ''), 'Police', ''), 'Service', ''), 'and', '&')