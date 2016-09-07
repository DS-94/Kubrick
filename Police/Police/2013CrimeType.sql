----2013
alter view [2013CrimeType] as

select 
count(*) [No of Crimes], 
p.[Constabulary], 
replace([Crime type], 'Violent crime', 'Violence and sexual offences') [Crime Type], 
[dbo].[Sheet1$].[2014 Population]
from [dbo].[Police_Data] p
inner join [dbo].[Sheet1$]
on replace(replace(replace(replace(ltrim(rtrim(p.[Constabulary])), 'Constabulary', ''), 'Police', ''), 'Service', ''), 'and', '&') = replace(replace(replace(replace(ltrim(rtrim([dbo].[Sheet1$].[Constabulary ])), 'Constabulary', ''), 'Police', ''), 'Service', ''), 'and', '&')
where 1=1
and ([Month] = '2012-04' or [Month] = '2012-05' or [Month] = '2012-06' or [Month] = '2012-07' or [Month] = '2012-08' or [Month] = '2012-09'
or [Month] = '2012-10' or [Month] = '2012-11' or [Month] = '2012-12' or [Month] = '2013-01' or [Month] = '2013-02' or [Month] = '2013-03')
group by p.[Constabulary], [Crime Type], [dbo].[Sheet1$].[2014 Population]