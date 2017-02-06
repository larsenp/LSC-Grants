CREATE VIEW [dbo].[vLSC_GRANTEE_PROJECT_HTML]

AS

SELECT gp.grantee_project_id,
	dbo.fnCRLF_to_br(gp.grant_description) grant_description,
	dbo.fnCRLF_to_br(gpt.comments_updated) comments_updated
	FROM GRANTEE_PROJECT gp
		LEFT JOIN LSC_GRANTEE_PROJECT_TIG gpt ON gp.grantee_project_id = gpt.grantee_project_id
