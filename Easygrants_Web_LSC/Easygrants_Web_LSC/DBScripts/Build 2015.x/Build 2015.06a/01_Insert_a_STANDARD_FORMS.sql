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
		1, 
		'LSC - PBIF LOI Review - Vice President - Review List', 
		'Review List', 
		'ReviewList', 
		'Review List', 
		'Implementation/Modules/PBIF_LOIReview_VP/Forms/ReviewList.ascx', 
		'Implementation/Modules/PBIF_LOIReview_VP/Forms/ReviewList.ascx', 
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
		'LSC - PBIF LOI Review - Vice President - Review LOI', 
		'Review LOI', 
		'ReviewLOI', 
		'Review LOI', 
		'Implementation/Modules/PBIF_LOIReview_VP/Forms/VPReview.ascx', 
		'Implementation/Modules/PBIF_LOIReview_VP/Forms/PostSubmission.ascx', 
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
		'LSC - PBIF LOI Review - Vice President - Review and Submit', 
		'Review and Submit', 
		'ReviewSubmit', 
		'Review and Submit', 
		'Implementation/Modules/PBIF_LOIReview_VP/Forms/ReviewSubmit.ascx', 
		'Implementation/Modules/PBIF_LOIReview_VP/Forms/PostSubmission.ascx', 
		0, 
		1)

