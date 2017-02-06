/*
Already run in production
DECLARE @new_id INT

EXEC @new_id = getid_sel @table = 'a_STANDARD_FORMS'

INSERT a_STANDARD_FORMS
	(id
   ,form_type_id
   ,name
   ,description
   ,page_key
   ,page_title
   ,control_path
   ,after_submit_control_path)
	VALUES
		(@new_id
		,3
		,'LSC - Subgrants Step 2 - Main'
		,'Main'
		,'Main'
		,'Main'
        ,'Implementation/Modules/RequestSubgrantApprovalStep2/Forms/Main.ascx'
        ,'Implementation/Modules/RequestSubgrantApproval/Forms/PostSubmission.ascx')

EXEC @new_id = getid_sel @table = 'a_STANDARD_FORMS'

INSERT a_STANDARD_FORMS
	(id
   ,form_type_id
   ,name
   ,description
   ,page_key
   ,page_title
   ,control_path
   ,after_submit_control_path)
	VALUES
		(@new_id
		,1
		,'LSC - Subgrants Step 2 - Subrecipient Profile'
		,'Subrecipient Profile'
		,'SubrecipientProfile'
		,'Subrecipient Profile'
        ,'Implementation/Modules/RequestSubgrantApprovalStep2/Forms/SubrecipientProfile.ascx'
        ,'Implementation/Modules/RequestSubgrantApproval/Forms/PostSubmission.ascx')

EXEC @new_id = getid_sel @table = 'a_STANDARD_FORMS'

INSERT a_STANDARD_FORMS
	(id
   ,form_type_id
   ,name
   ,description
   ,page_key
   ,page_title
   ,control_path
   ,after_submit_control_path)
	VALUES
		(@new_id
		,1
		,'LSC - Subgrants Step 2 - Subgrant Summary'
		,'Subgrant Summary'
		,'SubgrantSummary'
		,'Subgrant Summary'
        ,'Implementation/Modules/RequestSubgrantApprovalStep2/Forms/SubgrantSummary.ascx'
        ,'Implementation/Modules/RequestSubgrantApproval/Forms/PostSubmission.ascx')

EXEC @new_id = getid_sel @table = 'a_STANDARD_FORMS'

INSERT a_STANDARD_FORMS
	(id
   ,form_type_id
   ,name
   ,description
   ,page_key
   ,page_title
   ,control_path
   ,after_submit_control_path)
	VALUES
		(@new_id
		,1
		,'LSC - Subgrants Step 2 - Subrecipient Budget'
		,'Subrecipient Budget'
		,'SubrecipientBudget'
		,'Subrecipient Budget'
        ,'Implementation/Modules/RequestSubgrantApprovalStep2/Forms/SubrecipientBudget.ascx'
        ,'Implementation/Modules/RequestSubgrantApproval/Forms/PostSubmission.ascx')

EXEC @new_id = getid_sel @table = 'a_STANDARD_FORMS'

INSERT a_STANDARD_FORMS
	(id
   ,form_type_id
   ,name
   ,description
   ,page_key
   ,page_title
   ,control_path
   ,after_submit_control_path)
	VALUES
		(@new_id
		,1
		,'LSC - Subgrants Step 2 - Uploads'
		,'Uploads'
		,'Uploads'
		,'Uploads'
        ,'Implementation/Modules/RequestSubgrantApprovalStep2/Forms/Uploads.ascx'
        ,'Implementation/Modules/RequestSubgrantApproval/Forms/PostSubmission.ascx')
		  
DECLARE @related_form_id INT

EXEC @related_form_id = getid_sel @table = 'a_STANDARD_FORM_RELATED_PAGE', @mode = 2

INSERT a_STANDARD_FORM_RELATED_PAGE
	(id
	,standard_form_id
	,page_key
	,page_title
	,control_path)
	VALUES
		(@related_form_id
		,@new_id
		,'UploadEditor'
		,'Uploads Editor'
		,'Implementation/Modules/RequestSubgrantApproval/Forms/UploadEditor.ascx')

EXEC @new_id = getid_sel @table = 'a_STANDARD_FORMS'

INSERT a_STANDARD_FORMS
	(id
   ,form_type_id
   ,name
   ,description
   ,page_key
   ,page_title
   ,control_path
   ,after_submit_control_path)
	VALUES
		(@new_id
		,1
		,'LSC - Subgrants Step 2 - Change Summary'
		,'Change Summary'
		,'ChangeSummary'
		,'Change Summary'
        ,'Implementation/Modules/RequestSubgrantApprovalStep2/Forms/ChangeSummary.ascx'
        ,'Implementation/Modules/RequestSubgrantApproval/Forms/PostSubmission.ascx')

EXEC @new_id = getid_sel @table = 'a_STANDARD_FORMS'

INSERT a_STANDARD_FORMS
	(id
   ,form_type_id
   ,name
   ,description
   ,page_key
   ,page_title
   ,control_path
   ,after_submit_control_path)
	VALUES
		(@new_id
		,4
		,'LSC - Subgrants Step 2 - Review and Submit'
		,'Review and Submit'
		,'ReviewSubmit'
		,'Review and Submit'
        ,'Implementation/Modules/RequestSubgrantApprovalStep2/Forms/ReviewSubmit.ascx'
        ,'Implementation/Modules/RequestSubgrantApproval/Forms/PostSubmission.ascx')
*/