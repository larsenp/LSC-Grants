UPDATE LSC_a_PRO_BONO_SUBCATEGORY
	SET description = 'Applicants should provide an analysis of the pro bono capacity of the private bar and legal community in their area and, the volunteers they seek to target in their Pro Bono Innovation Project, and explain their strategy to target these volunteers'
	FROM LSC_a_PRO_BONO_CATEGORY c
		JOIN LSC_a_PRO_BONO_SUBCATEGORY sc ON c.id = sc.lsc_pro_bono_category_id
	WHERE c.sort_order = 1
		AND sc.sort_order = 2