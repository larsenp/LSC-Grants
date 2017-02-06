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
		,'LSC - PBIF President Review - Review Summary'
		,'Review Summary'
		,'ReviewSummary'
		,'Review Summary'
        ,'Implementation/Modules/PBIF_President_Review/Forms/ReviewSummary.ascx'
        ,'Implementation/Modules/PBIF_President_Review/Forms/PostSubmission.ascx')

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
		,'LSC - PBIF President Review - Review and Submit'
		,'Review and Submit'
		,'ReviewSubmit'
		,'Review and Submit'
        ,'Implementation/Modules/PBIF_President_Review/Forms/ReviewSubmit.ascx'
        ,'Implementation/Modules/PBIF_President_Review/Forms/PostSubmission.ascx')

