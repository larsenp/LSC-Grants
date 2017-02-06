declare @budget_category_id int, @parent_id int, @total_id int
--delete from a_BUDGET_CATEGORY where project_id=3050

exec getid_sel @table = 'a_BUDGET_CATEGORY', @id = @budget_category_id OUTPUT, @mode = 2
set @total_id = @budget_category_id
INSERT INTO [dbo].[a_BUDGET_CATEGORY]([budget_category_id],[project_id],[parent_id],[description],[has_child],[has_notes] ,[sort_order] ,[category_type_id]) VALUES (@budget_category_id,3050 ,0  ,'TOTALS' ,1,0 ,1 ,NULL)

exec getid_sel @table = 'a_BUDGET_CATEGORY', @id = @budget_category_id OUTPUT, @mode = 2
set @parent_id = @budget_category_id
INSERT INTO [dbo].[a_BUDGET_CATEGORY]([budget_category_id],[project_id],[parent_id],[description],[has_child],[has_notes] ,[sort_order] ,[category_type_id]) VALUES (@budget_category_id,3050 ,@total_id  ,'1. Personnel Expenses' ,1,0 ,1 ,1)
exec getid_sel @table = 'a_BUDGET_CATEGORY', @id = @budget_category_id OUTPUT, @mode = 2
INSERT INTO [dbo].[a_BUDGET_CATEGORY]([budget_category_id],[project_id],[parent_id],[description],[has_child],[has_notes] ,[sort_order] ,[category_type_id]) VALUES (@budget_category_id,3050 ,@parent_id  ,'a.	Salaries/Wages' ,0,0 ,2 ,1)
exec getid_sel @table = 'a_BUDGET_CATEGORY', @id = @budget_category_id OUTPUT, @mode = 2
INSERT INTO [dbo].[a_BUDGET_CATEGORY]([budget_category_id],[project_id],[parent_id],[description],[has_child],[has_notes] ,[sort_order] ,[category_type_id]) VALUES (@budget_category_id,3050 ,@parent_id  ,'b.	Fringe Benefits' ,0,0 ,3 ,1)

