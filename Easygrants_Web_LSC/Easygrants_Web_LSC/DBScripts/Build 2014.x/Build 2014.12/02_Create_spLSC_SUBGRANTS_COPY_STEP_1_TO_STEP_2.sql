CREATE PROCEDURE [dbo].[spLSC_SUBGRANTS_COPY_STEP_1_TO_STEP_2]
	(@grantee_project_id INT
	,@person_id INT
	,@user_id INT)

AS

DECLARE @wfta_id_1 INT
	,@wfta_id_2 INT
	,@new_id INT
	,@rowcount INT
	,@wfpt_id_1 INT
	,@wfpt_id_2 INT

--Get Step 1 task assignment ID
SELECT @wfta_id_1 = wf_task_assignment_id
	FROM WF_TASK_ASSIGNMENT
	WHERE grantee_project_id = @grantee_project_id
		AND wf_task_id = 101

IF @wfta_id_1 IS NULL
BEGIN
	SELECT NULL AS new_wfta_id
	RETURN
END

--Get Step 2 task assignment ID
SELECT @wfta_id_2 = wf_task_assignment_id
	FROM WF_TASK_ASSIGNMENT
	WHERE grantee_project_id = @grantee_project_id
		AND wf_task_id = 116

IF @wfta_id_2 IS NULL
BEGIN --Create step 2 task assignment if necessary
	EXEC @wfta_id_2 = getid_sel @table = 'WF_TASK_ASSIGNMENT'
		,@mode = 2

	INSERT WF_TASK_ASSIGNMENT
		(wf_task_assignment_id
		,wf_task_id
		,wf_task_status_id
		,wf_task_outcome_id
		,grantee_project_id
		,person_id
		,wf_task_role_id
		,start_date
		,open_date
		,due_date
		,close_date
		,end_date
		,create_date
		,create_user_id)
		SELECT
			@wfta_id_2
			,116
			,1
			,278
			,@grantee_project_id
			,@person_id
			,1
			,GETDATE()
			,GETDATE()
			,dateadd(d, -45, start_date)
			,dateadd(d, -41, start_date)
			,dateadd(d, -41, start_date)
			,GETDATE()
			,@user_id
			FROM LSC_WFTA_SUBGRANT
			WHERE wf_task_assignment_id = @wfta_id_1

END

SELECT @rowcount = COUNT(*) 
	FROM LSC_WFTA_SUBGRANT
	WHERE wf_task_assignment_id = @wfta_id_2

IF @rowcount = 0
BEGIN
	EXEC @new_id = getid_sel @table = 'LSC_WFTA_SUBGRANT'
		,@mode = 2

	INSERT LSC_WFTA_SUBGRANT(
		[lsc_wfta_subgrant_id],
		[wf_task_assignment_id],
		[start_date],
		[end_date],
		[subgrantee_name],
		[subgrant_amount],
		[is_renewal],
		[subgrantee_addr1],
		[subgrantee_addr2],
		[subgrantee_city],
		[subgrantee_state_prov_id],
		[subgrantee_zip],
		[subgrantee_pd_first],
		[subgrantee_pd_middle],
		[subgrantee_pd_last],
		[subgrantee_pd_email],
		[subgrantee_pd_phone],
		[counties],
		[subgrant_purpose],
		[lsc_subgrant_grant_type_id],
		[lsc_fund_balance_id],
		[lsc_fund_balance_omitted],
		[lsc_fund_balance_not_applicable],
		[fund_case_services],
		[most_recent_4q_from],
		[most_recent_4q_to] ,
		[most_recent_lsc] ,
		[most_recent_non_lsc] ,
		[preceding_lsc] ,
		[preceding_non_lsc] ,
		[monitoring_procedure_other] ,
		[pai_related] ,
		[state_support_act] ,
		[other_services] ,
		[other_targeted_group] ,
		[Other_Contract_Types] ,
		[is_grantee] ,
		[transfer_funds_audit] ,
		[renewal_mostrecent_4q_from] ,
		[renewal_mostrecent_4q_to] ,
		[type_of_contract] )
		SELECT @new_id,
			@wfta_id_2,
			[start_date],
			[end_date],
			[subgrantee_name],
			[subgrant_amount],
			[is_renewal],
			[subgrantee_addr1],
			[subgrantee_addr2],
			[subgrantee_city],
			[subgrantee_state_prov_id],
			[subgrantee_zip],
			[subgrantee_pd_first],
			[subgrantee_pd_middle],
			[subgrantee_pd_last],
			[subgrantee_pd_email],
			[subgrantee_pd_phone],
			[counties],
			[subgrant_purpose],
			[lsc_subgrant_grant_type_id],
			[lsc_fund_balance_id],
			[lsc_fund_balance_omitted],
			[lsc_fund_balance_not_applicable],
			[fund_case_services],
			[most_recent_4q_from],
			[most_recent_4q_to] ,
			[most_recent_lsc] ,
			[most_recent_non_lsc] ,
			[preceding_lsc] ,
			[preceding_non_lsc] ,
			[monitoring_procedure_other] ,
			[pai_related] ,
			[state_support_act] ,
			[other_services] ,
			[other_targeted_group] ,
			[Other_Contract_Types] ,
			[is_grantee] ,
			[transfer_funds_audit] ,
			[renewal_mostrecent_4q_from] ,
			[renewal_mostrecent_4q_to] ,
			[type_of_contract] 
			FROM LSC_WFTA_SUBGRANT
			WHERE wf_task_assignment_id = @wfta_id_1
