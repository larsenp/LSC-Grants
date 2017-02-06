ALTER TABLE LSC_PROJECTED_STAFF
	ADD lsc_gar_form_group_id INT

GO

UPDATE LSC_PROJECTED_STAFF
	SET lsc_gar_form_group_id = 1
