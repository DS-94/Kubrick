--select distinct([Crime type]) from [dbo].[Police_Data]


--delete from [dbo].[Police_Data] 
--where 
--[Crime type] in ('Bassetlaw 008B', 'Blaby 013C', 'Charnwood 012C', 'Charnwood 021E', 'Charnwood 022D', 'Hillingdon 009E', 'Hillingdon 011C', 'Worthing 010A')




--2016

alter view [2016CrimeType] as

select 
count(*) [No of Crimes], 
p.[Constabulary], 
replace([Crime type], 'Violent crime', 'Violence and sexual offences') [Crime Type],
[dbo].[Sheet1$].[2014 Population]
from [dbo].[Police_Data] p
inner join [dbo].[Sheet1$]
on 



replace(replace(replace(replace(ltrim(rtrim(p.[Constabulary])), 'Constabulary', ''), 'Police', ''), 'Service', ''), 'and', '&') = replace(replace(replace(replace(ltrim(rtrim([dbo].[Sheet1$].[Constabulary ])), 'Constabulary', ''), 'Police', ''), 'Service', ''), 'and', '&')


where 1=1
and ([Month] = '2015-04' or [Month] = '2015-05' or [Month] = '2015-06' or [Month] = '2015-07' or [Month] = '2015-08' or [Month] = '2015-09'
or [Month] = '2015-10' or [Month] = '2015-11' or [Month] = '2015-12' or [Month] = '2016-01' or [Month] = '2016-02' or [Month] = '2016-03')
group by p.[Constabulary], [Crime Type], [dbo].[Sheet1$].[2014 Population]



