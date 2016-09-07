select replace(replace(replace(ltrim(rtrim([Constabulary ])), 'Constabulary', ''), 'Police', ''), 'Service', '') from [dbo].[Sheet1$]
except
select replace(replace(replace(ltrim(rtrim([Constabulary])), 'Constabulary', ''), 'Police', ''), 'Service', '') from [dbo].[Police_Data]

-- Making it match for the inner join