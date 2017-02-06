/****** Object:  StoredProcedure [dbo].[spCOPY_BUDGET_CATEGORIES_TO_PROJECT]    Script Date: 03/16/2009 14:23:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[spCOPY_BUDGET_CATEGORIES_TO_PROJECT]
	(@source_project_id int,
	@target_project_id int)

AS

CREATE TABLE #bc (budget_category_id int,
		source_budget_category_id int,
		project_id int,
		parent_id int,
		source_parent_id int,
		description varchar(100),
		has_child int,
		has_notes bit,
		sort_order int,
		category_type_id int,
		lsc_fund_code int) 

INSERT #bc
	SELECT * 
		FROM dbo.[fnWriteCategoriesToTempTable](@source_project_id, @target_project_id, 0)

DECLARE @source_budget_category_id int
DECLARE @budget_category_id int

DECLARE curCategory CURSOR FOR
	SELECT source_budget_category_id
		FROM #bc

OPEN curCategory
FETCH NEXT FROM curCategory INTO @source_budget_category_id
	
WHILE (@@FETCH_STATUS = 0)
BEGIN

	EXEC getid_sel @table = 'a_BUDGET_CATEGORY', 
		@id = @budget_category_id OUTPUT,
		@mode =	2

	UPDATE #bc
		SET budget_category_id = @budget_category_id
			WHERE source_budget_category_id = @source_budget_category_id

	FETCH NEXT FROM curCategory INTO @source_budget_category_id
END

CLOSE curCategory
DEALLOCATE curCategory

UPDATE #bc
	SET parent_id = 0
	WHERE source_parent_id = 0

UPDATE #bc
	SET parent_id = bcp.budget_category_id
	FROM #bc 
		JOIN #bc bcp ON #bc.source_parent_id = bcp.source_budget_category_id

INSERT a_BUDGET_CATEGORY
	(budget_category_id,
	project_id,
	parent_id,
	description,
	has_child,
	has_notes,
	sort_order,
	category_type_id,
	lsc_fund_code)
	SELECT budget_category_id,
		project_id,
		parent_id,
		description,
		has_child,
		has_notes,
		sort_order,
		category_type_id,
		lsc_fund_code
		FROM #bc
