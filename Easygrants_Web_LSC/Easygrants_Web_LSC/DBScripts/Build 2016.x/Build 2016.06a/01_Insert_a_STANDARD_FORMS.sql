DECLARE @next_id INT

--Budget form
EXEC @next_id = getid_sel @table = 'a_STANDARD_FORMS', @mode = 2

INSERT a_STANDARD_FORMS
	(id
	,form_type_id
	,name
	,description
	,page_key
	,page_title
	,control_path
	,after_submit_control_path
	,is_client
	,is_active)
	VALUES
		(@next_id
		,1
		,'LSC - TIG - Submit Final Budget - Budget'
		,'LSC - TIG - Submit Final Budget - Budget (2014 and later)'
		,'FinalBudget'
		,'Final Budget'
		,'Implementation/Modules/TIG_FinalBudget/Forms/FinalBudget2014.ascx'
		,'Implementation/Modules/TIG_FinalBudget/Forms/PostSubmission.ascx'
		,1
		,1)

--Variances form
EXEC @next_id = getid_sel @table = 'a_STANDARD_FORMS', @mode = 2

INSERT a_STANDARD_FORMS
	(id
	,form_type_id
	,name
	,description
	,page_key
	,page_title
	,control_path
	,is_client
	,is_active)
	VALUES
		(@next_id
		,1
		,'LSC - TIG - Submit Final Budget - Explanation of Variances'
		,'LSC - TIG - Submit Final Budget - Explanation of Variances (2014 and later)'
		,'BudgetVariances'
		,'Explanation of Variance of Budget Items'
		,'Implementation/Modules/TIG_FinalBudget/Forms/Variances2014.ascx'
		,1
		,1)

--Variances editor (related page to Variances form)
DECLARE @related_id INT
EXEC @related_id = getid_sel @table = 'a_STANDARD_FORM_RELATED_PAGE', @mode = 2

INSERT a_STANDARD_FORM_RELATED_PAGE
           (id
           ,standard_form_id
           ,page_key
           ,page_title
           ,control_path)
     VALUES
           (@related_id
           ,@next_id
           ,'VarianceExplanationEditor'
           ,'Variance Explanation Editor'
           ,'Implementation/Modules/TIG_FinalBudget/Forms/VarianceEditor2014.ascx')