exec getid_sel @table = 'a_BUDGET_CATEGORY', @id = @budget_category_id OUTPUT, @mode = 2
set @parent_id = @budget_category_id
INSERT INTO [dbo].[a_BUDGET_CATEGORY]([budget_category_id],[project_id],[parent_id],[description],[has_child],[has_notes] ,[sort_order] ,[category_type_id]) VALUES (@budget_category_id,3050 ,@total_id  ,'2. Project Expenses' ,1,0 ,4 ,1)
exec getid_sel @table = 'a_BUDGET_CATEGORY', @id = @budget_category_id OUTPUT, @mode = 2
INSERT INTO [dbo].[a_BUDGET_CATEGORY]([budget_category_id],[project_id],[parent_id],[description],[has_child],[has_notes] ,[sort_order] ,[category_type_id]) VALUES (@budget_category_id,3050 ,@parent_id  ,'a.	Travel' ,0,0 ,5 ,1)
exec getid_sel @table = 'a_BUDGET_CATEGORY', @id = @budget_category_id OUTPUT, @mode = 2
INSERT INTO [dbo].[a_BUDGET_CATEGORY]([budget_category_id],[project_id],[parent_id],[description],[has_child],[has_notes] ,[sort_order] ,[category_type_id]) VALUES (@budget_category_id,3050 ,@parent_id  ,'b.	Equipment' ,0,0 ,6 ,1)
exec getid_sel @table = 'a_BUDGET_CATEGORY', @id = @budget_category_id OUTPUT, @mode = 2
INSERT INTO [dbo].[a_BUDGET_CATEGORY]([budget_category_id],[project_id],[parent_id],[description],[has_child],[has_notes] ,[sort_order] ,[category_type_id]) VALUES (@budget_category_id,3050 ,@parent_id  ,'c.	Software' ,0,0 ,7 ,1)
exec getid_sel @table = 'a_BUDGET_CATEGORY', @id = @budget_category_id OUTPUT, @mode = 2
INSERT INTO [dbo].[a_BUDGET_CATEGORY]([budget_category_id],[project_id],[parent_id],[description],[has_child],[has_notes] ,[sort_order] ,[category_type_id]) VALUES (@budget_category_id,3050 ,@parent_id  ,'d.	Supplies' ,0,0 ,8 ,1)
exec getid_sel @table = 'a_BUDGET_CATEGORY', @id = @budget_category_id OUTPUT, @mode = 2
INSERT INTO [dbo].[a_BUDGET_CATEGORY]([budget_category_id],[project_id],[parent_id],[description],[has_child],[has_notes] ,[sort_order] ,[category_type_id]) VALUES (@budget_category_id,3050 ,@parent_id  ,'e.	Communication' ,0,0 ,9 ,1)
exec getid_sel @table = 'a_BUDGET_CATEGORY', @id = @budget_category_id OUTPUT, @mode = 2
INSERT INTO [dbo].[a_BUDGET_CATEGORY]([budget_category_id],[project_id],[parent_id],[description],[has_child],[has_notes] ,[sort_order] ,[category_type_id]) VALUES (@budget_category_id,3050 ,@parent_id  ,'f.	Training' ,0,0 ,10 ,1)
exec getid_sel @table = 'a_BUDGET_CATEGORY', @id = @budget_category_id OUTPUT, @mode = 2
INSERT INTO [dbo].[a_BUDGET_CATEGORY]([budget_category_id],[project_id],[parent_id],[description],[has_child],[has_notes] ,[sort_order] ,[category_type_id]) VALUES (@budget_category_id,3050 ,@parent_id  ,'g.	Evaluation' ,0,0 ,11 ,1)
exec getid_sel @table = 'a_BUDGET_CATEGORY', @id = @budget_category_id OUTPUT, @mode = 2
INSERT INTO [dbo].[a_BUDGET_CATEGORY]([budget_category_id],[project_id],[parent_id],[description],[has_child],[has_notes] ,[sort_order] ,[category_type_id]) VALUES (@budget_category_id,3050 ,@parent_id  ,'h.	Other' ,0,0 ,12 ,1)

