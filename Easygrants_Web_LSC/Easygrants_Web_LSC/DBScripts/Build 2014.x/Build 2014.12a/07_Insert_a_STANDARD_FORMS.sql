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
		,'LSC - TIG - Revise Budget - Budget - 2013nEarlier'
		,'TIG - Revise Budget - Budget - 2013nEarlier'
		,'Budget'
		,'Budget'
        ,'Implementation/Modules/TIG_ReviseBudget_2013nEarlier/Forms/Budget.ascx'
        ,'Implementation/Modules/TIG_ReviseBudget_2013nEarlier/Forms/PostSubmission.ascx')



DECLARE @new_id INT

EXEC @new_id = getid_sel @table = 'a_STANDARD_FORMS'

INSERT a_STANDARD_FORMS
	(id
   ,form_type_id
   ,name
   ,description
   ,page_key
   ,page_title
   ,control_path)
	VALUES
		(@new_id
		,1
		,'LSC - TIG - Revise Budget - Budget Narrative - 2013nEarlier'
		,'TIG - Revise Budget - Budget Narrative - 2013nEarlier'
		,'BudgetNarrative'
		,'TIG - Revise Budget - Budget Narrative'
        ,'Implementation/Modules/TIG_ReviseBudget_2013nEarlier/Forms/BudgetNarrative.ascx')



DECLARE @new_id INT

EXEC @new_id = getid_sel @table = 'a_STANDARD_FORMS'

INSERT a_STANDARD_FORMS
	(id
   ,form_type_id
   ,name
   ,description
   ,page_key
   ,page_title
   ,control_path)
	VALUES
		(@new_id
		,4
		,'LSC - TIG - Revise Budget 2013nEarlier- Review and Submit'
		,'TIG - Revise Budget 2013nEarlier- Review and Submit'
		,'TIGReviseBudget2013nEarlierReviewSubmit'
		,'TIG - Revise Budget - Review and Submit'
        ,'Implementation/Modules/TIG_ReviseBudget_2013nEarlier/Forms/ReviewSubmit.ascx')