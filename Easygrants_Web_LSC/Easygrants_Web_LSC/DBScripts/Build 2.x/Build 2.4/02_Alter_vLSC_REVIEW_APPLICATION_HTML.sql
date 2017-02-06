ALTER VIEW [dbo].[vLSC_REVIEW_APPLICATION_HTML]

AS

SELECT lsc_review_application_id,
	dbo.fnCRLF_to_br(grant_proposal_summary) grant_proposal_summary,
	dbo.fnCRLF_to_br(comment2) comment2,
	dbo.fnCRLF_to_br(comment3) comment3,
	dbo.fnCRLF_to_br(comment4) comment4,
	dbo.fnCRLF_to_br(comment5) comment5,
	dbo.fnCRLF_to_br(comment6) comment6,
	dbo.fnCRLF_to_br(comment7) comment7,
	dbo.fnCRLF_to_br(comment8) comment8,
	dbo.fnCRLF_to_br(comment9) comment9,
	dbo.fnCRLF_to_br(app_overview_comment) app_overview_comment,
	dbo.fnCRLF_to_br(grantee_profile_comment) grantee_profile_comment,
	dbo.fnCRLF_to_br(oce_report_comment) oce_report_comment,
	dbo.fnCRLF_to_br(pai_plan_comment) pai_plan_comment
	FROM LSC_REVIEW_APPLICATION
