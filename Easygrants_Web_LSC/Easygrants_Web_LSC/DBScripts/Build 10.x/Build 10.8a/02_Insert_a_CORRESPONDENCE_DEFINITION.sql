/****************************************************************************/
/*VERIFY AVAILABILITY OF ID IN TARGET ENVIRONMENT BEFORE RUNNING THIS SCRIPT*/
/****************************************************************************/

insert a_correspondence_definition
	select * from [lsc-eg5dev].Easygrants_tig_migration_test.dbo.a_correspondence_definition
		where correspondence_definition_id = 1007

update s_id_gen
	set next_id = 1008
	where table_name = 'a_correspondence_definition'