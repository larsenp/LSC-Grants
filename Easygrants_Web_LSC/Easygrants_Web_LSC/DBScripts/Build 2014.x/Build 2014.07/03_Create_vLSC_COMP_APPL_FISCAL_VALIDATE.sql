/****** Object:  View [dbo].[vLSC_COMP_APPL_FISCAL_VALIDATE]    Script Date: 06/04/2014 10:31:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vLSC_COMP_APPL_FISCAL_VALIDATE]

AS

SELECT lsc_comp_appl_fiscal_id
	,CASE WHEN (bod_finance_committee = 1 or bod_audit_committee = 1) and (bod_audit_finance is not null and bod_audit_finance <> 3) THEN 1 ELSE 0 END p1_q3_must_not_answer
	,CASE WHEN (bod_finance_committee <> 1 and bod_audit_committee <> 1) and (bod_audit_finance is null or bod_audit_finance = 3) THEN 1 ELSE 0 END p1_q3_must_answer
	FROM LSC_COMP_APPL_FISCAL
