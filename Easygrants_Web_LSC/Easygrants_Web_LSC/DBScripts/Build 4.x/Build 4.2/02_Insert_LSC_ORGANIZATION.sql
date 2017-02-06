CREATE TABLE #lsco
	(lsc_organization_id int identity (1,1),
	organization_id int null,
	reviewer_person_id int null)

INSERT #lsco
	(organization_id,
	reviewer_person_id)
	SELECT o.organization_id,
		177
	FROM [lsc-sql].rindb.dbo.AWARD a
		LEFT JOIN ORGANIZATION o ON a.org_id = o.legacy_organization_id
		LEFT JOIN [lsc-sql].rindb.dbo.RMASTER r on a.org_id = r.org_id
	WHERE r.state_off IN ('OH', 'RI', 'WV', 'MI')
		AND a.year = 2009
	GROUP BY o.organization_id

INSERT #lsco
	(organization_id,
	reviewer_person_id)
	SELECT o.organization_id,
		178
	FROM [lsc-sql].rindb.dbo.AWARD a
		LEFT JOIN ORGANIZATION o ON a.org_id = o.legacy_organization_id
		LEFT JOIN [lsc-sql].rindb.dbo.RMASTER r on a.org_id = r.org_id
	WHERE r.state_off IN ('CT', 'MD', 'NH', 'NY', 'WI', 'ME')
		AND a.year = 2009
	GROUP BY o.organization_id

INSERT #lsco
	(organization_id,
	reviewer_person_id)
	SELECT o.organization_id,
		326
	FROM [lsc-sql].rindb.dbo.AWARD a
		LEFT JOIN ORGANIZATION o ON a.org_id = o.legacy_organization_id
		LEFT JOIN [lsc-sql].rindb.dbo.RMASTER r on a.org_id = r.org_id
	WHERE r.state_off IN ('CA', 'CO', 'KS')
		AND a.year = 2009
		AND r.org_id <> 705158
	GROUP BY o.organization_id

INSERT #lsco
	(organization_id,
	reviewer_person_id)
	SELECT o.organization_id,
		180
	FROM [lsc-sql].rindb.dbo.AWARD a
		LEFT JOIN ORGANIZATION o ON a.org_id = o.legacy_organization_id
		LEFT JOIN [lsc-sql].rindb.dbo.RMASTER r on a.org_id = r.org_id
	WHERE r.state_off IN ('MN', 'OK', 'OR', 'UT', 'WA', 'WY', 'NE')
		AND a.year = 2009
	GROUP BY o.organization_id

INSERT #lsco
	(organization_id,
	reviewer_person_id)
	SELECT o.organization_id,
		184
	FROM [lsc-sql].rindb.dbo.AWARD a
		LEFT JOIN ORGANIZATION o ON a.org_id = o.legacy_organization_id
		LEFT JOIN [lsc-sql].rindb.dbo.RMASTER r on a.org_id = r.org_id
	WHERE (r.state_off IN ('MA', 'PA')
			OR r.org_id IN (331016, 331050, 331060))
		AND a.year = 2009
	GROUP BY o.organization_id

INSERT #lsco
	(organization_id,
	reviewer_person_id)
	SELECT o.organization_id,
		186
	FROM [lsc-sql].rindb.dbo.AWARD a
		LEFT JOIN ORGANIZATION o ON a.org_id = o.legacy_organization_id
		LEFT JOIN [lsc-sql].rindb.dbo.RMASTER r on a.org_id = r.org_id
	WHERE r.state_off IN ('FL', 'GA', 'VA')
		AND a.year = 2009
	GROUP BY o.organization_id

INSERT #lsco
	(organization_id,
	reviewer_person_id)
	SELECT o.organization_id,
		187
	FROM [lsc-sql].rindb.dbo.AWARD a
		LEFT JOIN ORGANIZATION o ON a.org_id = o.legacy_organization_id
		LEFT JOIN [lsc-sql].rindb.dbo.RMASTER r on a.org_id = r.org_id
	WHERE (r.state_off IN ('DE', 'DC', 'IL', 'IN', 'VT')
			OR r.org_id IN (331020, 331100, 331110))
		AND a.year = 2009
	GROUP BY o.organization_id

INSERT #lsco
	(organization_id,
	reviewer_person_id)
	SELECT o.organization_id,
		188
	FROM [lsc-sql].rindb.dbo.AWARD a
		LEFT JOIN ORGANIZATION o ON a.org_id = o.legacy_organization_id
		LEFT JOIN [lsc-sql].rindb.dbo.RMASTER r on a.org_id = r.org_id
	WHERE r.state_off IN ('AK', 'GU', 'HI', 'ID', 'IA', 'MP', 'MT', 'NV', 'TX')
		AND a.year = 2009
	GROUP BY o.organization_id

INSERT #lsco
	(organization_id,
	reviewer_person_id)
	SELECT o.organization_id,
		189
	FROM [lsc-sql].rindb.dbo.AWARD a
		LEFT JOIN ORGANIZATION o ON a.org_id = o.legacy_organization_id
		LEFT JOIN [lsc-sql].rindb.dbo.RMASTER r on a.org_id = r.org_id
	WHERE r.state_off IN ('KY', 'NC', 'PR', 'SC', 'TN')
		AND a.year = 2009
	GROUP BY o.organization_id

INSERT #lsco
	(organization_id,
	reviewer_person_id)
	SELECT o.organization_id,
		190
	FROM [lsc-sql].rindb.dbo.AWARD a
		LEFT JOIN ORGANIZATION o ON a.org_id = o.legacy_organization_id
		LEFT JOIN [lsc-sql].rindb.dbo.RMASTER r on a.org_id = r.org_id
	WHERE (r.state_off IN ('AZ', 'MO', 'NM', 'SD', 'ND')
			OR r.org_id = 705158)
		AND a.year = 2009
	GROUP BY o.organization_id

INSERT #lsco
	(organization_id,
	reviewer_person_id)
	SELECT o.organization_id,
		191
	FROM [lsc-sql].rindb.dbo.AWARD a
		LEFT JOIN ORGANIZATION o ON a.org_id = o.legacy_organization_id
		LEFT JOIN [lsc-sql].rindb.dbo.RMASTER r on a.org_id = r.org_id
	WHERE r.state_off IN ('AL', 'AR', 'LA', 'MS', 'VI')
		AND a.year = 2009
	GROUP BY o.organization_id

INSERT LSC_ORGANIZATION
	SELECT * FROM #lsco

DROP TABLE #lsco

EXEC spUPDATE_IDGEN