select *  from a_REPORT_OUTPUT_DEFINITION 

ALTER TABLE a_REPORT_OUTPUT_DEFINITION 
  ALTER COLUMN description varchar(60)


Update a_REPORT_OUTPUT_DEFINITION 
set definition_key = 'ReviewSubgrantApprovalRequestRC',
    description = 'Review Subgrant Approval Request - Regulatory Compliance'
where report_output_definition_id = 23
