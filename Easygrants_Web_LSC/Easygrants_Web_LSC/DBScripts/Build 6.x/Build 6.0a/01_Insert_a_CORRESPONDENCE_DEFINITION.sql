/*
This script was run to assist in fixing the "Send an e-mail" functionality from the error page 
(Mantis 1341)
*/

insert a_correspondence_definition
	select * 
		from [lsc-egdev].[Easygrants_Migration].dbo.a_correspondence_definition
		where correspondence_definition_id = 15
