SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LSC_c_STRATEGY_TYPE](
	[id] [int] NOT NULL,
	[description] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 CONSTRAINT [PK_LSC_c_GOAL_TYPE] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF


INSERT INTO LSC_c_STRATEGY_TYPE
           (id
           ,description)
     VALUES
           (1
           ,'Cases')

INSERT INTO LSC_c_STRATEGY_TYPE
           (id
           ,description)
     VALUES
           (2
           ,'Other Services')


Insert s_id_gen
	(table_name,
	next_id,
	is_code_table,
	lookup_table_type_id)
	values('LSC_c_STRATEGY_TYPE',
		3,
		1,
		2)