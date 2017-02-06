/****** Object:  View [dbo].[vLSC_PAYMENT_TOTAL]    Script Date: 09/08/2010 14:25:56 ******/
--Add GRANTEE_PROJECT to view, guaranteeing return of row where GRANTEE_PROJECT_INFO row has not yet been created.
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER VIEW [dbo].[vLSC_PAYMENT_TOTAL]

AS

WITH p(grantee_project_id,
		request,
		payment,
		negative_payment)
	AS (SELECT grantee_project_id,
			ISNULL(requested_amount, 0) request,
			CASE WHEN request_status_id = 4 then ISNULL(payment_amount, 0) ELSE 0 END payment,
			CASE WHEN request_status_id = 4 then -1*ISNULL(payment_amount, 0) ELSE 0 END negative_payment
			FROM PAYMENT)

SELECT gp.grantee_project_id, 
	ISNULL(gpi.award_amount, 0) AS award_amount, 
	SUM(p.request) request_total,
	SUM(p.payment) payment_total, 
    SUM(p.negative_payment) negative_format_payment_total, 
	ISNULL(gpi.award_amount, 0) - SUM(p.payment) AS payments_remaining_balance
FROM GRANTEE_PROJECT gp
	LEFT JOIN GRANTEE_PROJECT_INFO gpi on gp.grantee_project_id = gpi.grantee_project_id 
	LEFT JOIN p on gp.grantee_project_id = p.grantee_project_id 
GROUP BY gp.grantee_project_id, gpi.award_amount
