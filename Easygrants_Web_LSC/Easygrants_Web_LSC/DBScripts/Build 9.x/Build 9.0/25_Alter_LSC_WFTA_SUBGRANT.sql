ALTER TABLE LSC_WFTA_SUBGRANT
   ADD is_grantee bit null


ALTER TABLE LSC_WFTA_SUBGRANT
   ADD transfer_funds_audit bit null

ALTER TABLE LSC_WFTA_SUBGRANT
    ADD renewal_mostrecent_4q_from datetime null

ALTER TABLE LSC_WFTA_SUBGRANT
    ADD renewal_mostrecent_4q_to datetime null


ALTER TABLE LSC_WFTA_SUBGRANT
    ADD type_of_contract int null
