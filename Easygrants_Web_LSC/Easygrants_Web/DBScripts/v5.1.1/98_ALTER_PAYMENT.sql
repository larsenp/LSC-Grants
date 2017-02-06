ALTER TABLE PAYMENT ADD wf_task_assignment_id int;
ALTER TABLE PAYMENT ADD payee_organization_location int;
ALTER TABLE PAYMENT ADD is_final_payment_request bit;
ALTER TABLE PAYMENT ADD bank_name varchar(100);
ALTER TABLE PAYMENT ADD bank_city_state varchar(250);
ALTER TABLE PAYMENT ADD routing_number varchar(100);
ALTER TABLE PAYMENT ADD name_on_account varchar(250);
ALTER TABLE PAYMENT ADD account_number varchar(100);
ALTER TABLE PAYMENT ADD intermediary_bank_name varchar(100);
ALTER TABLE PAYMENT ADD intermediary_bank_city_state varchar(250);
ALTER TABLE PAYMENT ADD intermediary_bank_routing_number varchar(100);