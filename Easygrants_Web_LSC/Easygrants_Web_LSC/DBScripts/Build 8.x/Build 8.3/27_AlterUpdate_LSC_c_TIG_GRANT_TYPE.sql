ALTER TABLE [dbo].[LSC_c_TIG_GRANT_TYPE]
	ADD lsc_tig_grant_classification_id int null
GO


UPDATE LSC_c_TIG_GRANT_TYPE
	SET lsc_tig_grant_classification_id = 1
	WHERE id in (2, 17)

UPDATE LSC_c_TIG_GRANT_TYPE
	SET lsc_tig_grant_classification_id = 2
	WHERE id in (6, 9, 18)

UPDATE LSC_c_TIG_GRANT_TYPE
	SET end_date = getdate()
	WHERE lsc_tig_grant_classification_id IS NULL

UPDATE LSC_c_TIG_GRANT_TYPE
	SET end_date = NULL
	WHERE lsc_tig_grant_classification_id IS NOT NULL