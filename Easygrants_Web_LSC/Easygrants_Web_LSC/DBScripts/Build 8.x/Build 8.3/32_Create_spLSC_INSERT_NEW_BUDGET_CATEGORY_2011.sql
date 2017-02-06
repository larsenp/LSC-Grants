create procedure spLSC_INSERT_NEW_BUDGET_CATEGORY_2011 (@project_id int)

AS

declare @d14_parent_id int

declare @d4_parent_id int

--Projected Revenue (D-14)
select @d14_parent_id = bc_gc.budget_category_id
	from a_budget_category bc
		join a_budget_category bc_c on bc.budget_category_id = bc_c.parent_id
		join a_budget_category bc_gc on bc_c.budget_category_id = bc_gc.parent_id
	where bc.project_id = @project_id
		and bc.parent_id = 0
		and bc_c.category_type_id = 2
		and bc_gc.description = '(B) Non-LSC Funding Sources'

--Current Revenue (D-4)
select @d4_parent_id = bc_gc.budget_category_id
	from a_budget_category bc
		join a_budget_category bc_c on bc.budget_category_id = bc_c.parent_id
		join a_budget_category bc_gc on bc_c.budget_category_id = bc_gc.parent_id
	where bc.project_id = @project_id
		and bc.parent_id = 0
		and bc_c.category_type_id = 4
		and bc_gc.description = '(A) Non-LSC Funding Sources'

--select * from a_budget_category where parent_id = @d14_parent_id
update a_budget_category 
	set sort_order = sort_order + 1
	where parent_id = @d14_parent_id
		and sort_order > 32

--select * from a_budget_category where parent_id = @d4_parent_id
update a_budget_category 
	set sort_order = sort_order + 1
	where parent_id = @d4_parent_id
		and sort_order > 6

declare @budget_category_id int

EXEC @budget_category_id = getid_sel @table = 'a_BUDGET_CATEGORY', @mode = 2

INSERT INTO [a_BUDGET_CATEGORY]
           ([budget_category_id]
           ,[project_id]
           ,[parent_id]
           ,[description]
           ,[has_child]
           ,[has_notes]
           ,[sort_order]
           ,[category_type_id]
           ,[lsc_fund_code]
           ,[is_external_help_url])
     VALUES
           (@budget_category_id
           ,@project_id
           ,@d14_parent_id
           ,'Filing Fees, Surcharges, etc.'
           ,0
           ,0
           ,33
           ,2
           ,41
           ,0)

EXEC @budget_category_id = getid_sel @table = 'a_BUDGET_CATEGORY', @mode = 2

INSERT INTO [a_BUDGET_CATEGORY]
           ([budget_category_id]
           ,[project_id]
           ,[parent_id]
           ,[description]
           ,[has_child]
           ,[has_notes]
           ,[sort_order]
           ,[category_type_id]
           ,[lsc_fund_code]
           ,[is_external_help_url])
     VALUES
           (@budget_category_id
           ,@project_id
           ,@d4_parent_id
           ,'Filing Fees, Surcharges, etc.'
           ,0
           ,0
           ,7
           ,4
           ,41
           ,0)