END

--LSC_WFTA_SUBGRANT_MONITORING_PROCEDURE
SELECT @rowcount = COUNT(*) 
	FROM LSC_WFTA_SUBGRANT_MONITORING_PROCEDURE
	WHERE wf_task_assignment_id = @wfta_id_2

IF @rowcount = 0
BEGIN

	CREATE TABLE #mp(
		ident INT IDENTITY(0,1),
		[lsc_wfta_subgrant_monitoring_procedure_id] [int],
		[wf_task_assignment_id] [nchar](10) ,
		[lsc_subgrant_monitoring_procedure_id] [int] )

	INSERT #mp
		([wf_task_assignment_id]
		,[lsc_subgrant_monitoring_procedure_id])
		SELECT @wfta_id_2
			,[lsc_subgrant_monitoring_procedure_id]
			FROM LSC_WFTA_SUBGRANT_MONITORING_PROCEDURE
			WHERE wf_task_assignment_id = @wfta_id_1

	SELECT @rowcount = COUNT(*)
		FROM #mp

	EXEC @new_id = spGETID_RANGE_SEL
		@table = 'LSC_WFTA_SUBGRANT_MONITORING_PROCEDURE'
		,@count = @rowcount
		,@mode = 2

	UPDATE #mp
		SET lsc_wfta_subgrant_monitoring_procedure_id = ident + @new_id

	INSERT LSC_WFTA_SUBGRANT_MONITORING_PROCEDURE
		(lsc_wfta_subgrant_monitoring_procedure_id
		,wf_task_assignment_id
		,lsc_subgrant_monitoring_procedure_id)
		SELECT lsc_wfta_subgrant_monitoring_procedure_id
			,wf_task_assignment_id
			,lsc_subgrant_monitoring_procedure_id
		FROM #mp
END

--LSC_SUBRECIPIENT_BUDGET
SELECT @rowcount = COUNT(*) 
	FROM LSC_SUBRECIPIENT_BUDGET
	WHERE wf_task_assignment_id = @wfta_id_2

IF @rowcount = 0
BEGIN
	EXEC @new_id = getid_sel @table = 'LSC_SUBRECIPIENT_BUDGET'
		,@mode = 2

	INSERT INTO LSC_SUBRECIPIENT_BUDGET
			   ([lsc_subrecipient_budget_id]
			   ,[wf_task_assignment_id]
			   ,[lawyers]
			   ,[paralegals]
			   ,[other_staff]
			   ,[employee_benefits]
			   ,[space_rent]
			   ,[space_mortgage]
			   ,[space_other]
			   ,[equip_rental]
			   ,[off_supplies]
			   ,[telephone]
			   ,[travel_board]
			   ,[travel_staff]
			   ,[training_board]
			   ,[training_staff]
			   ,[library]
			   ,[insurance]
			   ,[dues]
			   ,[audit]
			   ,[litigation]
			   ,[property_acq]
			   ,[purchase_pmt]
			   ,[contract_client]
			   ,[contract_applicant]
			   ,[other]
			   ,[note_1]
			   ,[note_2]
			   ,[note_3])
		 SELECT
			   @new_id
			   ,@wfta_id_2
			   ,lawyers
			   ,paralegals
			   ,other_staff
			   ,employee_benefits
			   ,space_rent
			   ,space_mortgage
			   ,space_other
			   ,equip_rental
			   ,off_supplies
			   ,telephone
			   ,travel_board
			   ,travel_staff
			   ,training_board
			   ,training_staff
			   ,library
			   ,insurance
			   ,dues
			   ,audit
			   ,litigation
			   ,property_acq
			   ,purchase_pmt
			   ,contract_client
			   ,contract_applicant
			   ,other
			   ,note_1
			   ,note_2
			   ,note_3
			FROM LSC_SUBRECIPIENT_BUDGET
			WHERE wf_task_assignment_id = @wfta_id_1
