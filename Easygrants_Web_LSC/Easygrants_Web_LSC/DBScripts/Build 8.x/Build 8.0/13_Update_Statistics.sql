--these statements solve the performance problem documented in Mantis 1677.

UPDATE STATISTICS LSC_OFFICE
    WITH FULLSCAN

UPDATE STATISTICS LSC_STAFF_DETAIL
    WITH FULLSCAN
