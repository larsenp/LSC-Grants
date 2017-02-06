ALTER TABLE s_SHAREPOINT_INTEGRATION ADD sharepoint_unreachable_message varchar(500);

ALTER TABLE s_SHAREPOINT_INTEGRATION ADD sharepoint_server_status int  default ((1));