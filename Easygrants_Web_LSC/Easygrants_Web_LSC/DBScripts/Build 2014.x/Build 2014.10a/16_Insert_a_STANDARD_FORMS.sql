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
		,'LSC - PBIF Risk Assessment Review - Risk Assessment Review'
		,'Risk Assessment Review'
		,'RiskAssessmentReview'
		,'Risk Assessment Review'
        ,'Implementation/Modules/PBIF_Risk_Assessment_Review/Forms/RiskAssessmentReview.ascx'
        ,'Implementation/Modules/PBIF_Risk_Assessment_Review/Forms/PostSubmission.ascx')

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
		,'LSC - PBIF Risk Assessment Review - Review and Submit'
		,'Review and Submit'
		,'ReviewSubmit'
		,'Review and Submit'
        ,'Implementation/Modules/PBIF_Risk_Assessment_Review/Forms/ReviewSubmit.ascx'
        ,'Implementation/Modules/PBIF_Risk_Assessment_Review/Forms/PostSubmission.ascx')

