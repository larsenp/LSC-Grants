/*
DECLARE @main_form_id INT
	,@new_id INT

SELECT @main_form_id = ID 
	FROM a_STANDARD_FORMS
	WHERE name = 'LSC - Subgrants Step 1 - Main'

EXEC @new_id = getid_sel @table = 'a_STANDARD_FORM_RELATED_PAGE'
	,@mode = 2

INSERT a_STANDARD_FORM_RELATED_PAGE
	(id
	,standard_form_id
	,page_key
	,page_title
	,control_path)
	VALUES
		(@new_id
		,@main_form_id
		,'AutoSubmit'
		,'Auto Submit'
		,'Implementation/Modules/RequestPSA/Forms/AutoSubmit.ascx')
	*/