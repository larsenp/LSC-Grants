ALTER TABLE LSC_PRO_BONO_REVIEW_SCORE
	DROP COLUMN score

GO

ALTER TABLE LSC_PRO_BONO_REVIEW_SCORE
	ADD lsc_pro_bono_review_score_lkp_id int 