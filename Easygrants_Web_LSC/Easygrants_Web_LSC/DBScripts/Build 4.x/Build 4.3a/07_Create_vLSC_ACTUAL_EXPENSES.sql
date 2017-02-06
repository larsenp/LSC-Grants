/****** Object:  View [dbo].[vLSC_ACTUAL_EXPENSES]    Script Date: 02/13/2009 10:28:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vLSC_ACTUAL_EXPENSES]

AS

select aelp.wf_task_assignment_id,
	o.legacy_organization_id recipient_id,
	wcy.wfta_year,
	c.abbr serv_area,
	aelp.[6_8] Lawyers,
	aelp.[6_9] Paralegals,
	aelp.[6_10] Other_Staff,
	aelp.[6_11] Empl_Benefits,
	aelp.[6_8] + aelp.[6_9] + aelp.[6_10] + aelp.[6_11] Personnel_LSC,
	aelp.[7_1] Space_Rent,
	aelp.[7_2] Space_Mortgage,
	aelp.[7_3] Space_Other,
	aelp.[7_4] Equip_Rental,
	aelp.[7_5] Off_Supplies,
	aelp.[7_6] Telephone,
	aelp.[7_7] Travel_Board,
	aelp.[7_8] Travel_Staff,
	aelp.[7_9] Traing_Board,
	aelp.[7_10] Traing_Staff,
	aelp.[7_11] Library,
	aelp.[7_12] Insurance,
	aelp.[7_13] Dues,
	aelp.[7_14] Audit,
	aelp.[7_15] Litigation,
	aelp.[7_16] Property_Acqu,
	aelp.[7_17] Purch_Payments,
	aelp.[7_18] Contr_Serv_Clt,
	aelp.[7_19] Contr_Serv_Rec,
	aelp.[7_20] Other,
	aelp.[7_1] + aelp.[7_2] + aelp.[7_3] + aelp.[7_4] + aelp.[7_5] + aelp.[7_6] + aelp.[7_7] + aelp.[7_8] + aelp.[7_9] + aelp.[7_10] + aelp.[7_11] + aelp.[7_12] + aelp.[7_13] + aelp.[7_14] + aelp.[7_15] + aelp.[7_16] + aelp.[7_17] + aelp.[7_18] + aelp.[7_19] + aelp.[7_20] Non_Personnel_LSC,
	aelp.[6_8] + aelp.[6_9] + aelp.[6_10] + aelp.[6_11] + aelp.[7_1] + aelp.[7_2] + aelp.[7_3] + aelp.[7_4] + aelp.[7_5] + aelp.[7_6] + aelp.[7_7] + aelp.[7_8] + aelp.[7_9] + aelp.[7_10] + aelp.[7_11] + aelp.[7_12] + aelp.[7_13] + aelp.[7_14] + aelp.[7_15] + aelp.[7_16] + aelp.[7_17] + aelp.[7_18] + aelp.[7_19] + aelp.[7_20] LSC_Total,
	aenp.[6_8] Lawyers_NLSC,
	aenp.[6_9] Paralgls_NLSC,
	aenp.[6_10] Ot_Stf_NLSC,
	aenp.[6_11] Empl_Bnfs_NLSC,
	aenp.[6_8] + aenp.[6_9] + aenp.[6_10] + aenp.[6_11] Personnel_Non_LSC,
	aenp.[7_1] Sp_Rent_NLSC,
	aenp.[7_2] Sp_Mortg_NLSC,
	aenp.[7_3] Sp_Other_NLSC,
	aenp.[7_4] Equp_Rent_NLSC,
	aenp.[7_5] Off_Suppl_NLSC,
	aenp.[7_6] Tel_NLSC,
	aenp.[7_7] Trvl_Brd_NLSC,
	aenp.[7_8] Trvl_Stf_NLSC,
	aenp.[7_9] Trng_Brd_NLSC,
	aenp.[7_10] Trng_Stf_NLSC,
	aenp.[7_11] Library_NLSC,
	aenp.[7_12] Insr_NLSC,
	aenp.[7_13] Dues_NLSC,
	aenp.[7_14] Audit_NLSC,
	aenp.[7_15] Litig_NLSC,
	aenp.[7_16] Prop_Acqu_NLSC,
	aenp.[7_17] Purch_Pay_NLSC,
	aenp.[7_18] Ct_Srv_Cl_NLSC,
	aenp.[7_19] Ct_Srv_Rp_NLSC,
	aenp.[7_20] Other_NLSC,
	aenp.[7_1] + aenp.[7_2] + aenp.[7_3] + aenp.[7_4] + aenp.[7_5] + aenp.[7_6] + aenp.[7_7] + aenp.[7_8] + aenp.[7_9] + aenp.[7_10] + aenp.[7_11] + aenp.[7_12] + aenp.[7_13] + aenp.[7_14] + aenp.[7_15] + aenp.[7_16] + aenp.[7_17] + aenp.[7_18] + aenp.[7_19] + aenp.[7_20] Non_Personnel_Non_LSC,
	aenp.[6_8] + aenp.[6_9] + aenp.[6_10] + aenp.[6_11] + aenp.[7_1] + aenp.[7_2] + aenp.[7_3] + aenp.[7_4] + aenp.[7_5] + aenp.[7_6] + aenp.[7_7] + aenp.[7_8] + aenp.[7_9] + aenp.[7_10] + aenp.[7_11] + aenp.[7_12] + aenp.[7_13] + aenp.[7_14] + aenp.[7_15] + aenp.[7_16] + aenp.[7_17] + aenp.[7_18] + aenp.[7_19] + aenp.[7_20] Non_LSC_Total,
	aetp.[6_8] Lawyers_Total,
	aetp.[6_9] Paralegals_Total,
	aetp.[6_10] Other_Staff_Total,
	aetp.[6_11] Empl_Benefits_Total,
	aetp.[6_8] + aetp.[6_9] + aetp.[6_10] + aetp.[6_11] Personnel_Total,
	aetp.[7_1] Space_Rent_Total,
	aetp.[7_2] Space_Mortgage_Total,
	aetp.[7_3] Space_Other_Total,
	aetp.[7_4] Equip_Rental_Total,
	aetp.[7_5] Off_Supplies_Total,
	aetp.[7_6] Telephone_Total,
	aetp.[7_7] Travel_Board_Total,
	aetp.[7_8] Travel_Staff_Total,
	aetp.[7_9] Traing_Board_Total,
	aetp.[7_10] Traing_Staff_Total,
	aetp.[7_11] Library_Total,
	aetp.[7_12] Insurance_Total,
	aetp.[7_13] Dues_Total,
	aetp.[7_14] Audit_Total,
	aetp.[7_15] Litigation_Total,
	aetp.[7_16] Property_Acqu_Total,
	aetp.[7_17] Purch_Payments_Total,
	aetp.[7_18] Contr_Serv_Clt_Total,
	aetp.[7_19] Contr_Serv_Rec_Total,
	aetp.[7_20] Other_Total,
	aetp.[7_1] + aetp.[7_2] + aetp.[7_3] + aetp.[7_4] + aetp.[7_5] + aetp.[7_6] + aetp.[7_7] + aetp.[7_8] + aetp.[7_9] + aetp.[7_10] + aetp.[7_11] + aetp.[7_12] + aetp.[7_13] + aetp.[7_14] + aetp.[7_15] + aetp.[7_16] + aetp.[7_17] + aetp.[7_18] + aetp.[7_19] + aetp.[7_20] Non_Personnel_Total,
	aetp.[6_8] + aetp.[6_9] + aetp.[6_10] + aetp.[6_11] + aetp.[7_1] + aetp.[7_2] + aetp.[7_3] + aetp.[7_4] + aetp.[7_5] + aetp.[7_6] + aetp.[7_7] + aetp.[7_8] + aetp.[7_9] + aetp.[7_10] + aetp.[7_11] + aetp.[7_12] + aetp.[7_13] + aetp.[7_14] + aetp.[7_15] + aetp.[7_16] + aetp.[7_17] + aetp.[7_18] + aetp.[7_19] + aetp.[7_20] Grand_Total
	from vLSC_ACTUAL_EXPENSES_LSC_PIVOT aelp
		join vLSC_ACTUAL_EXPENSES_NON_LSC_PIVOT aenp on aelp.wf_task_assignment_id = aenp.wf_task_assignment_id
		join vLSC_ACTUAL_EXPENSES_TOTAL_PIVOT aetp on aelp.wf_task_assignment_id = aetp.wf_task_assignment_id
		join wf_task_assignment wfta on aelp.wf_task_assignment_id = wfta.wf_task_assignment_id
		join grantee_project gp on wfta.grantee_project_id = gp.grantee_project_id
		join organization o on gp.primary_organization_id = o.organization_id
		join vwfta_competition_year wcy on wfta.wf_task_assignment_id = wcy.wf_task_assignment_id
		join a_wf_project wfp on gp.wf_project_id = wfp.id
		join a_competition c on wfp.competition_id = c.id
	