/****** Object:  Table [dbo].[LSC_a_SERVICE_AREA]    Script Date: 06/03/2008 11:06:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LSC_a_SERVICE_AREA](
	[lsc_service_area_id] [int] NOT NULL,
	[competition_id] [int] NULL,
	[service_area_type_id] [int] NULL,
	[square_miles] [int] NULL,
	[total_popul] [int] NULL,
	[poor_popul] [int] NULL,
	[migr_poor_popul] [int] NULL,
	[black_poor] [int] NULL,
	[white_poor] [int] NULL,
	[hisp_poor] [int] NULL,
	[nat_amr_poor] [int] NULL,
	[asia_poor] [int] NULL,
	[other_poor] [int] NULL,
	[note] [varchar](max) NULL,
	[sort_string] [varchar](20) NULL,
	[adj_poor_popul] [int] NULL,
	[na_proportion] [decimal](15, 12) NULL,
	[counties] [varchar](max) NULL,
	[pi_poor] [int] NULL,
	[mixed_poor] [int] NULL,
	[white_alone_poor] [int] NULL,
 CONSTRAINT [PK_LSC_a_SERVICE_AREA] PRIMARY KEY CLUSTERED 
(
	[lsc_service_area_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF

INSERT LSC_a_SERVICE_AREA
	SELECT * FROM [LSC-EGDEV].Easygrants.dbo.LSC_a_SERVICE_AREA

DECLARE @next_id INT

SELECT @next_id = MAX(id) + 1
	FROM LSC_a_SERVICE_AREA

insert s_id_gen (table_name, next_id, is_code_table)
	values ('LSC_a_SERVICE_AREA', @next_id, 0)