END

--LSC_SUBGRANT_SERV_BY_TYPE
SELECT @rowcount = COUNT(*) 
	FROM LSC_SUBGRANT_SERV_BY_TYPE
	WHERE wf_task_assignment_id = @wfta_id_2

IF @rowcount = 0
BEGIN

	CREATE TABLE #sbt(
		ident int identity(0,1),
		[lsc_subgrant_serv_by_type_id] [int] ,
		[wf_task_assignment_id] [int] ,
		[lsc_subgrant_serv_type_id] [int] )

	INSERT #sbt
		([wf_task_assignment_id]
		,[lsc_subgrant_serv_type_id])
		SELECT @wfta_id_2
			,[lsc_subgrant_serv_type_id]
			FROM LSC_SUBGRANT_SERV_BY_TYPE
			WHERE wf_task_assignment_id = @wfta_id_1

	SELECT @rowcount = COUNT(*)
		FROM #sbt

	EXEC @new_id = spGETID_RANGE_SEL
		@table = 'LSC_SUBGRANT_SERV_BY_TYPE'
		,@count = @rowcount
		,@mode = 2

	UPDATE #sbt
		SET lsc_subgrant_serv_by_type_id = ident + @new_id

	INSERT LSC_SUBGRANT_SERV_BY_TYPE
		(lsc_subgrant_serv_by_type_id
		,wf_task_assignment_id
		,lsc_subgrant_serv_type_id)
		SELECT lsc_subgrant_serv_by_type_id
			,wf_task_assignment_id
			,lsc_subgrant_serv_type_id
		FROM #sbt
END

--LSC_SUBGRANT_AGREEMENT_INDEX
SELECT @rowcount = COUNT(*) 
	FROM LSC_SUBGRANT_AGREEMENT_INDEX
	WHERE wf_task_assignment_id = @wfta_id_2

IF @rowcount = 0
BEGIN
	EXEC @new_id = getid_sel @table = 'LSC_SUBGRANT_AGREEMENT_INDEX'
		,@mode = 2

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
			   ,[fund_balance_para]
			   ,[comment])
		 SELECT
			   @new_id
			   ,@wfta_id_2
			   ,terms_con_pg
			   ,terms_con_para
			   ,fund_xfer_pg
			   ,fund_xfer_para
			   ,term_agree_pg
			   ,term_agree_para
			   ,bond_cover_pg
			   ,bond_cover_para
			   ,audit_pg
			   ,audit_para
			   ,malpractice_pg
			   ,malpractice_para
			   ,gov_lsc_pg
			   ,gov_lsc_para
			   ,lsc_oversight_pg
			   ,lsc_oversight_para
			   ,audit_compliance_pg
			   ,audit_compliance_para
			   ,termination_pg
			   ,termination_para
			   ,priority_conflict_pg
			   ,priority_conflict_para
			   ,recip_respons_pg
			   ,recip_respons_para
			   ,fee_retain_pg
			   ,fee_retain_para
			   ,fund_training_pg
			   ,fund_training_para
			   ,fund_educ_pg
			   ,fund_educ_para
			   ,migrant_serv_pg
			   ,migrant_serv_para
			   ,advocacy_pg
			   ,advocacy_para
			   ,fund_balance_pg
			   ,fund_balance_para
			   ,comment
			FROM [LSC_SUBGRANT_AGREEMENT_INDEX]
			WHERE wf_task_assignment_id = @wfta_id_1
END

--SUBMITTED_FILE, SUBMITTED_FILE_DATA
SELECT @rowcount = COUNT(*) 
	FROM SUBMITTED_FILE
	WHERE entity_id = @wfta_id_2
		AND entity_dataobject_key = 'WfTaskAssignment'