exec getid_sel @table = 'a_BUDGET_CATEGORY', @id = @budget_category_id OUTPUT, @mode = 2
set @parent_id = @budget_category_id
INSERT INTO [dbo].[a_BUDGET_CATEGORY]([budget_category_id],[project_id],[parent_id],[description],[has_child],[has_notes] ,[sort_order] ,[category_type_id]) VALUES (@budget_category_id,3050 ,@total_id  ,'3. Third-Party Contracts' ,1,0 ,13 ,1)
exec getid_sel @table = 'a_BUDGET_CATEGORY', @id = @budget_category_id OUTPUT, @mode = 2
INSERT INTO [dbo].[a_BUDGET_CATEGORY]([budget_category_id],[project_id],[parent_id],[description],[has_child],[has_notes] ,[sort_order] ,[category_type_id]) VALUES (@budget_category_id,3050 ,@parent_id  ,'a.	Contract' ,0,0 ,14 ,1)
exec getid_sel @table = 'a_BUDGET_CATEGORY', @id = @budget_category_id OUTPUT, @mode = 2
INSERT INTO [dbo].[a_BUDGET_CATEGORY]([budget_category_id],[project_id],[parent_id],[description],[has_child],[has_notes] ,[sort_order] ,[category_type_id]) VALUES (@budget_category_id,3050 ,@parent_id  ,'b.	Subgrant' ,0,0 ,15 ,1)
GO
CREATE TABLE [dbo].[LSC_a_PBIF_BUDGET_FUNDING_TYPE](
	[id] [int] NOT NULL,
	[abbr] [varchar](50) NULL,
	[description] [varchar](200) NULL,
	[sort_order] [int] NULL,
	[end_date] [datetime] NULL,
 CONSTRAINT [PK_LSC_a_PBIF_BUDGET_FUNDING_TYPE] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
INSERT s_ID_GEN
	(table_name
	,next_id
	,is_code_table
	,lookup_table_type_id)
	SELECT 'LSC_a_PBIF_BUDGET_FUNDING_TYPE'
		,ISNULL(MAX(id) + 1,1)
		,0
		,1
		FROM LSC_a_PBIF_BUDGET_FUNDING_TYPE
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[LSC_PBIF_BUDGET](
	[lsc_pbif_budget_id] [int] NOT NULL,
	[wf_task_assignment_id] [int] NULL,
	[grantee_project_id] [int] NULL,
	[lsc_pbif_budget_type_id] [int] NULL,
 CONSTRAINT [PK_LSC_PBIF_BUDGET] PRIMARY KEY CLUSTERED 
(
	[lsc_pbif_budget_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
INSERT s_ID_GEN
	(table_name
	,next_id
	,is_code_table
	,lookup_table_type_id)
	SELECT 'LSC_PBIF_BUDGET'
		,ISNULL(MAX(lsc_pbif_budget_id) + 1,1)
		,0
		,1
		FROM LSC_PBIF_BUDGET
GO
CREATE TABLE [dbo].[LSC_PBIF_BUDGET_ITEM](
	[lsc_pbif_budget_item_id] [int] NOT NULL,
	[lsc_pbif_budget_id] [int] NULL,
	[lsc_pbif_budget_line_id] [int] NULL,
	[lsc_pbif_budget_funding_type_id] [int] NULL,
	[amount] [int] NULL,
	[comment] [varchar](max) NULL,
	[budget_category_id] [int] NULL,
 CONSTRAINT [PK_LSC_PBIF_BUDGET_ITEM] PRIMARY KEY CLUSTERED 
(
	[lsc_pbif_budget_item_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
INSERT s_ID_GEN
	(table_name
	,next_id
	,is_code_table
	,lookup_table_type_id)
	SELECT 'LSC_PBIF_BUDGET_ITEM'
		,ISNULL(MAX(lsc_pbif_budget_item_id) + 1,1)
		,0
		,1
		FROM LSC_PBIF_BUDGET_ITEM
GO



INSERT INTO [dbo].[LSC_a_PBIF_BUDGET_FUNDING_TYPE]
           ([id]
           ,[abbr]
           ,[description]
           ,[sort_order]
           ,[end_date])
     VALUES
           (1
           ,'A'
           ,'Pro Bono Innovation Fund Share'
           ,1
           ,NULL)
GO
INSERT INTO [dbo].[LSC_a_PBIF_BUDGET_FUNDING_TYPE]
           ([id]
           ,[abbr]
           ,[description]
           ,[sort_order]
           ,[end_date])
     VALUES
           (2
           ,'B'
           ,'Applicant Share'
           ,2
           ,NULL)
GO
INSERT INTO [dbo].[LSC_a_PBIF_BUDGET_FUNDING_TYPE]
           ([id]
           ,[abbr]
           ,[description]
           ,[sort_order]
           ,[end_date])
     VALUES
           (3
           ,'C'
           ,'Cash Support from Other Partners'
           ,3
           ,NULL)
GO
INSERT INTO [dbo].[LSC_a_PBIF_BUDGET_FUNDING_TYPE]
           ([id]
           ,[abbr]
           ,[description]
           ,[sort_order]
           ,[end_date])
     VALUES
           (4
           ,'D'
           ,'In-Kind Support from Other Partners'
           ,4
           ,NULL)
GO
CREATE VIEW [dbo].[vLSC_PBIF_BUDGET_BY_CATEGORY]

AS

SELECT CAST(tbi.lsc_PBIF_budget_id AS VARCHAR(6)) + '_' + CAST(tbi.budget_category_id AS VARCHAR(6)) lsc_PBIF_budget_by_category_id,
	tbi.lsc_PBIF_budget_id,
	tbi.budget_category_id,
	SUM(isnull(tbi.amount, 0)) category_total,
	SUM(isnull(case when tbi.lsc_PBIF_budget_funding_type_id = 1 then 0 else amount end, 0)) non_PBIF_total,
	bc.sort_order
	FROM LSC_PBIF_BUDGET_ITEM tbi
		JOIN a_BUDGET_CATEGORY bc ON tbi.budget_category_id = bc.budget_category_id
	WHERE tbi.budget_category_id IS NOT NULL
	GROUP BY tbi.lsc_PBIF_budget_id,
		tbi.budget_category_id,
		bc.sort_order

GO
CREATE VIEW [dbo].[vLSC_PBIF_BUDGET_BY_FUNDING_TYPE]

AS

SELECT CAST(lsc_PBIF_budget_id AS VARCHAR(6)) + '_' + CAST(lsc_PBIF_budget_funding_type_id AS VARCHAR(4)) lsc_PBIF_budget_by_funding_type_id,
	lsc_PBIF_budget_id,
	lsc_PBIF_budget_funding_type_id,
	SUM(isnull(amount, 0)) funding_type_total
	FROM LSC_PBIF_BUDGET_ITEM
	GROUP BY lsc_PBIF_budget_id,
		lsc_PBIF_budget_funding_type_id

GO
CREATE VIEW [dbo].[vLSC_PBIF_BUDGET_TOTAL]

AS

SELECT lsc_PBIF_budget_id,
	SUM(amount) budget_total
	FROM LSC_PBIF_BUDGET_ITEM
	GROUP BY lsc_PBIF_budget_id


GO
CREATE VIEW [dbo].[vLSC_PBIF_BUDGET_BY_FUNDING_TYPE_PCT]

AS

SELECT tbft.lsc_PBIF_budget_by_funding_type_id,
	tbft.funding_type_total,
	tbt.budget_total,
	CASE WHEN tbt.budget_total = 0 THEN NULL
		ELSE cast(tbft.funding_type_total as decimal) / cast(tbt.budget_total as decimal) END budget_pct
	FROM vLSC_PBIF_BUDGET_BY_FUNDING_TYPE tbft
		JOIN vLSC_PBIF_BUDGET_TOTAL tbt ON tbft.lsc_PBIF_budget_id = tbt.lsc_PBIF_budget_id
GO



CREATE VIEW vLSC_PBIF_BUDGET_CATEGORY_TOTAL_BY_FUNDING_TYPE as
select lsc_pbif_budget_id,a_BUDGET_CATEGORY.parent_id budget_category_id,LSC_PBIF_BUDGET_ITEM.lsc_pbif_budget_funding_type_id,SUM(LSC_PBIF_BUDGET_ITEM.amount) amount  from LSC_PBIF_BUDGET_ITEM
inner join a_BUDGET_CATEGORY on a_BUDGET_CATEGORY.budget_category_id = LSC_PBIF_BUDGET_ITEM.budget_category_id

group by lsc_pbif_budget_id,LSC_PBIF_BUDGET_ITEM.lsc_pbif_budget_funding_type_id,a_BUDGET_CATEGORY.parent_id
GO
CREATE VIEW vLSC_PBIF_BUDGET_CATEGORY_TOTAL as
select lsc_pbif_budget_id,Parent.budget_category_id budget_category_id,SUM(LSC_PBIF_BUDGET_ITEM.amount) amount  from LSC_PBIF_BUDGET_ITEM
inner join a_BUDGET_CATEGORY on a_BUDGET_CATEGORY.budget_category_id = LSC_PBIF_BUDGET_ITEM.budget_category_id
inner join a_BUDGET_CATEGORY Parent on a_BUDGET_CATEGORY.parent_id = Parent.budget_category_id
group by lsc_pbif_budget_id,Parent.budget_category_id