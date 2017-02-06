CREATE VIEW vREVIEW_TOTAL_SCORE

AS

select review_wfta_id,
	sum(weighted_score) total_score
	from vREVIEW_SCORE_BY_CRITERION
	group by review_wfta_id
