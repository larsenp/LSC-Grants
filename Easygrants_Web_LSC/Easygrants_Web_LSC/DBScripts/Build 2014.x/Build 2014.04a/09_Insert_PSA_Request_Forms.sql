EXEC spUPDATE_IDGEN @select = false

CREATE TABLE #forms(
    ident int identity(0,1),
    [id] [int] NULL,
    [form_type_id] [int] ,
    [name] [varchar](100) NULL,
    [description] [varchar](200) NULL,
    [page_key] [varchar](100) NULL,
    [page_title] [varchar](300) NULL,
    [control_path] [varchar](300) NULL,
    [after_submit_control_path] [varchar](300) NULL,
    [is_client] [bit] NOT NULL DEFAULT ((1)),
    [is_active] [bit] NOT NULL DEFAULT ((1)))


INSERT #forms
           ([form_type_id]
           ,[name]
           ,[description]
           ,[page_key]
           ,[page_title]
           ,[control_path]
           ,[after_submit_control_path])
     VALUES
           (1
           ,'LSC - Subgrants Step 1 - Subrecipient Profile'
           ,'Subrecipient Profile'
           ,'SubrecipientProfile'
           ,'SubrecipientProfile'
           ,'Implementation/Modules/RequestPSA/Forms/SubrecipientProfile.ascx'
           ,'Implementation/Modules/RequestSubgrantApproval/Forms/PostSubmission.ascx')

INSERT #forms
           ([form_type_id]
           ,[name]
           ,[description]
           ,[page_key]
           ,[page_title]
           ,[control_path]
           ,[after_submit_control_path])
     VALUES
           (1
           ,'LSC - Subgrants Step 1 - Subgrant Summary'
           ,'Subgrant Summary'
           ,'SubgrantSummary'
           ,'Subgrant Summary'
           ,'Implementation/Modules/RequestPSA/Forms/SubgrantSummary.ascx'
           ,'Implementation/Modules/RequestSubgrantApproval/Forms/PostSubmission.ascx')

INSERT #forms
           ([form_type_id]
           ,[name]
           ,[description]
           ,[page_key]
           ,[page_title]
           ,[control_path]
           ,[after_submit_control_path])
     VALUES
           (1
           ,'LSC - Subgrants Step 1 - Subrecipient Budget'
           ,'Subrecipient Budget'
           ,'SubrecipientBudget'
           ,'Subrecipient Budget'
           ,'Implementation/Modules/RequestPSA/Forms/SubrecipientBudget.ascx'
           ,'Implementation/Modules/RequestSubgrantApproval/Forms/PostSubmission.ascx')

INSERT #forms
           ([form_type_id]
           ,[name]
           ,[description]
           ,[page_key]
           ,[page_title]
           ,[control_path]
           ,[after_submit_control_path])
     VALUES
           (1
           ,'LSC - Subgrants Step 1 - Uploads'
           ,'Uploads'
           ,'Uploads'
           ,'Uploads'
           ,'Implementation/Modules/RequestPSA/Forms/Uploads.ascx'
           ,'Implementation/Modules/RequestSubgrantApproval/Forms/PostSubmission.ascx')




DECLARE @rowcount int, @first_id int

SELECT @rowcount = COUNT(*)
	FROM #forms

EXEC @first_id = spGETID_RANGE_SEL @table = 'a_STANDARD_FORMS'
    ,@count = @rowcount
	,@mode = 2

UPDATE #forms
    SET id = ident + @first_id

INSERT a_STANDARD_FORMS
           ([id]
            ,[form_type_id]
           ,[name]
           ,[description]
           ,[page_key]
           ,[page_title]
           ,[control_path]
           ,[after_submit_control_path])
    SELECT [id]
            ,[form_type_id]
           ,[name]
           ,[description]
           ,[page_key]
           ,[page_title]
           ,[control_path]
           ,[after_submit_control_path]
        FROM #forms

SELECT * FROM #forms
DROP TABLE #forms

DECLARE @new_id INT
	,@form_id INT

SELECT @form_id = id
	FROM a_STANDARD_FORMS
	WHERE name = 'LSC - Subgrants Step 1 - Uploads'

EXEC @new_id = getid_sel @table='a_STANDARD_FORM_RELATED_PAGE'
	,@mode = 2

INSERT a_STANDARD_FORM_RELATED_PAGE
	(id
	,standard_form_id
	,page_key
	,page_title
	,control_path)
	VALUES
		(@new_id
		,@form_id
		,'UploadEditor'
		,'Uploads Editor'
		,'Implementation/Modules/RequestSubgrantApproval/Forms/UploadEditor.ascx')

SELECT * FROM a_STANDARD_FORM_RELATED_PAGE
	WHERE id = @new_id