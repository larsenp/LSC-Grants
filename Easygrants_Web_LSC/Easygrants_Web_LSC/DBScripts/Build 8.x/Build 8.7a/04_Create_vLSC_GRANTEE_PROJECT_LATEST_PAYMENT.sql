/****** Object:  UserDefinedFunction [dbo].[fnGranteeProjectLatestRenewalApp]    Script Date: 06/29/2010 09:17:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fnGranteeProjectLatestPayment]
(
	@GranteeProjectID INT
)
RETURNS INT
AS
BEGIN

	DECLARE @payment_id INT

	SELECT TOP 1 @payment_id = payment_id
		FROM PAYMENT
		WHERE grantee_project_id = @GranteeProjectID
			AND request_status_id = 4
		ORDER BY payment_date DESC,
			payment_number DESC

	RETURN @payment_id

END

GO

CREATE VIEW vLSC_GRANTEE_PROJECT_LATEST_PAYMENT

AS

SELECT grantee_project_id, 
	legacy_grant_id, 
	[dbo].[fnGranteeProjectLatestPayment](grantee_project_id) latest_payment_id
	FROM GRANTEE_PROJECT

