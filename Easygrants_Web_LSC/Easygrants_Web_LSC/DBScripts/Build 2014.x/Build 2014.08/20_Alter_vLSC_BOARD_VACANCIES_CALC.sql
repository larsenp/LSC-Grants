ALTER VIEW [dbo].[vLSC_BOARD_VACANCIES_CALC]

AS

SELECT bs.lsc_board_structure_id,
      bs.mccollum_atty_bylaw - ISNULL(bc.mccollum_atty_count, 0) mccollum_atty_vacancies,
      bs.other_atty_bylaw - ISNULL(bc.other_atty_count, 0) other_atty_vacancies,
      bs.client_member_bylaw - ISNULL(bc.client_member_count, 0) client_member_vacancies,
      bs.other_member_bylaw - ISNULL(bc.other_member_count, 0) other_member_vacancies,
      bs.mccollum_atty_bylaw - ISNULL(bc.mccollum_atty_count, 0) + bs.other_atty_bylaw - ISNULL(bc.other_atty_count, 0) +
            bs.client_member_bylaw - ISNULL(bc.client_member_count, 0) + bs.other_member_bylaw - ISNULL(bc.other_member_count, 0) total_vacancies
      FROM LSC_BOARD_STRUCTURE bs
              LEFT JOIN vLSC_BOARD_COUNTS bc ON bs.organization_id = bc.organization_id
                  AND bs.time_period_id = bc.time_period_id
                  AND bs.lsc_board_info_source_id = bc.lsc_board_info_source_id