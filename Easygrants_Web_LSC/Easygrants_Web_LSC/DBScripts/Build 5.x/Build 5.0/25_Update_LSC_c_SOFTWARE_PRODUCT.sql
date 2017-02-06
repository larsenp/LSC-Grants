--Remove "TurboCases" from the Case Management software category
--and all products from the Server OS category

update lsc_c_software_product
	set end_date = '4/13/2009'
	where id = 31 --TurboCases
		or software_type_id = 14 --Server OS

