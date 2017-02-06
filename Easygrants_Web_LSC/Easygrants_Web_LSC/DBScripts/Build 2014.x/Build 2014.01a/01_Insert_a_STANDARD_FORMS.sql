
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
           ,'LSC - Sandy Grant Reporting'
           ,'Sandy Grant Reporting'
           ,'SandyGrantReporting'
           ,'Sandy Grant Reporting'
           ,'Implementation/Modules/Sandy_GrantReporting/Forms/SandyGrantReporting.ascx'
           ,'Implementation/Modules/Sandy_GrantReporting/Forms/PostSubmission.ascx')

INSERT #forms
           ([form_type_id]
           ,[name]
           ,[description]
           ,[page_key]
           ,[page_title]
           ,[control_path])
     VALUES
           (4
           ,'LSC - Sandy Grant Reporting Review and Submit'
           ,'Review and Submit'
           ,'ReviewSubmit'
           ,'Review and Submit'
           ,'Implementation/Modules/Sandy_GrantReporting/Forms/ReviewSubmit.ascx')

DECLARE @rowcount int, @first_id int

EXEC @first_id = spGETID_RANGE_SEL @table = 'a_STANDARD_FORMS'
    ,@count = @rowcount

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