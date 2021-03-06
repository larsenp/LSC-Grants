
CREATE VIEW [dbo].[vFUND_BALANCE]
AS
SELECT GRANTEE_PROJECT_FUNDING_SOURCES.fund_id AS FundID, a_FUND.fund_amount AS FundAmount, 
               SUM(GRANTEE_PROJECT_FUNDING_SOURCES.amount_allocated) AS TotalAwardedFundAmount, 
               a_FUND.fund_amount - SUM(GRANTEE_PROJECT_FUNDING_SOURCES.amount_allocated) AS FundBalanceAmount
FROM  GRANTEE_PROJECT_FUNDING_SOURCES INNER JOIN
               a_FUND ON GRANTEE_PROJECT_FUNDING_SOURCES.fund_id = a_FUND.fund_id
GROUP BY GRANTEE_PROJECT_FUNDING_SOURCES.fund_id, a_FUND.fund_amount