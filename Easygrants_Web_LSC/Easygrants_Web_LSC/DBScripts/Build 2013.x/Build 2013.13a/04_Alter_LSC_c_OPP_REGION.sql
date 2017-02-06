ALTER TABLE LSC_c_OPP_REGION
	ADD tig_primary_reviewer_person_id int

GO

UPDATE LSC_c_OPP_REGION
	SET tig_primary_reviewer_person_id = 905
	WHERE abbr = 'North'

UPDATE LSC_c_OPP_REGION
	SET tig_primary_reviewer_person_id = 500
	WHERE abbr = 'South'

UPDATE LSC_c_OPP_REGION
	SET tig_primary_reviewer_person_id = 433
	WHERE abbr = 'West'
