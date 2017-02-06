ALTER VIEW [dbo].[vTOTAL_PAYMENT]
AS

SELECT gpi.grantee_project_id, ISNULL(gpi.award_amount, 0) as award_amount, ISNULL(SUM(payment_amount), 0) AS payment_amount,
CASE WHEN SUM(dbo.PAYMENT.payment_amount) IS NULL THEN SUM(PAYMENT.payment_amount)
ELSE ('-' + CONVERT(varchar(100), SUM(dbo.PAYMENT.payment_amount))) END AS negative_format_payment_amount,
ISNULL(gpi.award_amount, 0) - ISNULL(SUM(dbo.PAYMENT.payment_amount), 0) as payments_remaining_balance
FROM dbo.PAYMENT right outer join grantee_project_info gpi on payment.grantee_project_id = gpi.grantee_project_id and PAYMENT.request_status_id = 4
GROUP BY gpi.grantee_project_id, gpi.award_amount