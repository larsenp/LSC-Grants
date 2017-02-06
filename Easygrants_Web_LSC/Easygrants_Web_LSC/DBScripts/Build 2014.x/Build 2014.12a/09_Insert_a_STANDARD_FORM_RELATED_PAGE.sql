DECLARE @new_id INT

EXEC @new_id = getid_sel @table = 'a_STANDARD_FORM_RELATED_PAGE'

INSERT a_STANDARD_FORM_RELATED_PAGE
	(id,
	standard_form_id,
	page_key,
	page_title,
	control_path)
	SELECT
		@new_id,
		id,
		'Contracts',
		'Contracts',
		'Implementation/Modules/TIG_Application/Forms/Contracts.ascx'
		FROM a_STANDARD_FORMS
		WHERE name = 'LSC - TIG - Revise Budget - Budget Narrative - 2013nEarlier'