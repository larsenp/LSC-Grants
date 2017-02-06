SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[vLSC_INTERIM_REVENUE]

AS
SELECT [wfta_year]
      ,[recipient_id]
      ,o.organization_name recipient_name
      ,[serv_area]
      ,[serv_area_type]
      ,[10] [LSC_Basic_Fld]
      ,[28] [Intr_or_Invest]
      ,[22] [Fee_Awd_LSC_Cs]
      ,[23] [Publ_LSC]
      ,[24] [Cr_Ovr_Fnd_LSC]
      ,[20] [Ot_Fnd_LSC_Amt]
	  ,ISNULL([10], 0) + ISNULL([28], 0) + ISNULL([22], 0) + ISNULL([23], 0) + ISNULL([24], 0) + ISNULL([20], 0) AS [lsc_funding]
      ,[30] [Title_XX_SSI]
      ,[32] [Older_Amr_Care]
      ,[33] [Violence_Women]
      ,[34] [Other_Federal]
      ,[36] [Block_Grants]
      ,[40] [State_Grants]
      ,[41] [Filing_Fees]
      ,[42] [Local_Grants]
      ,[44] [United_Way]
      ,[46] [Fndtion_Grants]
      ,[48] [Bar_Grants]
      ,[50] [IOLTA]
      ,[52] [Fee_Awards]
      ,[54] [Cry_Ovr_Funds]
      ,[55] [Publication]
      ,[99] [Ot_Funds_Amt]
      ,ISNULL([30], 0) + ISNULL([32], 0) + ISNULL([33], 0) + ISNULL([34], 0) + ISNULL([36], 0) + 
			ISNULL([40], 0) + ISNULL([41], 0) + ISNULL([42], 0) + ISNULL([44], 0) + ISNULL([46], 0) + 
			ISNULL([48], 0) + ISNULL([50], 0) + ISNULL([52], 0) + ISNULL([54], 0) + ISNULL([55], 0) + ISNULL([99], 0) AS [non_lsc_funding]
      ,[57] [Client_Fees]
      ,[58] [For_Profit_Inc]
      ,ISNULL([57], 0) + ISNULL([58], 0) AS [client_serv]
      ,ISNULL([10], 0) + ISNULL([28], 0) + ISNULL([22], 0) + ISNULL([23], 0) + ISNULL([24], 0) + 
			ISNULL([20], 0) + ISNULL([30], 0) + ISNULL([32], 0) + ISNULL([33], 0) + ISNULL([34], 0) + 
			ISNULL([36], 0) + ISNULL([40], 0) + ISNULL([41], 0) + ISNULL([42], 0) + ISNULL([44], 0) + 
			ISNULL([46], 0) + ISNULL([48], 0) + ISNULL([50], 0) + ISNULL([52], 0) + ISNULL([54], 0) + 
			ISNULL([55], 0) + ISNULL([99], 0) + ISNULL([57], 0) + ISNULL([58], 0) AS [total]
  FROM vLSC_INTERIM_REVENUE_PIVOT lirp
	JOIN ORGANIZATION o ON lirp.recipient_id = o.legacy_organization_id
