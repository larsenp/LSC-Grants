ALTER TABLE SUBMITTED_FILE ADD sharepoint_conversion_status int  default ((0));


ALTER TABLE SUBMITTED_FILE ADD file_name_prefix varchar(50);



ALTER TABLE SUBMITTED_FILE ADD wordmerge_template_submittedfileid int;