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
		,4
		,'LSC - Subgrants Step 1 - Review and Submit'
		,'Review and Submit'
		,'ReviewSubmit'
		,'Review and Submit'
        ,'Implementation/Modules/RequestPSA/Forms/ReviewSubmit.ascx'
        ,'Implementation/Modules/RequestSubgrantApproval/Forms/PostSubmission.ascx')

