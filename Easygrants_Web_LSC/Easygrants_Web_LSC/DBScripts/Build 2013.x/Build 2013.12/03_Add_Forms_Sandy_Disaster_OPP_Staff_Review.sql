EXEC spUPDATE_IDGEN @select = false

DECLARE @sandy_review_form_id int
    ,@disaster_review_form_id int

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
           ,'LSC - Sandy OPP Staff Review - Review'
           ,'Review'
           ,'Review'
           ,'Review'
           ,'Implementation/Modules/Sandy_Review_OPPStaff/Forms/Review.ascx'
           ,'Implementation/Modules/Sandy_Review_OPPStaff/Forms/PostSubmission.ascx')

INSERT #forms
           ([form_type_id]
           ,[name]
           ,[description]
           ,[page_key]
           ,[page_title]
           ,[control_path])
     VALUES
           (4
           ,'LSC - Sandy OPP Staff Review - Review and Submit'
           ,'Review and Submit'
           ,'ReviewSubmit'
           ,'Review and Submit'
           ,'Implementation/Modules/Sandy_Review_OPPStaff/Forms/ReviewSubmit.ascx')

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
           ,'LSC - Disaster OPP Staff Review - Review'
           ,'Review'
           ,'Review'
           ,'Review'
           ,'Implementation/Modules/Disaster_Review_OPPStaff/Forms/Review.ascx'
           ,'Implementation/Modules/Disaster_Review_OPPStaff/Forms/PostSubmission.ascx')

INSERT #forms
           ([form_type_id]
           ,[name]
           ,[description]
           ,[page_key]
           ,[page_title]
           ,[control_path])
     VALUES
           (4
           ,'LSC - Disaster OPP Staff Review - Review and Submit'
           ,'Review and Submit'
           ,'ReviewSubmit'
           ,'Review and Submit'
           ,'Implementation/Modules/Disaster_Review_OPPStaff/Forms/ReviewSubmit.ascx')

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

SELECT @sandy_review_form_id = id
    FROM #forms
    WHERE name = 'LSC - Sandy OPP Staff Review - Review'

SELECT @disaster_review_form_id = id
    FROM #forms
    WHERE name = 'LSC - Disaster OPP Staff Review - Review'

DECLARE @new_id int

EXEC @new_id = getid_sel @table = 'a_STANDARD_FORM_RELATED_PAGE'

INSERT a_STANDARD_FORM_RELATED_PAGE
    (id
    ,standard_form_id
    ,page_key
    ,page_title
    ,control_path)
    VALUES
        (@new_id
        ,@sandy_review_form_id
        ,'UploadEditor'
        ,'Upload Review Document'
        ,'Implementation/Modules/Sandy_Review_OPPStaff/Forms/UploadReview.ascx')

EXEC @new_id = getid_sel @table = 'a_STANDARD_FORM_RELATED_PAGE'

INSERT a_STANDARD_FORM_RELATED_PAGE
    (id
    ,standard_form_id
    ,page_key
    ,page_title
    ,control_path)
    VALUES
        (@new_id
        ,@disaster_review_form_id
        ,'UploadEditor'
        ,'Upload Review Document'
        ,'Implementation/Modules/Disaster_Review_OPPStaff/Forms/UploadReview.ascx')

SELECT * FROM #forms

SELECT * FROM a_STANDARD_FORM_RELATED_PAGE
    WHERE standard_form_id in (@sandy_review_form_id, @disaster_review_form_id)

DROP TABLE #forms