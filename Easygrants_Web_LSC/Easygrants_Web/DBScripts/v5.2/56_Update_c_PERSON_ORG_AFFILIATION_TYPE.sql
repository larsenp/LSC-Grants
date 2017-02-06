Delete from c_PERSON_ORG_AFFILIATION_TYPE

insert into c_PERSON_ORG_AFFILIATION_TYPE values (1, 'Administration', 'Administration', 1, null)
insert into c_PERSON_ORG_AFFILIATION_TYPE values (2, 'Financial', 'Financial', 2, null)
insert into c_PERSON_ORG_AFFILIATION_TYPE values (3, 'Staff', 'Staff', 3, null)

update [s_ID_GEN] set [next_id] = 4 where [table_name] = 'c_PERSON_ORG_AFFILIATION_TYPE'