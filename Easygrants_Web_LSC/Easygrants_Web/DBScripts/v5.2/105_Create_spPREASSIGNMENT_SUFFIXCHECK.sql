CREATE procedure [dbo].[spPREASSIGNMENT_SUFFIXCHECK]
	(
		@GranteeProjectID INT
	)
AS
set nocount on

	Declare @status_id int, @success bit, @status_message varchar(250)
	Declare @ReturnCode INT, @NewID int
	
	if exists(
		SELECT PERSON.suffix_id FROM  GRANTEE_PROJECT INNER JOIN PERSON ON GRANTEE_PROJECT.primary_person_id = PERSON.person_id
		WHERE (PERSON.suffix_id IS NOT NULL) and GRANTEE_PROJECT.grantee_project_id = @GranteeProjectID)
		
		BEGIN
			set @status_id = 1
			set @success = 1
			set @status_message = 'Suffix is present.'
		end
	else
		BEGIN
			set @status_id = 0
			set @success = 0
			set @status_message = 'Suffix is null'
		end
	

	exec @ReturnCode = getid_sel @table = 'NOTES', @id = @NewID OUTPUT, @mode = 2
	insert into NOTES (id, entity_id, entity_type_id, subject) values (@NewID, @GranteeProjectID, 3, @status_message)


	select @status_id As StatusID, @success as Success, @status_message As StatusMessage