--alter table [dbo].[Police_Data]
--add [My Crime Id] int identity


--ALTER TABLE [dbo].[Police_Data]
--ADD PRIMARY KEY ([My Crime Id])


--ALTER TABLE [dbo].[Police_Data]
--DROP COLUMN [Crime ID]


--ALTER TABLE [dbo].[Police_Data]
--DROP COLUMN [Location]


--ALTER TABLE [dbo].[Police_Data]
--DROP COLUMN [Last outcome category]

--ALTER TABLE [dbo].[Police_Data]
--DROP COLUMN [Context]


--ALTER TABLE [dbo].[Police_Data]
--DROP COLUMN [Reported by]

--ALTER TABLE [dbo].[Police_Data]
--DROP COLUMN [Latitude]


--ALTER TABLE [dbo].[Police_Data]
--DROP COLUMN [Longitude]

--ALTER TABLE [dbo].[Police_Data]
--DROP COLUMN [LSOA code]


--ALTER TABLE [dbo].[Police_Data]
--DROP COLUMN [LSOA name]


--begin tran 

--delete from [dbo].[Police_Data]
--where [Month]='2010-12'

--delete from [dbo].[Police_Data]
--where [Month]='2011-01'

--delete from [dbo].[Police_Data]
--where [Month]='2011-02'

--delete from [dbo].[Police_Data]
--where [Month]='2011-03'

--delete from [dbo].[Police_Data]
--where [Month]='2016-04'

--delete from [dbo].[Police_Data]
--where [Month]='2016-05'

--delete from [dbo].[Police_Data]
--where [Month]='2016-06'


--select distinct([Month]) from [dbo].[Police_Data]

--delete from [dbo].[Police_Data]
--where [Month]='2016-06'

--delete from [dbo].[Police_Data]
--where [Falls within]='Police Service of Northern Ireland'

--commit tran

--select distinct([Falls within]) from [dbo].[Police_Data]


