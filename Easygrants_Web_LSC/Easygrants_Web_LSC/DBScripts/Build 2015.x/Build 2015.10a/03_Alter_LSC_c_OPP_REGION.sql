ALTER TABLE LSC_c_OPP_REGION
	ADD pbif_reviewer_person_id INT

GO

UPDATE LSC_c_OPP_REGION
	SET pbif_reviewer_person_id = 423
	WHERE abbr in ('North', 'West')

UPDATE LSC_c_OPP_REGION
	SET pbif_reviewer_person_id = 1450
	WHERE abbr = 'South'
