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
           (3
           ,'LSC - PBIF Application - Main'
           ,'Main'
           ,'Main'
           ,'Main'
           ,'Implementation/Modules/PBIF_Application/Forms/Main.ascx'
           ,'Implementation/Modules/PBIF_Application/Forms/PostSubmission.ascx')

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
           ,'LSC - PBIF Application - Application'
           ,'Application'
           ,'Application'
           ,'Application'
           ,'Implementation/Modules/PBIF_Application/Forms/Application.ascx'
           ,'Implementation/Modules/PBIF_Application/Forms/PostSubmission.ascx')

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
           ,'LSC - PBIF Application - Narrative'
           ,'Narrative'
           ,'Narrative'
           ,'Narrative'
           ,'Implementation/Modules/PBIF_Application/Forms/Narrative.ascx'
           ,'Implementation/Modules/PBIF_Application/Forms/PostSubmission.ascx')

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
           ,'LSC - PBIF Application - Budget Form'
           ,'Budget Form'
           ,'Budget Form'
           ,'BudgetForm'
           ,'Implementation/Modules/PBIF_Application/Forms/BudgetForm.ascx'
           ,'Implementation/Modules/PBIF_Application/Forms/PostSubmission.ascx')

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
           ,'LSC - PBIF Application - Budget Narrative'
           ,'Budget Narrative'
           ,'Budget Narrative'
           ,'BudgetNarrative'
           ,'Implementation/Modules/PBIF_Application/Forms/BudgetNarrative.ascx'
           ,'Implementation/Modules/PBIF_Application/Forms/PostSubmission.ascx')

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
           ,'LSC - PBIF Application - Resumes'
           ,'Resumes of Key Staff'
           ,'Resumes'
           ,'Resumes of Key Staff'
           ,'Implementation/Modules/PBIF_Application/Forms/Resumes.ascx'
           ,'Implementation/Modules/PBIF_Application/Forms/PostSubmission.ascx')

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
           ,'LSC - PBIF Application - Appendices'
           ,'Appendices and Supporting Documentation'
           ,'Appendices'
           ,'Appendices and Supporting Documentation'
           ,'Implementation/Modules/PBIF_Application/Forms/Appendices.ascx'
           ,'Implementation/Modules/PBIF_Application/Forms/PostSubmission.ascx')

INSERT #forms
           ([form_type_id]
           ,[name]
           ,[description]
           ,[page_key]
           ,[page_title]
           ,[control_path]
           ,[after_submit_control_path])
     VALUES
           (4
           ,'LSC - PBIF Application - Review and Submit'
           ,'Review and Submit'
           ,'ReviewSubmit'
           ,'Review and Submit'
           ,'Implementation/Modules/PBIF_Application/Forms/ReviewSubmit.ascx'
           ,'Implementation/Modules/PBIF_Application/Forms/PostSubmission.ascx')



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