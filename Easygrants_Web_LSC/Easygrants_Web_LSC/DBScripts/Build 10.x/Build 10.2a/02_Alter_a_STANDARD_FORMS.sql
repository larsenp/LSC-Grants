--Add post-submit form for staff review of TIG LOIs

update a_standard_forms
	set after_submit_control_path = 'Implementation/Modules/TIG_LOI_Review/Forms/OPP_PostSubmit.ascx'
	where id = 1306
