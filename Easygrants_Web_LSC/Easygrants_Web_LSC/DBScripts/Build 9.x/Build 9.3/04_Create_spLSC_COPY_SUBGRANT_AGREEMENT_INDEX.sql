CREATE PROCEDURE spLSC_COPY_SUBGRANT_AGREEMENT_INDEX
	(@source_wfta_id INT,
	@target_wfta_id INT)

AS

DECLARE @new_id INT

EXEC @new_id = getid_sel @table = 'LSC_SUBGRANT_AGREEMENT_INDEX'

INSERT INTO [LSC_SUBGRANT_AGREEMENT_INDEX]
           ([lsc_subgrant_agreement_index_id]
           ,[wf_task_assignment_id]
           ,[terms_con_pg]
           ,[terms_con_para]
           ,[fund_xfer_pg]
           ,[fund_xfer_para]
           ,[term_agree_pg]
           ,[term_agree_para]
           ,[bond_cover_pg]
           ,[bond_cover_para]
           ,[audit_pg]
           ,[audit_para]
           ,[malpractice_pg]
           ,[malpractice_para]
           ,[gov_lsc_pg]
           ,[gov_lsc_para]
           ,[lsc_oversight_pg]
           ,[lsc_oversight_para]
           ,[audit_compliance_pg]
           ,[audit_compliance_para]
           ,[termination_pg]
           ,[termination_para]
           ,[priority_conflict_pg]
           ,[priority_conflict_para]
           ,[recip_respons_pg]
           ,[recip_respons_para]
           ,[fee_retain_pg]
           ,[fee_retain_para]
           ,[fund_training_pg]
           ,[fund_training_para]
           ,[fund_educ_pg]
           ,[fund_educ_para]
           ,[migrant_serv_pg]
           ,[migrant_serv_para]
           ,[advocacy_pg]
           ,[advocacy_para]
           ,[fund_balance_pg]
           ,[fund_balance_para])
SELECT @new_id
      ,@target_wfta_id
      ,[terms_con_pg]
      ,[terms_con_para]
      ,[fund_xfer_pg]
      ,[fund_xfer_para]
      ,[term_agree_pg]
      ,[term_agree_para]
      ,[bond_cover_pg]
      ,[bond_cover_para]
      ,[audit_pg]
      ,[audit_para]
      ,[malpractice_pg]
      ,[malpractice_para]
      ,[gov_lsc_pg]
      ,[gov_lsc_para]
      ,[lsc_oversight_pg]
      ,[lsc_oversight_para]
      ,[audit_compliance_pg]
      ,[audit_compliance_para]
      ,[termination_pg]
      ,[termination_para]
      ,[priority_conflict_pg]
      ,[priority_conflict_para]
      ,[recip_respons_pg]
      ,[recip_respons_para]
      ,[fee_retain_pg]
      ,[fee_retain_para]
      ,[fund_training_pg]
      ,[fund_training_para]
      ,[fund_educ_pg]
      ,[fund_educ_para]
      ,[migrant_serv_pg]
      ,[migrant_serv_para]
      ,[advocacy_pg]
      ,[advocacy_para]
      ,[fund_balance_pg]
      ,[fund_balance_para]
  FROM [LSC_SUBGRANT_AGREEMENT_INDEX]
	WHERE wf_task_assignment_id = @source_wfta_id