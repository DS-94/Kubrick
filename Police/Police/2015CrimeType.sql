----2015


alter view [2015CrimeType] as

select 
count(*) [No of Crimes], 
p.[Constabulary], 
replace([Crime type], 'Violent crime', 'Violence and sexual offences') [Crime Type],
[dbo].[Sheet1$].[2014 Population]
from [dbo].[Police_Data] p
inner join [dbo].[Sheet1$]
on replace(replace(replace(replace(ltrim(rtrim(p.[Constabulary])), 'Constabulary', ''), 'Police', ''), 'Service', ''), 'and', '&') = replace(replace(replace(replace(ltrim(rtrim([dbo].[Sheet1$].[Constabulary ])), 'Constabulary', ''), 'Police', ''), 'Service', ''), 'and', '&')
where 1=1
and ([Month] = '2014-04' or [Month] = '2014-05' or [Month] = '2014-06' or [Month] = '2014-07' or [Month] = '2014-08' or [Month] = '2014-09'
or [Month] = '2014-10' or [Month] = '2014-11' or [Month] = '2014-12' or [Month] = '2015-01' or [Month] = '2015-02' or [Month] = '2015-03')
group by p.[Constabulary], [Crime Type], [dbo].[Sheet1$].[2014 Population]