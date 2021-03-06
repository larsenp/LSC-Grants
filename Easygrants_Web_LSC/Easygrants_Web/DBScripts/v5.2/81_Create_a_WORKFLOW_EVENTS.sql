CREATE TABLE [dbo].[a_WORKFLOW_EVENTS](
	[id] [int] NOT NULL,
	[process_type_id] [int] NOT NULL,
	[eventmanager_event_id] [int] NOT NULL,
	[workflow_id] [int] NOT NULL,
	[workflow_event_type_id] [int] NOT NULL,
	[sort_order] [int] NOT NULL,
 CONSTRAINT [PK_a_WORKFLOW_EVENTS] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]



INSERT INTO [s_ID_GEN]([table_name], [next_id], [is_code_table], [description], [lookup_table_type_id]) 
	VALUES('a_WORKFLOW_EVENTS', 1, 0, NULL, 1);