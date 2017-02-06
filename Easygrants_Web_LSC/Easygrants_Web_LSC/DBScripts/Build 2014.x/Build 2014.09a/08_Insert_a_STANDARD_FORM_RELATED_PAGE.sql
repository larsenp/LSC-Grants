DECLARE @new_id INT

EXEC @new_id= getid_sel @table = 'a_STANDARD_FORM_RELATED_PAGE'

INSERT a_STANDARD_FORM_RELATED_PAGE
    (id
    ,standard_form_id
    ,page_key
    ,page_title
    ,control_path)
    SELECT
        @new_id
        ,id
        ,'ProjectNarrative'
        ,'Project Narrative'
        ,'Implementation/Modules/PBIF_Programmatic_Review/PageSection/ProjectNarrative.ascx'
        FROM a_STANDARD_FORMS
        WHERE name = 'LSC - PBIF Programmatic Review (Primary) - Narrative - Cost-Effectiveness and Budget Adequacy' 

EXEC @new_id= getid_sel @table = 'a_STANDARD_FORM_RELATED_PAGE'

INSERT a_STANDARD_FORM_RELATED_PAGE
    (id
    ,standard_form_id
    ,page_key
    ,page_title
    ,control_path)
    SELECT
        @new_id
        ,id
        ,'Budget'
        ,'Budget'
        ,'Implementation/Modules/PBIF_Programmatic_Review/PageSection/Budget.ascx'
        FROM a_STANDARD_FORMS
        WHERE name = 'LSC - PBIF Programmatic Review (Primary) - Narrative - Cost-Effectiveness and Budget Adequacy' 

EXEC @new_id= getid_sel @table = 'a_STANDARD_FORM_RELATED_PAGE'

INSERT a_STANDARD_FORM_RELATED_PAGE
    (id
    ,standard_form_id
    ,page_key
    ,page_title
    ,control_path)
    SELECT
        @new_id
        ,id
        ,'ProjectNarrative'
        ,'Project Narrative'
        ,'Implementation/Modules/PBIF_Programmatic_Review/PageSection/ProjectNarrative.ascx'
        FROM a_STANDARD_FORMS
        WHERE name = 'LSC - PBIF Programmatic Review (Secondary) - Narrative - Cost-Effectiveness and Budget Adequacy' 

EXEC @new_id= getid_sel @table = 'a_STANDARD_FORM_RELATED_PAGE'

INSERT a_STANDARD_FORM_RELATED_PAGE
    (id
    ,standard_form_id
    ,page_key
    ,page_title
    ,control_path)
    SELECT
        @new_id
        ,id
        ,'Budget'
        ,'Budget'
        ,'Implementation/Modules/PBIF_Programmatic_Review/PageSection/Budget.ascx'
        FROM a_STANDARD_FORMS
        WHERE name = 'LSC - PBIF Programmatic Review (Secondary) - Narrative - Cost-Effectiveness and Budget Adequacy' 