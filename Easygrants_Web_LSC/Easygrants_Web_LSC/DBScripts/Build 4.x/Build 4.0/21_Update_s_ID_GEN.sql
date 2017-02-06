/*The purpose of this script is to allow unwanted values to be filtered out of ethnicity drop-downs 
using the "HideInactiveItems" attribute instead of the more cumbersome <Filters> element.
*/
update s_id_gen
	set is_code_table = 1
	where table_name = 'c_ethnicity'