IF @rowcount = 0
BEGIN

	CREATE TABLE #sf(
		[ident] [int] identity(0,1),
		[source_sf_id] [int],
		[submitted_file_id] [int],
		[entity_id] [int],
		[file_type_id] [int],
		[source_filename] [varchar](255),
		[source_MIME_type] [varchar](150),
		[source_file_path] [varchar](255),
		[stored_file_path] [varchar](255),
		[submit_date] [datetime],
		[competition_id] [int],
		[color_doc] [smallint],
		[ftp_sent] [bit],
		[converted_file_path] [varchar](255),
		[converted_file_date] [datetime],
		[conversion_status] [int],
		[conversion_result] [varchar](255),
		[description] [varchar](100),
		[uploaded_by_id] [int],
		[upload_title] [varchar](100),
		[is_additional] [bit],
		[modify_date] [datetime],
		[upload_id] [int],
		[entity_dataobject_key] [varchar](50),
		[query_base_type_id] [int],
		[wordmerge_template_type_id] [int],
		[general_upload_category_type_id] [int],
		[general_upload_category_id] [int],
		[general_upload_dataobject_primarykey_id] [int],
		[sharepoint_conversion_status] [int] DEFAULT ((0)),
		[file_name_prefix] [varchar](50),
		[wordmerge_template_submittedfileid] [int],
		[submitted_file_data_id] [int],
		[file_data] [image],
		[compressed_file_data] [image],
		[converted_file_data_id] [int],
		[converted_file_data] [image])

	INSERT #sf
		([source_sf_id],
		[entity_id] ,
		[file_type_id] ,
		[source_filename] ,
		[source_MIME_type],
		[source_file_path],
		[stored_file_path],
		[submit_date] ,
		[competition_id] ,
		[color_doc] ,
		[ftp_sent] ,
		[converted_file_path] ,
		[converted_file_date] ,
		[conversion_status] ,
		[conversion_result] ,
		[description] ,
		[uploaded_by_id] ,
		[upload_title] ,
		[is_additional],
		[modify_date] ,
		[upload_id],
		[entity_dataobject_key] ,
		[query_base_type_id] ,
		[wordmerge_template_type_id] ,
		[general_upload_category_type_id] ,
		[general_upload_category_id] ,
		[general_upload_dataobject_primarykey_id] ,
		[sharepoint_conversion_status] ,
		[file_name_prefix] ,
		[wordmerge_template_submittedfileid])
		SELECT submitted_file_id,
			@wfta_id_2 ,
			[file_type_id] ,
			[source_filename] ,
			[source_MIME_type],
			[source_file_path],
			[stored_file_path],
			[submit_date] ,
			[competition_id] ,
			[color_doc] ,
			[ftp_sent] ,
			[converted_file_path] ,
			[converted_file_date] ,
			[conversion_status] ,
			[conversion_result] ,
			[description] ,
			[uploaded_by_id] ,
			[upload_title] ,
			[is_additional],
			[modify_date] ,
			[upload_id],
			[entity_dataobject_key] ,
			[query_base_type_id] ,
			[wordmerge_template_type_id] ,
			[general_upload_category_type_id] ,
			[general_upload_category_id] ,
			[general_upload_dataobject_primarykey_id] ,
			[sharepoint_conversion_status] ,
			[file_name_prefix] ,
			[wordmerge_template_submittedfileid] 
			FROM SUBMITTED_FILE sf
			WHERE sf.entity_id = @wfta_id_1
				AND sf.entity_dataobject_key = 'WfTaskAssignment'

	--Reset upload ID
	UPDATE #sf
		SET upload_id = wfptu_2.wf_project_task_upload_id
		FROM #sf
			JOIN SUBMITTED_FILE sf ON #sf.source_sf_id = sf.submitted_file_id
			JOIN a_WF_PROJECT_TASK_UPLOAD wfptu_1 ON #sf.upload_id = wfptu_1.wf_project_task_upload_id
			JOIN a_WF_PROJECT_TASK wfpt_1 ON wfptu_1.wf_project_task_id = wfpt_1.id
			JOIN a_WF_PROJECT_TASK wfpt_2 ON wfpt_1.wf_project_id = wfpt_2.wf_project_id
				AND wfpt_2.wf_task_id = 116
			JOIN a_WF_PROJECT_TASK_UPLOAD wfptu_2 ON wfptu_1.upload_id = wfptu_2.upload_id
				AND wfpt_2.id = wfptu_2.wf_project_task_id

	--Populate SUBMITTED_FILE_DATA fields
	UPDATE #sf
		SET [file_data] = sfd.[file_data]
			,[compressed_file_data] = sfd.[compressed_file_data]
		FROM #sf
			JOIN SUBMITTED_FILE_DATA sfd ON #sf.[source_sf_id] = sfd.submitted_file_id

	--Populate SUBMITTED_FILE_CONVERTED_DATA fields
	UPDATE #sf
		SET [converted_file_data] = sfcd.[file_data]
		FROM #sf
			JOIN SUBMITTED_FILE_CONVERTED_DATA sfcd ON #sf.[source_sf_id] = sfcd.submitted_file_id

	--Get new IDs...
	SELECT @rowcount = COUNT(*)
		FROM #sf

	--... for SUBMITTED_FILE
	EXEC @new_id = spGETID_RANGE_SEL
		@table = 'SUBMITTED_FILE'
		,@count = @rowcount
		,@mode = 2

	UPDATE #sf
		SET submitted_file_id = ident + @new_id

	--... for SUBMITTED_FILE_DATA
	EXEC @new_id = spGETID_RANGE_SEL
		@table = 'SUBMITTED_FILE_DATA'
		,@count = @rowcount
		,@mode = 2

	UPDATE #sf
		SET submitted_file_data_id = ident + @new_id

	--... for SUBMITTED_FILE_CONVERTED_DATA
	EXEC @new_id = spGETID_RANGE_SEL
		@table = 'SUBMITTED_FILE_CONVERTED_DATA'
		,@count = @rowcount
		,@mode = 2

	UPDATE #sf
		SET converted_file_data_id = ident + @new_id

	INSERT SUBMITTED_FILE
		([submitted_file_id],
		[entity_id] ,
		[file_type_id] ,
		[source_filename] ,
		[source_MIME_type],
		[source_file_path],
		[stored_file_path],
		[submit_date] ,
		[competition_id] ,
		[color_doc] ,
		[ftp_sent] ,
		[converted_file_path] ,
		[converted_file_date] ,
		[conversion_status] ,
		[conversion_result] ,
		[description] ,
		[uploaded_by_id] ,
		[upload_title] ,
		[is_additional],
		[modify_date] ,
		[upload_id],
		[entity_dataobject_key] ,
		[query_base_type_id] ,
		[wordmerge_template_type_id] ,
		[general_upload_category_type_id] ,
		[general_upload_category_id] ,
		[general_upload_dataobject_primarykey_id] ,
		[sharepoint_conversion_status] ,
		[file_name_prefix] ,
		[wordmerge_template_submittedfileid])
		SELECT 	[submitted_file_id],
			[entity_id] ,
			[file_type_id] ,
			[source_filename] ,
			[source_MIME_type],
			[source_file_path],
			[stored_file_path],
			[submit_date] ,
			[competition_id] ,
			[color_doc] ,
			[ftp_sent] ,
			[converted_file_path] ,
			[converted_file_date] ,
			[conversion_status] ,
			[conversion_result] ,
			[description] ,
			[uploaded_by_id] ,
			[upload_title] ,
			[is_additional],
			[modify_date] ,
			[upload_id],
			[entity_dataobject_key] ,
			[query_base_type_id] ,
			[wordmerge_template_type_id] ,
			[general_upload_category_type_id] ,
			[general_upload_category_id] ,
			[general_upload_dataobject_primarykey_id] ,
			[sharepoint_conversion_status] ,
			[file_name_prefix] ,
			[wordmerge_template_submittedfileid]
			FROM #sf

	INSERT SUBMITTED_FILE_DATA
		([submitted_file_data_id],
		[submitted_file_id],
		[file_data] ,
		[compressed_file_data])
		SELECT 	[submitted_file_data_id],
			[submitted_file_id],
			[file_data] ,
			[compressed_file_data]
			FROM #sf

	INSERT SUBMITTED_FILE_CONVERTED_DATA
		([converted_file_data_id],
		[submitted_file_id],
		[file_data])
		SELECT 	[converted_file_data_id],
			[submitted_file_id],
			[converted_file_data]
			FROM #sf

END

SELECT @wfta_id_2 AS new_wfta_id