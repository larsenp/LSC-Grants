CREATE LOGIN [LSCwebuser] WITH PASSWORD=N',>À¹}56·lü
|iÔYÍ8®Úúòx/Ò6~', DEFAULT_DATABASE=[EasyGrants_v4_LSC_r1], DEFAULT_LANGUAGE=[us_english], CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF
GO

INSERT INTO [EASYGRANTS_USER]([easygrants_user_id], [person_id], [login_username], [login_password], [encryption_key], [user_type_id], [frontdoor_page], [password_question_id], [password_answer], [external_login_id], [create_date], [create_user_id], [change_date], [change_user_id], [password_last_sent_date], [failed_attempts], [change_password_next_login], [locked]) 
	VALUES(1, 1, 'altumadmin', 'lsc123', '', 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0);

GO

INSERT INTO [PERSON]([person_id], [name_last], [name_first], [name_first_preferred], [name_middle], [name_nick], [name_suffix], [name_honorific], [suffix_id], [assistant_name], [spouse_name], [ssn], [create_user_id], [create_date], [modify_user_id], [modify_date], [gender_id], [prefix_id], [is_reviewer], [aha_name_id], [aha_smart_id], [lineage_id], [ethnicity_id], [race_id], [tenure_id], [title], [degree_id], [date_of_birth], [tenure_year], [legacy_person_id], [degrees], [is_donotcontact], [is_deceased]) 
	VALUES(1, 'admin', 'altum', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);



GO

UPDATE [s_ID_GEN] SET [NEXT_ID] = 2 where [table_name] = 'EASYGRANTS_USER'
UPDATE [s_ID_GEN] SET [NEXT_ID] = 2 where [table_name] = 'PERSON'