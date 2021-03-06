CREATE TABLE [dbo].[a_MAP_SETTINGS](
	[id] [int] NOT NULL,
	[map_key] [varchar](200) NOT NULL,
	[easygrants_site_name] [varchar](200) NOT NULL,
	[easygrants_site_url] [varchar](200) NOT NULL,
	[map_site_url] [varchar](200) NULL CONSTRAINT [DF_a_MAP_SETTINGS_map_site_url]  DEFAULT ('http://maps.google.com/maps/geo'),
	[map_width] [int] NULL CONSTRAINT [DF_a_MAP_SETTINGS_map_size]  DEFAULT ((300)),
	[map_height] [int] NULL CONSTRAINT [DF_a_MAP_SETTINGS_map_height]  DEFAULT ((300)),
	[map_zoom] [int] NULL CONSTRAINT [DF_a_MAP_SETTINGS_map_zoom]  DEFAULT ((10)),
	[marker_color] [varchar](50) NULL CONSTRAINT [DF_a_MAP_SETTINGS_marker_color]  DEFAULT ('red'),
 CONSTRAINT [PK_a_MAP_SETTINGS] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF

INSERT INTO [s_ID_GEN]([table_name], [next_id], [is_code_table], [description]) 
	VALUES('a_MAP_SETTINGS', 1, 0, NULL);