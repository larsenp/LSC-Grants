/****** Object:  View [dbo].[vLSC_TIG_BUDGET]    Script Date: 04/12/2010 10:24:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vLSC_TIG_BUDGET_TOTAL]

AS

SELECT lsc_tig_budget_id,
	SUM(amount) budget_total
	FROM LSC_TIG_BUDGET_ITEM
	GROUP BY lsc_tig_budget_id

GO

DROP VIEW dbo.vLSC_TIG_BUDGET
