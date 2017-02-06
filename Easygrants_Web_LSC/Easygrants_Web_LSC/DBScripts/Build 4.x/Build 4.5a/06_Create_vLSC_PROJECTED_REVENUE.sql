/****** Object:  View [dbo].[vLSC_PROJECTED_REVENUE]    Script Date: 03/24/2009 10:55:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vLSC_PROJECTED_REVENUE]

AS

SELECT [wfta_year]
      ,[recipient_id]
      ,o.organization_name recipient_name
      ,[serv_area]
      ,[10] [LSC_Basic_Fld]
      ,[28] [Intr_or_Invest]
      ,[22] [Fee_Awd_LSC_Cs]
      ,[23] [Publ_LSC]
      ,[24] [Cr_Ovr_Fnd_LSC]
      ,[20] [Ot_Fnd_LSC_Amt]
	  ,[10] + [28] + [22] + [23] + [24] + [20] AS [lsc_funding]
      ,[30] [Title_XX_SSI]
      ,[32] [Older_Amr_Care]
      ,[33] [Violence_Women]
      ,[34] [Other_Federal]
      ,[36] [Block_Grants]
      ,[40] [State_Grants]
      ,[42] [Local_Grants]
      ,[44] [United_Way]
      ,[46] [Fndtion_Grants]
      ,[48] [Bar_Grants]
      ,[50] [IOLTA]
      ,[52] [Fee_Awards]
      ,[54] [Cry_Ovr_Funds]
      ,[55] [Publication]
      ,[99] [Ot_Funds_Amt]
      ,[30] + [32] + [33] + [34] + [36] + [40] + [42] + [44] + [46] + [48] + [50] + [52] + [54] + [55] + [99] AS [non_lsc_funding]
      ,[57] [Client_Fees]
      ,[58] [For_Profit_Inc]
      ,[57] + [58] AS [client_serv]
      ,[10] + [28] + [22] + [23] + [24] + [20] + [30] + [32] + [33] + [34] + [36] + [40] + [42] + [44] + [46] + [48] + [50] + [52] + [54] + [55] + [99] + [57] + [58] AS [total]
  FROM vLSC_PROJECTED_REVENUE_PIVOT lprp
	JOIN ORGANIZATION o ON lprp.recipient_id = o.legacy_organization_id
