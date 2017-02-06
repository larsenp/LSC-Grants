/*Already done after build 2012.04 in order to bring database into sync with data definition
ALTER TABLE LSC_a_WF_TASK
	ADD lsc_gar_form_group_id INT

GO

UPDATE LSC_a_WF_TASK
	SET lsc_gar_form_group_id = CAST(is_projected AS INT) + 1
	WHERE form_number IS NOT NULL
*/
ALTER TABLE LSC_a_WF_TASK
	DROP COLUMN is_projected