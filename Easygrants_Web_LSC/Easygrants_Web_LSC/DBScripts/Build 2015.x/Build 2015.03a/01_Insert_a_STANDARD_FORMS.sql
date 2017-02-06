DECLARE @new_id INT

EXEC @new_id = getid_sel @table = 'a_STANDARD_FORMS'

INSERT [dbo].[a_STANDARD_FORMS] 
	([id], 
	[form_type_id], 
	[name], 
	[description], 
	[page_key], 
	[page_title], 
	[control_path], 
	[after_submit_control_path], 
	[is_client], 
	[is_active]) 
	VALUES 
		(@new_id, 
		3, 
		'LSC - PBIF LOI Review - Primary - Main', 
		'Main', 
		'Main', 
		'Main', 
		'Implementation/Modules/PBIF_LOIReview_Primary/Forms/Main.ascx', 
		'Implementation/Modules/PBIF_LOIReview_Primary/Forms/PostSubmission.ascx', 
		0, 
		1)

EXEC @new_id = getid_sel @table = 'a_STANDARD_FORMS'

INSERT [dbo].[a_STANDARD_FORMS] 
	([id], 
	[form_type_id], 
	[name], 
	[description], 
	[page_key], 
	[page_title], 
	[control_path], 
	[after_submit_control_path], 
	[is_client], 
	[is_active]) 
	VALUES 
		(@new_id, 
		1, 
		'LSC - PBIF LOI Review - Primary - Narrative - Project Description', 
		'Narrative - Project Description', 
		'Narrative - Project Description', 
		'NarrativeProjectDescription', 
		'Implementation/Modules/PBIF_LOIReview_Primary/Forms/Narr_ProjDesc.ascx', 
		'Implementation/Modules/PBIF_LOIReview_Primary/Forms/PostSubmission.ascx', 
		0, 
		1)

EXEC @new_id = getid_sel @table = 'a_STANDARD_FORMS'

INSERT [dbo].[a_STANDARD_FORMS] 
	([id], 
	[form_type_id], 
	[name], 
	[description], 
	[page_key], 
	[page_title], 
	[control_path], 
	[after_submit_control_path], 
	[is_client], 
	[is_active]) 
	VALUES 
		(@new_id, 
		1, 
		'LSC - PBIF LOI Review - Primary - Narrative - Organizational Capacity', 
		'Narrative - Organizational Capacity, Staffing and Project Partners', 
		'Narrative - Organizational Capacity, Staffing and Project Partners', 
		'NarrativeOrgCapacity', 
		'Implementation/Modules/PBIF_LOIReview_Primary/Forms/Narr_OrgCap.ascx', 
		'Implementation/Modules/PBIF_LOIReview_Primary/Forms/PostSubmission.ascx', 
		0, 
		1)

EXEC @new_id = getid_sel @table = 'a_STANDARD_FORMS'

INSERT [dbo].[a_STANDARD_FORMS] 
	([id], 
	[form_type_id], 
	[name], 
	[description], 
	[page_key], 
	[page_title], 
	[control_path], 
	[after_submit_control_path], 
	[is_client], 
	[is_active]) 
	VALUES 
		(@new_id, 
		1, 
		'LSC - PBIF LOI Review - Primary - Narrative - Budget and Timeline', 
		'Narrative - Budget and Timeline', 
		'Narrative - Budget and Timeline', 
		'NarrativeBudgetTimeline', 
		'Implementation/Modules/PBIF_LOIReview_Primary/Forms/Narr_Budget.ascx', 
		'Implementation/Modules/PBIF_LOIReview_Primary/Forms/PostSubmission.ascx', 
		0, 
		1)

EXEC @new_id = getid_sel @table = 'a_STANDARD_FORMS'

INSERT [dbo].[a_STANDARD_FORMS] 
	([id], 
	[form_type_id], 
	[name], 
	[description], 
	[page_key], 
	[page_title], 
	[control_path], 
	[after_submit_control_path], 
	[is_client], 
	[is_active]) 
	VALUES 
		(@new_id, 
		1, 
		'LSC - PBIF LOI Review - Primary - Review Summary', 
		'Review Summary', 
		'Review Summary', 
		'ReviewSummary', 
		'Implementation/Modules/PBIF_LOIReview_Primary/Forms/ReviewSummary.ascx', 
		'Implementation/Modules/PBIF_LOIReview_Primary/Forms/PostSubmission.ascx', 
		0, 
		1)

EXEC @new_id = getid_sel @table = 'a_STANDARD_FORMS'

INSERT [dbo].[a_STANDARD_FORMS] 
	([id], 
	[form_type_id], 
	[name], 
	[description], 
	[page_key], 
	[page_title], 
	[control_path], 
	[after_submit_control_path], 
	[is_client], 
	[is_active]) 
	VALUES 
		(@new_id, 
		4, 
		'LSC - PBIF LOI Review - Primary - Review and Submit', 
		'Review and Submit', 
		'Review and Submit', 
		'ReviewSubmit', 
		'Implementation/Modules/PBIF_LOIReview_Primary/Forms/ReviewSubmit.ascx', 
		'Implementation/Modules/PBIF_LOIReview_Primary/Forms/PostSubmission.ascx', 
		0, 
		1)

