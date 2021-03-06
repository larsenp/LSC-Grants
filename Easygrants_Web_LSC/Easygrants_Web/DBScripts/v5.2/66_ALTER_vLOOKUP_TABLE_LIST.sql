
ALTER VIEW [dbo].[vLOOKUP_TABLE_LIST]
AS
SELECT     dbo.s_ID_GEN.id, OBJECT_NAME(dbo.sysindexes.id) AS TableName, '' AS DataObjectDefinitionKey, dbo.s_ID_GEN.description, 
                      dbo.sysindexes.rowcnt AS NumRows, dbo.s_ID_GEN.lookup_table_type_id
FROM         dbo.sysindexes INNER JOIN
                      dbo.s_ID_GEN ON OBJECT_NAME(dbo.sysindexes.id) = dbo.s_ID_GEN.table_name AND dbo.s_ID_GEN.is_code_table = 1
WHERE     (dbo.sysindexes.indid IN (1, 0))
