ALTER TABLE a_UPLOAD_TEMPLATE ADD file_name_prefix varchar(50);

ALTER TABLE a_UPLOAD_TEMPLATE ADD sharepoint_conversion_status int  default ((0));