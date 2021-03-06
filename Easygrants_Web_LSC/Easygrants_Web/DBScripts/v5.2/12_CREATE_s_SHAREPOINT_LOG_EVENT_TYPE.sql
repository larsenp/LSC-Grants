
CREATE TABLE [dbo].[s_SHAREPOINT_LOG_EVENT_TYPE](
	[event_type_id] [int] NOT NULL,
	[event_type_description] [varchar](500) NULL,
 CONSTRAINT [PK_s_SHAREPOINT_LOG_EVENT_TYPE] PRIMARY KEY CLUSTERED 
(
	[event_type_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF



INSERT INTO [s_SHAREPOINT_LOG_EVENT_TYPE]([event_type_id], [event_type_description]) 
	VALUES(1, 'Program: Folder Name update');

INSERT INTO [s_SHAREPOINT_LOG_EVENT_TYPE]([event_type_id], [event_type_description]) 
	VALUES(2, 'Funding Opportunity: Folder Name Update');

INSERT INTO [s_SHAREPOINT_LOG_EVENT_TYPE]([event_type_id], [event_type_description]) 
	VALUES(3, 'Funding Cycle: Folder Name Update');

INSERT INTO [s_SHAREPOINT_LOG_EVENT_TYPE]([event_type_id], [event_type_description]) 
	VALUES(4, 'Person: Folder Name Update');

INSERT INTO [s_SHAREPOINT_LOG_EVENT_TYPE]([event_type_id], [event_type_description]) 
	VALUES(5, 'Organization: Folder Name Update');




INSERT INTO [s_ID_GEN]([table_name], [next_id], [is_code_table], [description]) 
	VALUES('s_SHAREPOINT_LOG_EVENT_TYPE', 6, 0, NULL);




