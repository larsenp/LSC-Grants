CREATE TABLE [dbo].[LSC_c_APPLICANT_CATEGORY](
	[id] [int] NOT NULL,
	[abbr] [varchar](50) NULL,
	[description] [varchar](200) NULL,
	[sort_order] [int] NULL,
	[end_date] [datetime] NULL,
 CONSTRAINT [PK_LSC_c_APPLICANT_CATEGORY] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO



INSERT INTO [LSC_c_APPLICANT_CATEGORY]([id], [abbr], [description], [sort_order], [end_date]) 
	VALUES(1, 'NPO', 'Non-Profit Organization', 1, NULL);

INSERT INTO [LSC_c_APPLICANT_CATEGORY]([id], [abbr], [description], [sort_order], [end_date]) 
	VALUES(2, 'LG', 'Local Government', 2, NULL);

INSERT INTO [LSC_c_APPLICANT_CATEGORY]([id], [abbr], [description], [sort_order], [end_date]) 
	VALUES(3, 'SG', 'State Government', 3, NULL);

INSERT INTO [LSC_c_APPLICANT_CATEGORY]([id], [abbr], [description], [sort_order], [end_date]) 
	VALUES(4, 'PA', 'Private Attorney(s), Groups of Attorneys or Law Firms', 4, NULL);

INSERT INTO [LSC_c_APPLICANT_CATEGORY]([id], [abbr], [description], [sort_order], [end_date]) 
	VALUES(5, 'SRPCA', 'Substate Regional Planning and Coordination Agency', 5, NULL);


insert into [s_ID_GEN] values ('LSC_c_APPLICANT_CATEGORY', 6, 1, null)