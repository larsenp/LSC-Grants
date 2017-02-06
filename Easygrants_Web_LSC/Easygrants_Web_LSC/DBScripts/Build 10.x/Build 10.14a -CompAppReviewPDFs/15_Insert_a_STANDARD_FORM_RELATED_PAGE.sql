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
		'VarianceExplanationEditor',
		'Variance Explanation Editor',
		'Implementation/Modules/TIG_FinalBudget/Forms/VarianceEditor.ascx'
		FROM a_STANDARD_FORMS
		WHERE name = 'LSC - TIG - Submit Final Budget - Explanation of Variances'
