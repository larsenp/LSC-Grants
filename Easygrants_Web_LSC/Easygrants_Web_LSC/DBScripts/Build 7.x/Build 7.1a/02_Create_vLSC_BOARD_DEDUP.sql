/****** Object:  View [dbo].[vLSC_BOARD_DEDUP]    Script Date: 10/07/2009 17:15:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vLSC_BOARD_DEDUP]
AS
SELECT [Org_ID]
	  ,[Year]
	  ,[Full_Name]
	  ,max([Status]) [Status]
	  ,max([Appointing_Org]) [Appointing_Org]
	  ,max([Ethnicity]) [Ethnicity]
	  ,max([Gender]) [Gender]
	  ,max([Address]) [Address]
	  ,max([City]) [City]
	  ,max([State]) [State]
	  ,max([Zip]) [Zip]
	  ,max([Phone]) [Phone]
	  ,max([phone_type]) [phone_type]
	  ,max([member_type]) [member_type]
	  ,max([Experience]) [Experience]
	  ,max([Updated]) [Updated]
	  ,max([First_Mid]) [First_Mid]
	  ,max([Last_Name]) [Last_Name]
	  ,max([Ethnicity_Description]) [Ethnicity_Description]
  FROM [Easygrants].[dbo].[vLSC_BOARD]
	group by Org_ID, year, full_name
