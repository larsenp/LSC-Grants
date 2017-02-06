ALTER TABLE LSC_SOFTWARE_QUESTION
	ADD swws_cms BIT
		,swws_cms_comment VARCHAR(MAX)
		,has_social_media BIT
		,automated_form_use BIT
		,automated_form_other VARCHAR(MAX)
		,automated_form_pro_se BIT
		,automated_form_staff_advocate BIT
		,automated_form_pro_bono BIT
		,automated_form_staff_must_use BIT
		,automated_form_most_freq VARCHAR(MAX)
		,automated_form_count INT 
		,automated_form_created_by_staff BIT
		,automated_form_created_by_law_student BIT
		,automated_form_created_by_pro_bono BIT
		,automated_form_created_by_contractor BIT
		,acctg_software_product_other VARCHAR(MAX)
		,remote_access_software_product_other VARCHAR(MAX)