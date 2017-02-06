/****** Object:  View [dbo].[vLSC_VALIDATE_BOARD_MEMBER_DETAILS]    Script Date: 05/01/2012 11:45:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER VIEW [dbo].[vLSC_VALIDATE_BOARD_MEMBER_DETAILS]

AS

SELECT * 
	FROM LSC_WF_TASK_ASSIGNMENT_AFFILIATIONS
	WHERE affiliation_type_id = 3
		AND is_nic_data = 0
		AND ((name_first IS NULL OR RTRIM(name_first) = '')
			OR (name_last IS NULL OR name_last = '')
			OR status_id IS NULL
			OR (appointing_organization IS NULL OR appointing_organization = '')
			OR (relevant_experience IS NULL OR relevant_experience = '')
			OR gender_id IS NULL
			OR ethnicity_id IS NULL
			OR (address IS NULL OR address = '')
			OR (city IS NULL OR city = '')
			OR state_province_id IS NULL
			OR (zip_postal_code IS NULL OR zip_postal_code = '')
			OR address_phone_type_id IS NULL
			OR board_member_type_id IS NULL
		)