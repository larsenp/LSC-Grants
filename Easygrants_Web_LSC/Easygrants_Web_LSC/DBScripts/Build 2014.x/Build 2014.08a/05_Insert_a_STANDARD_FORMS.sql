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
		,'LSC - PBIF Programmatic Review - Main'
		,'Main'
		,'Main'
		,'Main'
        ,'Implementation/Modules/PBIF_Programmatic_Review/Forms/Main.ascx'
        ,'Implementation/Modules/PBIF_Programmatic_Review/Forms/PostSubmission.ascx')

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
		,'LSC - PBIF Programmatic Review - Application'
		,'Application'
		,'Application'
		,'Application'
        ,'Implementation/Modules/PBIF_Programmatic_Review/Forms/Application.ascx'
        ,'Implementation/Modules/PBIF_Programmatic_Review/Forms/PostSubmission.ascx')

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
		,'LSC - PBIF Programmatic Review (Primary) - Narrative - Project Design'
		,'Narrative - Project Design'
		,'NarrativeProjectDesign'
		,'Narrative - Project Design'
        ,'Implementation/Modules/PBIF_Programmatic_Review/Forms/Narr_ProjDesign_Prim.ascx'
        ,'Implementation/Modules/PBIF_Programmatic_Review/Forms/PostSubmission.ascx')

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
		,'LSC - PBIF Programmatic Review (Secondary) - Narrative - Project Design'
		,'Narrative - Project Design'
		,'NarrativeProjectDesign'
		,'Narrative - Project Design'
        ,'Implementation/Modules/PBIF_Programmatic_Review/Forms/Narr_ProjDesign_Sec.ascx'
        ,'Implementation/Modules/PBIF_Programmatic_Review/Forms/PostSubmission.ascx')

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
		,'LSC - PBIF Programmatic Review (Primary) - Narrative - Organizational Capacity and Staffing'
		,'Narrative - Organizational Capacity and Staffing'
		,'NarrativeOrgCapacityStaffing'
		,'Narrative - Organizational Capacity and Staffing'
        ,'Implementation/Modules/PBIF_Programmatic_Review/Forms/Narr_OrgCapacity_Prim.ascx'
        ,'Implementation/Modules/PBIF_Programmatic_Review/Forms/PostSubmission.ascx')

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
		,'LSC - PBIF Programmatic Review (Secondary) - Narrative - Organizational Capacity and Staffing'
		,'Narrative - Organizational Capacity and Staffing'
		,'NarrativeOrgCapacityStaffing'
		,'Narrative - Organizational Capacity and Staffing'
        ,'Implementation/Modules/PBIF_Programmatic_Review/Forms/Narr_OrgCapacity_Sec.ascx'
        ,'Implementation/Modules/PBIF_Programmatic_Review/Forms/PostSubmission.ascx')

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
		,'LSC - PBIF Programmatic Review (Primary) - Narrative - Cost-Effectiveness and Budget Adequacy'
		,'Narrative - Cost-Effectiveness and Budget Adequacy'
		,'NarrativeCostEffectiveness'
		,'Narrative - Cost-Effectiveness and Budget Adequacy'
        ,'Implementation/Modules/PBIF_Programmatic_Review/Forms/Narr_CostEffec_Prim.ascx'
        ,'Implementation/Modules/PBIF_Programmatic_Review/Forms/PostSubmission.ascx')

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
		,'LSC - PBIF Programmatic Review (Secondary) - Narrative - Cost-Effectiveness and Budget Adequacy'
		,'Narrative - Cost-Effectiveness and Budget Adequacy'
		,'NarrativeCostEffectiveness'
		,'Narrative - Cost-Effectiveness and Budget Adequacy'
        ,'Implementation/Modules/PBIF_Programmatic_Review/Forms/Narr_CostEffec_Sec.ascx'
        ,'Implementation/Modules/PBIF_Programmatic_Review/Forms/PostSubmission.ascx')

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
		,'LSC - PBIF Programmatic Review (Primary) - Review Summary'
		,'Review Summary'
		,'ReviewSummary'
		,'Review Summary'
        ,'Implementation/Modules/PBIF_Programmatic_Review/Forms/ReviewSummary_Prim.ascx'
        ,'Implementation/Modules/PBIF_Programmatic_Review/Forms/PostSubmission.ascx')

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
		,'LSC - PBIF Programmatic Review (Secondary) - Review Summary'
		,'Review Summary'
		,'ReviewSummary'
		,'Review Summary'
        ,'Implementation/Modules/PBIF_Programmatic_Review/Forms/ReviewSummary_Sec.ascx'
        ,'Implementation/Modules/PBIF_Programmatic_Review/Forms/PostSubmission.ascx')

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
		,'LSC - PBIF Programmatic Review - Review and Submit'
		,'Review and Submit'
		,'ReviewSubmit'
		,'Review and Submit'
        ,'Implementation/Modules/PBIF_Programmatic_Review/Forms/ReviewSubmit.ascx'
        ,'Implementation/Modules/PBIF_Programmatic_Review/Forms/PostSubmission.ascx')

