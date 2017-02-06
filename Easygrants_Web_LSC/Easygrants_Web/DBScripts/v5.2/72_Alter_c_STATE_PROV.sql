ALTER TABLE c_STATE_PROV ADD country_id int not null default (280)
GO

update c_STATE_PROV set country_id = 41 where description in ('Ontario', 'Quebec', 'British Columbia', 'Alberta', 'Nova Scotia', 'Manitoba', 'Labrador', 'New Brunswick', 'Newfoundland', 'Northwest Territories', 'Prince Edward Island', 'Saskatchewan', 'Yukon')

update s_ID_GEN set lookup_table_type_id = 3 where table_name = 'c_STATE_PROV'