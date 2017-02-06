INSERT a_REPORT_OUTPUT_DEFINITION
    (report_output_definition_id
    ,definition_key
    ,description
    ,entity_dataobject_key
    ,output_MIME_type
    ,delete_on_view)
    VALUES
        (66
        ,'1607ComplianceReport'
        ,'1607 Compliance Report'
        ,'WfTaskAssignment'
        ,'application/pdf'
        ,0)

UPDATE s_ID_GEN
    set next_id = 66
    where table_name = 'a_REPORT_OUTPUT_DEFINITION' 