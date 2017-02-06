insert a_standard_form_related_page
    (id,
    standard_form_id,
    page_key,
    page_title,
    control_path)
    select 1127,
        1294,
        page_key,
        page_title,
        control_path
        from a_standard_form_related_page
        where id = 1124

insert a_standard_form_related_page
    (id,
    standard_form_id,
    page_key,
    page_title,
    control_path)
    select 1128,
        1294,
        page_key,
        page_title,
        control_path
        from a_standard_form_related_page
        where id = 1125

update s_id_gen
	set next_id = 1129
	where table_name = 'a_standard_form_related_page'