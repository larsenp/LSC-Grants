/****** Object:  UserDefinedFunction [dbo].[fnLSCParseFullName]    Script Date: 03/21/2012 09:18:47 ******/

/************************************************************************/
/*This function is used to parse names into prefix, first, middle, last,*/
/*and suffix. It assumes that names are formatted in that order (i.e.,  */
/*it does not handle "last, first" name formatting)                     */
/************************************************************************/

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fnLSCParseFullName] (@full_name varchar(max))
	RETURNS @temp_table table (prefix_id int,
		name_first varchar(100),
		name_middle varchar(50),
		name_last varchar(100),
		suffix_id int) 
	
AS
BEGIN
	declare @org_id int,
		@prefix_id int,
		@first varchar(30),
		@middle varchar(30),
		@last varchar(30),
		@suffix_id int,
		@word varchar(30),
		@working varchar(30),
		@index int

	SET @working = RTRIM(LTRIM(@full_name))

	SET @working = REPLACE(@working, ',', '')

	--Strip extra spaces
	WHILE CHARINDEX('  ', @working) > 0
		SET @working = REPLACE(@working, '  ', ' ')

	SET @index = charindex(' ', @working)

	IF @index = 0 RETURN

	--Check for a prefix
	SET @word = SUBSTRING(@working, 1, @index - 1)

	SELECT @prefix_id = prefix_id
		FROM c_PREFIX
		WHERE abbr = @word OR abbr = @word + '.'

	IF @prefix_id IS NOT NULL
	BEGIN
		--Remove prefix from working string
		SET @working = SUBSTRING(@working, LEN(@word) + 1, LEN(@working) - LEN(@word))
	END

	--Reverse working string and check for suffixes
	SET @working = REVERSE(@working)
	SET @index = charindex(' ', @working)

	IF @index = 0
		RETURN

	SET @word = REVERSE(SUBSTRING(@working, 1, CHARINDEX(' ', @working) - 1))

	SELECT @suffix_id = suffix_id
		FROM c_SUFFIX
		WHERE abbr = @word OR abbr = @word + '.'

	IF @suffix_id IS NOT NULL
	BEGIN
		--Remove suffix from working string
		SET @working = SUBSTRING(@working, LEN(@word) + 2, LEN(@working) - LEN(@word) - 1)
	END

	--The last name is now the first word of the reversed working string
	SET @index = charindex(' ', @working)

	IF @index = 0
		RETURN

	SET @word = SUBSTRING(@working, 1, CHARINDEX(' ', @working) - 1)

	SET @last = REVERSE(@word)

	--Remove last name from working string
	SET @working = SUBSTRING(@working, LEN(@word) + 2, LEN(@working) - LEN(@word) - 1)

	--Un-reverse working string back to correct order
	SET @working = REVERSE(@working)

	SET @index = charindex(' ', @working)

	IF @index = 0
		SET @first = @working
	ELSE --String contains first and middle names
	BEGIN
		SET @word = SUBSTRING(@working, 1, CHARINDEX(' ', @working) - 1)
		SET @first = @word
		SET @working = SUBSTRING(@working, LEN(@word) + 2, LEN(@working) - LEN(@word) - 1)
		SET @middle = @working
	END

	INSERT @temp_table
		(prefix_id ,
		name_first ,
		name_middle ,
		name_last,
		suffix_id)
		VALUES(@prefix_id ,
			@first ,
			@middle ,
			@last,
			@suffix_id)

	RETURN

END