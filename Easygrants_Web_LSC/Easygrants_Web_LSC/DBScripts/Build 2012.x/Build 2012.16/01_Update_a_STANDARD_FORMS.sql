select *  from a_STANDARD_FORMS 

Update a_STANDARD_FORMS
set name = 'LSC - Review Subgrant Approval Request - Regulatory Compliance - Regulatory Compliance Review', 
    description = 'LSC - Review Subgrant Approval Request - Regulatory Compliance - Regulatory Compliance Review',
    Page_key = 'RegulatoryComplianceReview',
    page_title = 'Regulatory Compliance Review',
    Control_path = 'Implementation/Modules/SubgrantApprovalReview_RC/Forms/RegulatoryComplianceReview.ascx',
    after_submit_control_path = 'Implementation/Modules/SubgrantApprovalReview_RC/Forms/PostSubmission.ascx'
where id = 1302


Update a_STANDARD_FORMS
set name = 'LSC - Review Subgrant Approval Request - Regulatory Compliance - Review and Submit', 
    description = 'LSC - Review Subgrant Approval Request - Regulatory Compliance - Review and Submit',
    Control_path = 'Implementation/Modules/SubgrantApprovalReview_RC/Forms/ReviewSubmit.ascx'
where id = 1303