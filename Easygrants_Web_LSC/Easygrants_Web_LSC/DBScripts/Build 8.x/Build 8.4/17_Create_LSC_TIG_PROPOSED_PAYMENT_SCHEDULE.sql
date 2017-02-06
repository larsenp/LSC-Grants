/****** Object:  Table [dbo].[LSC_TIG_PROPOSED_PAYMENT_SCHEDULE]    Script Date: 04/14/2010 17:32:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LSC_TIG_PROPOSED_PAYMENT_SCHEDULE](
	[lsc_tig_proposed_payment_schedule_id] [int] NOT NULL,
	[wf_task_assignment_id] [int] NULL,
	[payment_number] [int] NULL,
	[payment_date] [datetime] NULL,
	[payment_amount] [int] NULL,
	[applicant_comment] [varchar](max) NULL,
 CONSTRAINT [PK_LSC_TIG_PROPOSED_PAYMENT_SCHEDULE] PRIMARY KEY CLUSTERED 
(
	[lsc_tig_proposed_payment_schedule_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF

INSERT INTO [s_ID_GEN]
           ([table_name]
           ,[next_id]
           ,[is_code_table])
     VALUES
           ('LSC_TIG_PROPOSED_PAYMENT_SCHEDULE'
           ,1
           ,0)
