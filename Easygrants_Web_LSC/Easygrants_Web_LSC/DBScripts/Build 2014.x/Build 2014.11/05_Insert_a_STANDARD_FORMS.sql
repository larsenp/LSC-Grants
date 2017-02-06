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
		,1
		,'LSC - PBIF Grant Acceptance - Upload Grant Acceptance'
		,'Upload Grant Acceptance'
		,'UploadGrantAcceptance'
		,'Upload Grant Acceptance'
        ,'Implementation/Modules/PBIF_Grant_Acceptance/Forms/UploadGrantAcceptance.ascx'
        ,'Implementation/Modules/PBIF_Grant_Acceptance/Forms/PostSubmission.ascx')

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
		,'LSC - PBIF Grant Acceptance - Review and Submit'
		,'Review and Submit'
		,'ReviewSubmit'
		,'Review and Submit'
        ,'Implementation/Modules/PBIF_Grant_Acceptance/Forms/ReviewSubmit.ascx'
        ,'Implementation/Modules/PBIF_Grant_Acceptance/Forms/PostSubmission.ascx')

