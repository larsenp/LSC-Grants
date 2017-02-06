UPDATE a_STANDARD_FORMS
	SET control_path = 'Implementation/Modules/TIG_LOI_Review/Forms/TIGLOIReview_OPP_Container_OpenReplication.ascx'
	WHERE id = 1240
	
update a_standard_forms
	set after_submit_control_path = 'Implementation/Modules/TIG_LOI_Review/Forms/TIGLOIReview_OPP_List_PostSubmit.ascx'
	where id in (1240, 1241)
