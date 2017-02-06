USE [Easygrants]
GO
/****** Object:  UserDefinedFunction [dbo].[fnWriteCategoriesToTempTable]    Script Date: 02/12/2008 17:14:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fnWriteCategoriesToTempTable] (@source_project_id int, 
					@target_project_id int, 
					@parent_id int)
	RETURNS @temp_table table (budget_category_id int,
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
	
AS
BEGIN
	
	DECLARE @budget_category_id int,
		@description varchar(100), 
		@has_child int, 
		@has_notes bit, 
		@sort_order int, 
		@category_type_id int, 
		@lsc_fund_code int

	DECLARE curCategory CURSOR FOR
		SELECT budget_category_id,
			description, 
			has_child,	
			has_notes, 
			sort_order, 
			category_type_id, 
			lsc_fund_code
			FROM a_BUDGET_CATEGORY
			WHERE project_id = @source_project_id
				AND parent_id = @parent_id
	OPEN curCategory
	FETCH NEXT FROM curCategory INTO @budget_category_id, @description, 
				@has_child, @has_notes, @sort_order, 
				@category_type_id, @lsc_fund_code
	
	WHILE (@@FETCH_STATUS = 0)
	BEGIN

		INSERT @temp_table
				(budget_category_id,
				source_budget_category_id,
				project_id,
				parent_id,
				source_parent_id,
				description,
				has_child,
				has_notes,
				sort_order,
				category_type_id,
				lsc_fund_code)
			VALUES(-1,
				@budget_category_id,
				@target_project_id,
				-1,
				@parent_id,
				@description,
				@has_child,
				@has_notes,
				@sort_order,
				@category_type_id,
				@lsc_fund_code)

		IF @has_child = 1
			BEGIN

			INSERT @temp_table
				(budget_category_id,
				source_budget_category_id,
				project_id,
				parent_id,
				source_parent_id,
				description,
				has_child,
				has_notes,
				sort_order,
				category_type_id,
				lsc_fund_code)
				SELECT budget_category_id,
					source_budget_category_id,
					project_id,
					parent_id,
					source_parent_id,
					description,
					has_child,
					has_notes,
					sort_order,
					category_type_id,
					lsc_fund_code
					FROM dbo.fnWriteCategoriesToTempTable (@source_project_id, @target_project_id, @budget_category_id)

		END
	FETCH NEXT FROM curCategory INTO @budget_category_id, @description, 
				@has_child, @has_notes, @sort_order, 
				@category_type_id, @lsc_fund_code

	END
	
	CLOSE curCategory
	DEALLOCATE curCategory

	RETURN 

END