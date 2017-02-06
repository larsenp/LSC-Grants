CREATE VIEW vLSC_REVIEW_ASSIGNMENT_INQUIRY_HTML

AS

select lsc_review_assignment_inquiry_id,
	dbo.fnCRLF_to_br(comment) comment
	from LSC_REVIEW_ASSIGNMENT_INQUIRY
