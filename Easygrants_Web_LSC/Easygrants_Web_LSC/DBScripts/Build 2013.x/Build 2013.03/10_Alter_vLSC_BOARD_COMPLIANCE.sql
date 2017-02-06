/****** Object:  View [dbo].[vLSC_BOARD_COMPLIANCE]    Script Date: 01/31/2013 10:32:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER VIEW [dbo].[vLSC_BOARD_COMPLIANCE]

AS

SELECT lsc_board_counts_id,
	organization_id,
    time_period_id,
    lsc_board_info_source_id,
	total_member_count,
	CASE WHEN total_member_count = 0 THEN 0 WHEN client_member_count/CAST(total_member_count AS DECIMAL) > (1.0/3.0) THEN 1 ELSE 0 END client_member_compliant,
	CASE WHEN total_member_count = 0 THEN 0 WHEN (mccollum_atty_count + other_atty_count)/CAST(total_member_count AS DECIMAL) >= 0.6 THEN 1 ELSE 0 END total_atty_compliant,
	CASE WHEN total_member_count = 0 THEN 0 WHEN mccollum_atty_count/CAST(total_member_count AS DECIMAL) > 0.5 THEN 1 ELSE 0 END mccollum_atty_compliant,
	CASE WHEN total_member_count = 0 THEN 0 
		WHEN client_member_count/CAST(total_member_count AS DECIMAL) > (1.0/3.0) 
			AND (mccollum_atty_count + other_atty_count)/CAST(total_member_count AS DECIMAL) >= 0.6 
			AND mccollum_atty_count/CAST(total_member_count AS DECIMAL) > 0.5 
			THEN 1 ELSE 0 END overall_compliant
	FROM vLSC_BOARD_COUNTS
