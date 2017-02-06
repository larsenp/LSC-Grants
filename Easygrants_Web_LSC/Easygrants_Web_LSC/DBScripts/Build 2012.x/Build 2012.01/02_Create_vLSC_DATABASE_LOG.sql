CREATE VIEW vLSC_DATABASE_LOG

AS

SELECT dl.database_log_id,
    dl.user_id,
    dl.change_date,
    dl.table_name,
    dl.primary_key,
    dl.change_type,
    p.name_first,
    p.name_last
    FROM DATABASE_LOG dl
        LEFT JOIN easygrants_user eu ON dl.user_id = eu.easygrants_user_id
        LEFT JOIN person p ON eu.person_id = p.person_id
