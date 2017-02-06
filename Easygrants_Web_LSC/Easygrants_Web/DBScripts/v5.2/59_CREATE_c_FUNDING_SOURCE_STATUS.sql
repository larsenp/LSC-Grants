CREATE TABLE [dbo].[c_FUNDING_SOURCE_STATUS](
	[id] [int] NOT NULL,
	[abbr] [varchar](50) NULL,
	[description] [varchar](300) NULL,
	[sort_order] [smallint] NULL,
	[end_date] [datetime] NULL,
 CONSTRAINT [PK_Funding_Source_Status] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF




INSERT INTO [c_FUNDING_SOURCE_STATUS]([id], [abbr], [description], [sort_order]) 
	VALUES(1, 'Proposed', 'Proposed', 1);

INSERT INTO [s_ID_GEN]([table_name], [next_id], [is_code_table], [description]) 
	VALUES('c_FUNDING_SOURCE_STATUS', 1, 1, NULL);




INSERT INTO [c_FUNDING_SOURCE_STATUS]([id], [abbr], [description], [sort_order], [end_date]) 
	VALUES(2, 'Final', 'Final', 1, NULL);



update s_id_gen set next_id = 3 where table_name='c_FUNDING_SOURCE_STATUS';
