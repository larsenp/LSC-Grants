/*
Developer		: 	Sumanth Kollipara
Date			:	03/17/2009
Modification	:	Increased the field length for title and phone_number columns to handle data migration requirements from YUSA
*/

ALTER TABLE GRANTEE_PROJECT_CONTACT_OTHER_PERSON ALTER COLUMN title varchar(100)
GO
ALTER TABLE GRANTEE_PROJECT_CONTACT_OTHER_PERSON ALTER COLUMN phone_number varchar(50)
GO
