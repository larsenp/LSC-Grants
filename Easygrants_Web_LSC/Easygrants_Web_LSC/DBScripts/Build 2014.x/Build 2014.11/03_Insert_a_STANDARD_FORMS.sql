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
		,'LSC - Midwest Legal Disaster Coordination Project Application - Application'
		,'Application'
		,'Application'
		,'Application'
        ,'Implementation/Modules/MLDCP_Application/Forms/Application.ascx'
        ,'Implementation/Modules/MLDCP_Application/Forms/PostSubmission.ascx')

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
		,'LSC - Midwest Legal Disaster Coordination Project Application - Review and Submit'
		,'Review and Submit'
		,'ReviewSubmit'
		,'Review and Submit'
        ,'Implementation/Modules/MLDCP_Application/Forms/ReviewSubmit.ascx'
        ,'Implementation/Modules/MLDCP_Application/Forms/PostSubmission.ascx')

