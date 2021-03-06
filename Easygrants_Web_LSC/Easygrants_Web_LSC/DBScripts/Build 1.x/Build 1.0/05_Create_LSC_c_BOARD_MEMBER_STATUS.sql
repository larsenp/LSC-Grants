CREATE TABLE [dbo].[LSC_c_BOARD_MEMBER_STATUS](
	[id] [int] NOT NULL,
	[abbr] [varchar](50) NULL,
	[description] [varchar](200) NULL,
	[sort_order] [int] NULL,
	[end_date] [datetime] NULL,
 CONSTRAINT [PK_LSC_c_BOARD_MEMBER_STATUS] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF

INSERT INTO [LSC_c_BOARD_MEMBER_STATUS]([id], [abbr], [description], [sort_order], [end_date]) 
	VALUES(1, 'Current', 'Current', 1, NULL);

INSERT INTO [LSC_c_BOARD_MEMBER_STATUS]([id], [abbr], [description], [sort_order], [end_date]) 
	VALUES(2, 'Proposed', 'Proposed', 2, NULL);


insert into [s_ID_GEN] values ('LSC_c_BOARD_MEMBER_STATUS', 3, 1, null)