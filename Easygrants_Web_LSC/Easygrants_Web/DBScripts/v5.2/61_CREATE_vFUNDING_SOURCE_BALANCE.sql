
CREATE VIEW [dbo].[vFUNDING_SOURCE_BALANCE]
AS
SELECT 
GPFS.fund_id AS FundID , GPFS.grantee_project_id,
GPFS.amount_allocated as AmountAllocated, 
PBF.TotAmount , (GPFS.amount_allocated - PBF.TotAmount) AS GrantFSBalance
FROM  GRANTEE_PROJECT_FUNDING_SOURCES  GPFS
INNER JOIN vPayment_Balance_Fund PBF on PBF.request_account_fund_id = GPFS.Fund_id and GPFS.grantee_project_id  = PBF.grantee_project_id
