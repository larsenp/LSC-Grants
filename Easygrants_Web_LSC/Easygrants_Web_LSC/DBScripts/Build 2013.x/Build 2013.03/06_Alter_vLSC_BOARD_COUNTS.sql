--Replace wftaa.is_nic_data with wftaa.lsc_board_info_source_id

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER VIEW [dbo].[vLSC_BOARD_COUNTS]

AS

    SELECT CAST(wftaa.organization_id AS VARCHAR(6)) + '_' + CAST(wftaa.time_period_id AS VARCHAR(3)) + '_' + CAST(wftaa.lsc_board_info_source_id AS VARCHAR(1)) lsc_board_counts_id,
		wftaa.organization_id,
        wftaa.time_period_id,
        wftaa.lsc_board_info_source_id,
        SUM(CASE WHEN wftaa.board_member_type_id = 1 THEN 1 ELSE 0 END) mccollum_atty_count,
        SUM(CASE WHEN wftaa.board_member_type_id = 2 THEN 1 ELSE 0 END) other_atty_count,
        SUM(CASE WHEN wftaa.board_member_type_id = 3 THEN 1 ELSE 0 END) client_member_count,
        SUM(CASE WHEN wftaa.board_member_type_id = 4 THEN 1 ELSE 0 END) other_member_count,
		COUNT(*) total_member_count
        FROM LSC_WF_TASK_ASSIGNMENT_AFFILIATIONS wftaa
        WHERE affiliation_type_id = 3
            AND organization_id IS NOT NULL
            AND time_period_id IS NOT NULL
            AND wftaa.status_id = 1
        GROUP BY wftaa.organization_id,
            wftaa.time_period_id,
            wftaa.lsc_board_info_source_id
