--2012
alter view [2012CrimeType] as

select 
count(*) [No of Crimes], 
p.[Constabulary], 
replace([Crime type], 'Violent crime', 'Violence and sexual offences') [Crime Type],
[dbo].[Sheet1$].[2014 Population]
from [dbo].[Police_Data] p
inner join [dbo].[Sheet1$]
on replace(replace(replace(replace(ltrim(rtrim(p.[Constabulary])), 'Constabulary', ''), 'Police', ''), 'Service', ''), 'and', '&') = replace(replace(replace(replace(ltrim(rtrim([dbo].[Sheet1$].[Constabulary ])), 'Constabulary', ''), 'Police', ''), 'Service', ''), 'and', '&')
where 1=1
and ([Month] = '2011-04' or [Month] = '2011-05' or [Month] = '2011-06' or [Month] = '2011-07' or [Month] = '2011-08' or [Month] = '2011-09'
or [Month] = '2011-10' or [Month] = '2011-11' or [Month] = '2011-12' or [Month] = '2012-01' or [Month] = '2012-02' or [Month] = '2012-03')
group by p.[Constabulary], [Crime Type], [dbo].[Sheet1$].[2014 Population]