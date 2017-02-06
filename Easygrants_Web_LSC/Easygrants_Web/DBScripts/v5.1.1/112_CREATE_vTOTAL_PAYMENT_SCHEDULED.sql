
CREATE VIEW [dbo].[vTOTAL_PAYMENT_SCHEDULED]
AS
SELECT     gpi.grantee_project_id, ISNULL(gpi.award_amount, 0) as award_amount, SUM(requested_amount) AS requested_amount,
CASE WHEN SUM(dbo.PAYMENT.requested_amount) IS NULL THEN SUM(PAYMENT.requested_amount) 
                      ELSE ('-' + CONVERT(varchar(100), SUM(dbo.PAYMENT.requested_amount))) END AS negative_format_requested_amount,
ISNULL(gpi.award_amount, 0) - ISNULL(SUM(dbo.PAYMENT.requested_amount), 0) as requested_amount_remaining_balance
FROM dbo.PAYMENT right outer join grantee_project_info gpi   on payment.grantee_project_id = gpi.grantee_project_id 
GROUP BY gpi.grantee_project_id, gpi.award_amount