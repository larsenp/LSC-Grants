CREATE VIEW vLSC_TIG_SECONDARY_CONTACT

AS


select ta.lsc_tig_app_id,
	ta.wf_task_assignment_id,
	ta.secondary_contact_first_name name_first,
	ta.secondary_contact_middle_name name_middle,
	ta.secondary_contact_last_name name_last,
	ta.secondary_contact_address_1 address_1,
	ta.secondary_contact_address_2 address_2,
	ta.secondary_contact_city city,
	sp.abbr st,
	sp.description [state],
	ta.secondary_contact_zip zip_postal_code,
	ta.secondary_contact_phone phone_number,
	ta.secondary_contact_fax fax,
	ta.secondary_contact_email email_addr
	from lsc_tig_app ta
		join c_state_prov sp on ta.secondary_contact_state_province_id = sp.id
	where ta.secondary_contact_person_id is null

union all

select ta.lsc_tig_app_id,
	ta.wf_task_assignment_id,
	p.name_first,
	p.name_middle,
	p.name_last,
	a.address_1,
	a.address_2,
	a.city,
	sp.abbr st,
	sp.description [state],
	a.zip_postal_code,
	p_p.phone_number,
	p_f.phone_number fax,
	e.email_addr
	from lsc_tig_app ta
		join person p on ta.secondary_contact_person_id = p.person_id
		left join address a on p.person_id = a.entity_id
			and a.entity_type_id = 1
			and a.is_primary = 1
		left join c_state_prov sp on a.state_province_id = sp.id
		left join phone p_p on p.person_id = p_p.entity_id
			and p_p.entity_type_id = 1
			and p_p.is_primary = 1
		left join phone p_f on p.person_id = p_f.entity_id
			and p_f.entity_type_id = 1
			and p_f.type_id = 4
		left join email e on p.person_id = e.entity_id
			and e.entity_type_id = 1
			and e.is_primary = 1
	where ta.secondary_contact_person_id is not null

