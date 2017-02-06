/*
Developer		: 	Sumanth Kollipara
Date			:	03/30/2009
Modification		:	Replacing all references to arlington group email address with altum
*/


update a_CORRESPONDENCE_DEFINITION set correspondence_to = REPLACE(correspondence_to, 'arlgroup', 'altum')
update a_CORRESPONDENCE_DEFINITION set correspondence_from = REPLACE(correspondence_from, 'arlgroup', 'altum')
update a_CORRESPONDENCE_DEFINITION set correspondence_cc = REPLACE(correspondence_cc, 'arlgroup', 'altum')
update a_CORRESPONDENCE_DEFINITION set correspondence_bcc = REPLACE(correspondence_bcc, 'arlgroup', 'altum')
update a_CORRESPONDENCE_DEFINITION set body = REPLACE(body, 'arlgroup', 'altum')
update a_CORRESPONDENCE_DEFINITION set correspondence_from_name = REPLACE(correspondence_from_name, 'arlgroup', 'altum')

GO