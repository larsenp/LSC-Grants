--Modify stored procedure for 2012 cycle only to pull previous year data indexed by wf_task_assignment_id
--and bring it forward into new data model indexed by organization and year (Mantis 1835)

--Add functionality to remove invalid ethnicity codes (Mantis 2539)

/****** Object:  StoredProcedure [dbo].[spLSC_COPY_BOARD_MEMBER_INFO]    Script Date: 03/31/2011 09:06:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[spLSC_COPY_BOARD_MEMBER_INFO]
	(@wf_task_assignment_id INT)

AS

DECLARE @grantee_project_id INT,
	@prev_wfta_id INT,
	@organization_id INT,
	@time_period_id INT

SET @prev_wfta_id = [dbo].[fnLSCPrevYearAppWfTAID] (@wf_task_assignment_id)

IF @prev_wfta_id IS NULL
	RETURN

SELECT @organization_id = organization_id,
	@time_period_id = time_period_id
	FROM vLSC_COMP_WFTA_ORG_SERVAREA_YEAR
	WHERE wf_task_assignment_id = @wf_task_assignment_id

CREATE TABLE #board
	(ident int identity(0,1),
	id int NULL,
	organization_id INT NULL,
	time_period_id INT NULL,
	affiliation_type_id int NULL,
	role_id int NULL,
	name_prefix_id int NULL,
	name_first varchar(100) NULL,
	name_last varchar(100) NULL,
	name_middle varchar(50) NULL,
	name_suffix_id int NULL,
	email_address varchar(100) NULL,
	title varchar(100) NULL,
	relevant_experience varchar(max) NULL,
	status_id int NULL,
	appointing_organization varchar(50) NULL,
	gender_id int NULL,
	ethnicity_id int NULL,
	address varchar(100) NULL,
	city varchar(50) NULL,
	state_province_id int NULL,
	zip_postal_code varchar(30) NULL,
	phone varchar(50) NULL,
	address_phone_type_id int NULL,
	board_member_type_id int NULL,
	create_user int NULL,
	create_date datetime NULL,
	modify_user int NULL,
	modify_date datetime NULL)

INSERT #board
	(organization_id,
	time_period_id,
	affiliation_type_id ,
	role_id ,
	name_prefix_id ,
	name_first ,
	name_last ,
	name_middle ,
	name_suffix_id ,
	email_address ,
	title ,
	relevant_experience ,
	status_id ,
	appointing_organization ,
	gender_id ,
	ethnicity_id ,
	address ,
	city ,
	state_province_id ,
	zip_postal_code ,
	phone ,
	address_phone_type_id ,
	board_member_type_id ,
	create_user ,
	create_date ,
	modify_user ,
	modify_date)
	SELECT 	@organization_id,
		@time_period_id,
		affiliation_type_id ,
		role_id ,
		name_prefix_id ,
		name_first ,
		name_last ,
		name_middle ,
		name_suffix_id ,
		email_address ,
		title ,
		relevant_experience ,
		status_id ,
		appointing_organization ,
		gender_id ,
		ethnicity_id ,
		address ,
		city ,
		state_province_id ,
		zip_postal_code ,
		phone ,
		address_phone_type_id ,
		board_member_type_id ,
		create_user ,
		create_date ,
		modify_user ,
		modify_date
		FROM LSC_WF_TASK_ASSIGNMENT_AFFILIATIONS
		WHERE wf_task_assignment_id = @prev_wfta_id
			AND affiliation_type_id = 3

--Remove invalid ethnicity codes
UPDATE #board
	SET ethnicity_id = NULL
	FROM #board b
		JOIN c_ETHNICITY e ON b.ethnicity_id = e.id
	WHERE e.end_date is not null

--Get IDs from the ID generation table and set in temp table. This will allow insertion into the actual data table.			
DECLARE @rowcount int, @first_new_id int

SELECT @rowcount = count(*) FROM #board

EXEC @first_new_id = spGETID_RANGE_SEL @table = 'LSC_WF_TASK_ASSIGNMENT_AFFILIATIONS', @count = @rowcount, @mode = 2

UPDATE #board
	SET id = ident + @first_new_id

--Insert rows into database
INSERT LSC_WF_TASK_ASSIGNMENT_AFFILIATIONS
	(id,
	organization_id ,
	time_period_id ,
	affiliation_type_id ,
	role_id ,
	name_prefix_id ,
	name_first ,
	name_last ,
	name_middle ,
	name_suffix_id ,
	email_address ,
	title ,
	relevant_experience ,
	status_id ,
	appointing_organization ,
	gender_id ,
	ethnicity_id ,
	address ,
	city ,
	state_province_id ,
	zip_postal_code ,
	phone ,
	address_phone_type_id ,
	board_member_type_id ,
	create_user ,
	create_date ,
	modify_user ,
	modify_date)
	SELECT id,
		organization_id ,
		time_period_id ,
		affiliation_type_id ,
		role_id ,
		name_prefix_id ,
		name_first ,
		name_last ,
		name_middle ,
		name_suffix_id ,
		email_address ,
		title ,
		relevant_experience ,
		status_id ,
		appointing_organization ,
		gender_id ,
		ethnicity_id ,
		address ,
		city ,
		state_province_id ,
		zip_postal_code ,
		phone ,
		address_phone_type_id ,
		board_member_type_id ,
		create_user ,
		create_date ,
		modify_user ,
		modify_date
		FROM #board

EXEC spLSC_COPY_BOARD_CHAIR_INFO
	@organization_id = @organization_id,
	@time_period_id =  @time_period_id,
	@prev_wfta_id = @prev_wfta_id
