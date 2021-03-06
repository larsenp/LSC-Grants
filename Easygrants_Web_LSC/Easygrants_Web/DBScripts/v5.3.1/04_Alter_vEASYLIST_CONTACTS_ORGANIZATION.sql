/*
Developer		: 	Sumanth Kollipara
Date			:	03/30/2009
Modification		:	Added top 1 for sub queries to get only one row result
*/

ALTER VIEW [dbo].[vEASYLIST_CONTACTS_ORGANIZATION]
AS
SELECT DISTINCT organization_id, common_organization_name, acronym, ein,
                          (SELECT     id
                            FROM          person_organization_affiliation poa
                            WHERE      poa.is_primary_organization_contact = 1 AND poa.is_primary = 1 AND poa.organization_id = b.organization_id) AS id,
                          (SELECT   TOP 1  (SELECT     name_last
                                                    FROM         person p
                                                    WHERE     p.person_id = poa.person_id) AS name_last
                            FROM          person_organization_affiliation poa
                            WHERE      poa.is_primary_organization_contact = 1 AND poa.is_primary = 1 AND poa.organization_id = b.organization_id) AS name_last,
                          (SELECT   TOP 1   (SELECT     name_first
                                                    FROM         person p
                                                    WHERE     p.person_id = poa.person_id) AS name_first
                            FROM          person_organization_affiliation poa
                            WHERE      poa.is_primary_organization_contact = 1 AND poa.is_primary = 1 AND poa.organization_id = b.organization_id) AS name_first,
                          (SELECT     city
                            FROM          address a
                            WHERE      a.entity_id = b.organization_id AND a.is_primary = 1 AND a.entity_type_id = 2) AS city,
                          (SELECT   TOP 1   (SELECT     description
                                                    FROM         c_state_prov c
                                                    WHERE     c.id = a.state_province_id AND a.is_primary = 1 AND a.entity_type_id = 2) AS state
                            FROM          address a
                            WHERE      a.entity_id = b.organization_id AND a.is_primary = 1 AND a.entity_type_id = 2) AS State, organization_name
FROM         dbo.ORGANIZATION b

GO
