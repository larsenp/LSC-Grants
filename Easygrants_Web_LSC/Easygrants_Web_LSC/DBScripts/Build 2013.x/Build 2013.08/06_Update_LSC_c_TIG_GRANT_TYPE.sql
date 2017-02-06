

UPDATE LSC_c_TIG_GRANT_TYPE
 SET end_date = getdate()
 WHERE lsc_tig_grant_classification_id = 2
   AND description = 'Website Improvement and Innovation'


UPDATE LSC_c_TIG_GRANT_TYPE
 SET end_date = getdate()
 WHERE lsc_tig_grant_classification_id = 2
   AND description = 'Replication'

