ALTER TABLE LSC_COMP_APPL_FISCAL
	ADD finance_review_financial_stmts_body VARCHAR(50)
		,frp_most_recent_lsc_trng_other VARCHAR(50)
		,lsc_funder_most_recent_site_visit_id INT
		,funder_most_recent_site_visit_specify VARCHAR(50)

UPDATE LSC_c_FISCAL_ROLE
	SET description = 'Comptroller/Controller'
	WHERE description = 'Comptroller'

UPDATE LSC_c_FISCAL_ROLE
	SET end_date = '2014-1-1'
	WHERE description = 'Finance Administrator'

DECLARE @new_id INT

EXEC @new_id = getid_sel @table = 'LSC_c_FISCAL_ROLE'

INSERT LSC_c_FISCAL_ROLE
	(id
	,abbr
	,description
	,sort_order)
	VALUES
		(@new_id
		,'Financial Consultant'
		,'Financial Consultant'
		,4)

UPDATE LSC_c_FISCAL_QUALIFICATION
	SET description = 'Bachelor''s Degree in Accounting or Finance'
	WHERE abbr = 'Bachelor''s in Accounting'

UPDATE LSC_c_FISCAL_QUALIFICATION
	SET end_date = '2014-1-1'
	WHERE abbr = 'Bachelor''s in Finance'

UPDATE LSC_c_FISCAL_QUALIFICATION
	SET end_date = '2014-1-1'
	WHERE abbr = 'Other'

EXEC @new_id = getid_sel @table = 'LSC_c_FISCAL_QUALIFICATION'

INSERT LSC_c_FISCAL_QUALIFICATION
	(id
	,abbr
	,description
	,sort_order)
	VALUES
		(@new_id
		,'Associate''s in Accounting'
		,'Associate''s Degree in Accounting or Finance'
		,5)

UPDATE LSC_c_ACCTG_EXPERIENCE
	SET end_date = '2014-1-1'
	WHERE id = 3

EXEC @new_id = getid_sel @table = 'LSC_c_ACCTG_EXPERIENCE'

INSERT LSC_c_ACCTG_EXPERIENCE
	(id
	,abbr
	,description
	,sort_order)
	VALUES
		(@new_id
		,'1-5'
		,'Between 1-5 years'
		,3)

EXEC @new_id = getid_sel @table = 'LSC_c_ACCTG_EXPERIENCE'

INSERT LSC_c_ACCTG_EXPERIENCE
	(id
	,abbr
	,description
	,sort_order)
	VALUES
		(@new_id
		,'<1'
		,'Less than 1 year'
		,3)

EXEC @new_id = getid_sel @table = 'LSC_c_FINANCIAL_TRNG_INTERVAL'

INSERT LSC_c_FINANCIAL_TRNG_INTERVAL
	(id
	,abbr
	,description
	,sort_order)
	VALUES
		(@new_id
		,'Year'
		,'Year'
		,1)

UPDATE LSC_c_FINANCIAL_TRNG_INTERVAL
	SET abbr = '2 Years'
		,description = '2 Years'
		,sort_order = 2
	WHERE id = 1

UPDATE LSC_c_FINANCIAL_TRNG_INTERVAL
	SET end_date = '2014-1-1'
	WHERE id in (2,3)

EXEC @new_id = getid_sel @table = 'LSC_c_FINANCIAL_TRNG_INTERVAL'

INSERT LSC_c_FINANCIAL_TRNG_INTERVAL
	(id
	,abbr
	,description
	,sort_order)
	VALUES
		(@new_id
		,'Other'
		,'Other'
		,3)

CREATE TABLE [dbo].LSC_c_FUNDER_MOST_RECENT_SITE_VISIT(
	[id] [int] NOT NULL,
	[abbr] [varchar](20) NULL,
	[description] [varchar](100) NULL,
	[sort_order] [int] NULL,
	[end_date] [datetime] NULL,
 CONSTRAINT [PK_LSC_c_FUNDER_MOST_RECENT_SITE_VISIT] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

INSERT LSC_c_FUNDER_MOST_RECENT_SITE_VISIT
	(id
	,abbr
	,description
	,sort_order)
	VALUES
		(1
		,'<1'
		,'Less than 1 year ago'
		,1)

INSERT LSC_c_FUNDER_MOST_RECENT_SITE_VISIT
	(id
	,abbr
	,description
	,sort_order)
	VALUES
		(2
		,'1-3'
		,'Between 1-3 years ago'
		,2)

INSERT LSC_c_FUNDER_MOST_RECENT_SITE_VISIT
	(id
	,abbr
	,description
	,sort_order)
	VALUES
		(3
		,'3-5'
		,'Between 3-5 years ago'
		,3)

INSERT LSC_c_FUNDER_MOST_RECENT_SITE_VISIT
	(id
	,abbr
	,description
	,sort_order)
	VALUES
		(4
		,'5+'
		,'More than 5 years ago'
		,4)

INSERT INTO s_ID_GEN (table_name,
	next_id, 
	is_code_table
	,lookup_table_type_id) 
	VALUES ('LSC_c_FUNDER_MOST_RECENT_SITE_VISIT',5,1,1)

--DECLARE @new_id INT

INSERT s_id_gen 
	(table_name
	,next_id
	,is_code_table
	,lookup_table_type_id)
	VALUES
		('LSC_c_FISCAL_SW_MODULE'
		,7
		,1
		,1)

UPDATE LSC_c_FISCAL_SW_MODULE
	SET sort_order = sort_order + 1

UPDATE LSC_c_FISCAL_SW_MODULE
	SET end_date = '2014-1-1'
	WHERE id = 6

EXEC @new_id = getid_sel @table = 'LSC_c_FISCAL_SW_MODULE'

INSERT LSC_c_FISCAL_SW_MODULE
	(id
	,abbr
	,description
	,sort_order)
	VALUES
		(@new_id
		,'General Ledger'
		,'General Ledger'
		,1)

UPDATE LSC_c_FISCAL_SW_NUM_USERS
	SET abbr = 'Fewer than 5'
		,description = 'Fewer than 5'
	WHERE id = 1
