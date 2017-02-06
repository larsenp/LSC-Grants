CREATE TABLE LSC_REVIEW_CYCLE_STAGE
	(lsc_review_cycle_stage_id int,
	review_cycle_stage_id int,
	time_period_id int)

INSERT s_ID_GEN
	(table_name,
	next_id,
	is_code_table)
	VALUES('LSC_REVIEW_CYCLE_STAGE',
		1,
		0)

INSERT LSC_REVIEW_CYCLE_STAGE
	(lsc_review_cycle_stage_id,
	review_cycle_stage_id,
	time_period_id)
	SELECT review_cycle_stage_id,
		review_cycle_stage_id,
		4
		FROM REVIEW_CYCLE_STAGE
	WHERE name LIKE 'REVIEW 2009%'

INSERT LSC_REVIEW_CYCLE_STAGE
	(lsc_review_cycle_stage_id,
	review_cycle_stage_id,
	time_period_id)
	SELECT review_cycle_stage_id,
		review_cycle_stage_id,
		7
		FROM REVIEW_CYCLE_STAGE
	WHERE name LIKE 'REVIEW 2010%'

EXEC spUPDATE_IDGEN