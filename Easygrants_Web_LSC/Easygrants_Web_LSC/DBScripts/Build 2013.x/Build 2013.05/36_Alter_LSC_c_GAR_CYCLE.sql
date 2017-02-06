ALTER TABLE LSC_c_GAR_CYCLE
	ADD time_period_id int

GO

UPDATE LSC_c_GAR_CYCLE
	SET time_period_id = tp.id
	FROM LSC_c_GAR_CYCLE gc
		JOIN c_TIME_PERIOD tp ON gc.sort_order = tp.sort_order

update lsc_c_gar_cycle	
	set sort_order = 20120
		where id = 12

update lsc_c_gar_cycle	
	set sort_order = 20121
		where id = 13
