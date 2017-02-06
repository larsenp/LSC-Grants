/****** Object:  StoredProcedure [dbo].[spUPDATE_IDGEN]    Script Date: 03/10/2009 12:03:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
ALTER procedure [dbo].[spUPDATE_IDGEN]
	(@select bit = 1)

as

/*
INSERT INTO s_ID_GEN 
	(table_name, is_code_table)
	SELECT o.name, 0 
	FROM sysobjects o
		LEFT JOIN s_ID_GEN ig on o.name = ig.table_name
	WHERE o.type = 'U' 
		AND ig.id is null
*/

DELETE s_ID_GEN
	FROM s_ID_GEN ig 
		LEFT JOIN sysobjects o on ig.table_name = o.name
			AND o.type = 'U'
	WHERE o.id is null

CREATE TABLE #id
(table_name varchar(255),
max_id int default 0)

DECLARE @table_name varchar(100), @column_name varchar(100), @max_id int, @sql varchar(255)
SELECT @max_id = 0

DECLARE table_name CURSOR FOR
	SELECT table_name FROM s_ID_GEN

OPEN table_name
FETCH NEXT FROM table_name INTO @table_name

WHILE (@@FETCH_STATUS=0)
	BEGIN
		SELECT @column_name = syscolumns.name
		FROM syscolumns
		INNER JOIN sysobjects ON syscolumns.id = sysobjects.id
		WHERE sysobjects.name = @table_name
		AND syscolumns.colorder = 1

		SELECT @sql = 'INSERT INTO #id (max_id, table_name) SELECT MAX(' + @column_name + '), ''' + @table_name + ''' FROM ' + @table_name

		EXEC (@sql)

		FETCH NEXT FROM table_name INTO @table_name
	END

CLOSE table_name
DEALLOCATE table_name

UPDATE #id SET max_id = max_id + 1
UPDATE #id SET max_id = 1 WHERE max_id IS NULL

UPDATE s_ID_GEN 
	SET next_id = #id.max_id
	FROM #id
		JOIN s_ID_GEN ig on #id.table_name = ig.table_name

IF @select = 1
	SELECT * FROM s_ID_GEN


