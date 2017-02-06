
--Adding the default value constriant 
--Below we are adding the default type to 1 which is PERSON 

ALTER TABLE a_WF_PROJECT  ADD CONSTRAINT
      DF_a_WF_PROJECT_grantee_default_type_id   DEFAULT 1 FOR grantee_default_type_id;



--Updating the Grantee Default to Type Person for all the existing Funding
UPDATE a_WF_PROJECT SET grantee_default_type_id = 1;