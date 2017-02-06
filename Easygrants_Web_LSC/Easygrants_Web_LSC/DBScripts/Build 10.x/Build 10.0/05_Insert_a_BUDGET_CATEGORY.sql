/************************************************
This script inserts the budget categories for the new revenue category of "Filing Fees" (fund code 41) for Form D-4.
It also adjusts the sort order of existing budget categories so that the new category will 
sort correctly.
*************************************************/

--Create temp table to hold new budget category information. Use 
--defaults to set values that will be constant for all new categories.
CREATE TABLE #bc (
	ident int identity(0,1),
	[budget_category_id] [int] NULL,
	[project_id] [int] NULL,
	[parent_id] [int] NULL,
	[description] [varchar](100) NULL default 'Filing Fees',
	[has_child] [int] NULL default 0,
	[has_notes] [bit] NOT NULL DEFAULT 0,
	[sort_order] [int] NULL default 33,
	[category_type_id] [int] NULL default 7,
	[lsc_fund_code] [int] NULL default 41,
	[guideline] [varchar](500) NULL,
	[is_external_help_url] [bit] NOT NULL DEFAULT ((0)),
	[is_indirect_cost] [bit] NULL)

--Insert one row into temp table for each funding cycle that needs the new Filing Fees budget category.
--(i.e., one row for each funding cycle that has a Form D-4 task assignment for 2011).
insert #bc (project_id)
	select gp.wf_project_id
		from wf_task_assignment wfta
			join vwfta_competition_year wcy on wfta.wf_task_assignment_id = wcy.wf_task_assignment_id
			join grantee_project gp on wfta.grantee_project_id = gp.grantee_project_id
		where wfta.wf_task_id = 20
			and wcy.wfta_year = 2011

--Get the appropriate parent ID for each new budget category, navigating down through the hierarchy
----bc1: top-level category for the project
----bc2: top-level category for Form D-4
----bc3: Non-LSC funding category for form D-3
update #bc
	set parent_id = bc3.budget_category_id
	from #bc
		join a_budget_category bc1 on #bc.project_id = bc1.project_id
			and bc1.parent_id = 0
		join a_budget_category bc2 on bc1.budget_category_id = bc2.parent_id
			and bc2.category_type_id = 7
		join a_budget_category bc3 on bc2.budget_category_id = bc3.parent_id
			and bc3.sort_order = 19

--bump up sort order of existing budget categories to allow the new category to slot in at 33
update a_budget_category
	set sort_order = a_budget_category.sort_order + 1
	from #bc
		join a_budget_category on #bc.parent_id = a_budget_category.parent_id
			and a_budget_category.sort_order >= 33

--Set IDs in temp table to prepare for insert
declare @count int, @first_id int

exec spupdate_idgen @select = 0

exec @first_id = dbo.spGETID_RANGE_SEL
	@table = 'a_BUDGET_CATEGORY',
	@mode = 2

update #bc
	set budget_category_id = ident + @first_id

--Insert new budget categories
INSERT [a_BUDGET_CATEGORY]
           ([budget_category_id]
           ,[project_id]
           ,[parent_id]
           ,[description]
           ,[has_child]
           ,[has_notes]
           ,[sort_order]
           ,[category_type_id]
           ,[lsc_fund_code]
           ,[guideline]
           ,[is_external_help_url]
           ,[is_indirect_cost])
     SELECT
           budget_category_id
           ,project_id
           ,parent_id
           ,description
           ,has_child
           ,has_notes
           ,sort_order
           ,category_type_id
           ,lsc_fund_code
           ,guideline
           ,is_external_help_url
           ,is_indirect_cost
		FROM #bc

select * from #bc 
drop table #bc