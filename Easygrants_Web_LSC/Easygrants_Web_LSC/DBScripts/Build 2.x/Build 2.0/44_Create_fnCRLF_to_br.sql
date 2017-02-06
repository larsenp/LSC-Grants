SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fnCRLF_to_br]
(
	@InputString VARCHAR(max)
)
RETURNS VARCHAR(max)
AS
BEGIN

DECLARE @Result VARCHAR(MAX)

SET @Result = REPLACE(@InputString, char(13) + char(10), '<br>')

SET @Result = REPLACE(@Result, char(10) + char(13), '<br>')

SET @Result = REPLACE(@Result, char(10), '<br>')

SET @Result = REPLACE(@Result, char(13), '<br>')

RETURN @Result

END

