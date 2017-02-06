CREATE TABLE [dbo].[LSC_GRANTEE_PROJECT_INFO](
	[id] [int] NOT NULL,
	[grantee_project_id] [int] NOT NULL,
	[allocated_by_subgrants] [bit] NOT NULL CONSTRAINT [DF_LSC_GRANTEE_PROJECT_INFO_allocated_by_subgrants]  DEFAULT ((0)),
	[number_of_subgrants] [int] NULL,
	[applicant_category_id] [int] NULL,
	[create_user] [int] NULL,
	[create_date] [datetime] NULL,
	[modify_user] [int] NULL,
	[modify_date] [datetime] NULL,
 CONSTRAINT [PK_LSC_GRANTEE_PROJECT_INFO] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

insert into [s_ID_GEN] values ('LSC_GRANTEE_PROJECT_INFO', 1, 0, null)