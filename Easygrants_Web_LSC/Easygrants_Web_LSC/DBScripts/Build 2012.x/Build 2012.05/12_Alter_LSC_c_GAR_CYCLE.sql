/*Already done after 2012.04 deployment to bring DB in sync with data definition
ALTER TABLE LSC_c_GAR_CYCLE
	ADD is_interim BIT NOT NULL DEFAULT 0
*/
GO

INSERT LSC_c_GAR_CYCLE
	(id, abbr, description, sort_order, is_interim)
	VALUES(12, 
		'2012 Interim',
		'2012 Interim GAR Cycle',
		2012,
		1)

UPDATE LSC_c_GAR_CYCLE
	SET abbr = '2011 Year-End'
	WHERE abbr = '2011'