CREATE VIEW vLSC_RMASTER

AS

SELECT o.organization_id
	,r.*
	FROM ORGANIZATION o
		JOIN [LSC-SQL].RINDB.dbo.RMASTER r ON o.legacy_organization_id = r.Org_ID