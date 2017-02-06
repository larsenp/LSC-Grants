
ALTER TABLE LSC_REVIEW_APPLICATION
ADD compliance_issues bit null, 
    compliance_issues_comment varchar(max) null, 
    audit_issues bit null,
    audit_issues_comment varchar(max) null