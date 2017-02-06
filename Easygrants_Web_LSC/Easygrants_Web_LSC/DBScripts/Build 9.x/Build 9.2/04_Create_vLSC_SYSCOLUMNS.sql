CREATE VIEW vLSC_SYSCOLUMNS

AS

SELECT c.object_id,
	c.name,
	c.column_id,
	c.system_type_id,
	st.name system_type,
	CASE WHEN st.name LIKE '%char' OR st.name = 'sysname' THEN '(' + CASE WHEN c.max_length = -1 THEN 'max' ELSE CAST(c.max_length AS VARCHAR(4))  END + ')'
		ELSE '' END column_size,
	c.max_length,
	c.precision,
	c.scale
	FROM sys.columns c
		JOIN sys.systypes st ON c.system_type_id = st.xtype
