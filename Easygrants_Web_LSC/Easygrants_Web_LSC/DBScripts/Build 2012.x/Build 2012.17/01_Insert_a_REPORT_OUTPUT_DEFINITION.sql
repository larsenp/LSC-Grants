INSERT a_REPORT_OUTPUT_DEFINITION
    (report_output_definition_id
    ,definition_key
    ,description
    ,entity_dataobject_key
    ,output_MIME_type
    ,delete_on_view)
    VALUES
        (61
        ,'GARActualStaffingMainOfficeE1a'
        ,'GAR Form E-1a: Actual Staffing (Main Office)'
        ,'WfTaskAssignment'
        ,'application/pdf'
        ,0)

INSERT a_REPORT_OUTPUT_DEFINITION
    (report_output_definition_id
    ,definition_key
    ,description
    ,entity_dataobject_key
    ,output_MIME_type
    ,delete_on_view)
    VALUES
        (62
        ,'GARActualStaffingBranchOfficeE1b'
        ,'GAR Form E-1b: Actual Staffing (Branch Office)'
        ,'WfTaskAssignment'
        ,'application/pdf'
        ,0)

INSERT a_REPORT_OUTPUT_DEFINITION
    (report_output_definition_id
    ,definition_key
    ,description
    ,entity_dataobject_key
    ,output_MIME_type
    ,delete_on_view)
    VALUES
        (63
        ,'GARActualStaffingSubrecipientOfficeE1c'
        ,'GAR Form E-1c: Actual Staffing (Subrecipient Office)'
        ,'WfTaskAssignment'
        ,'application/pdf'
        ,0)

INSERT a_REPORT_OUTPUT_DEFINITION
    (report_output_definition_id
    ,definition_key
    ,description
    ,entity_dataobject_key
    ,output_MIME_type
    ,delete_on_view)
    VALUES
        (64
        ,'GARSelfInspectionG6'
        ,'GAR Form G-6: Self Inspection'
        ,'WfTaskAssignment'
        ,'application/pdf'
        ,0)

INSERT a_REPORT_OUTPUT_DEFINITION
    (report_output_definition_id
    ,definition_key
    ,description
    ,entity_dataobject_key
    ,output_MIME_type
    ,delete_on_view)
    VALUES
        (65
        ,'GARActualOfficeInformationE0'
        ,'GAR Form E-0: Actual Office Information'
        ,'WfTaskAssignment'
        ,'application/pdf'
        ,0)

UPDATE s_ID_GEN
    set next_id = 66
    where table_name = 'a_REPORT_OUTPUT_DEFINITION' 