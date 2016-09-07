--2014
alter view [2014CrimeType] as

select 
count(*) [No of Crimes], 
p.[Constabulary], 
replace([Crime type], 'Violent crime', 'Violence and sexual offences') [Crime Type],
[dbo].[Sheet1$].[2014 Population] 
from [dbo].[Police_Data] p
inner join [dbo].[Sheet1$]
on replace(replace(replace(replace(ltrim(rtrim(p.[Constabulary])), 'Constabulary', ''), 'Police', ''), 'Service', ''), 'and', '&') = replace(replace(replace(replace(ltrim(rtrim([dbo].[Sheet1$].[Constabulary ])), 'Constabulary', ''), 'Police', ''), 'Service', ''), 'and', '&')
where 1=1
and ([Month] = '2013-04' or [Month] = '2013-05' or [Month] = '2013-06' or [Month] = '2013-07' or [Month] = '2013-08' or [Month] = '2013-09'
or [Month] = '2013-10' or [Month] = '2013-11' or [Month] = '2013-12' or [Month] = '2014-01' or [Month] = '2014-02' or [Month] = '2014-03')
group by p.[Constabulary], [Crime Type], [dbo].[Sheet1$].[2014 Population]