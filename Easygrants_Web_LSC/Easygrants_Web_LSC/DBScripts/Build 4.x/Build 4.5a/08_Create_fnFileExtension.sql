CREATE FUNCTION dbo.fnFileExtension
	(@filename varchar(max))
RETURNS varchar(max)

AS
BEGIN
	RETURN substring(@filename, 
			datalength(@filename) - charindex('.', reverse(@filename)) + 1, 
			charindex('.', reverse(@filename)))
END
