/****** Object:  View [dbo].[vLSC_PROJECTED_EXPENSES_LSC_PIVOT]    Script Date: 04/16/2009 08:42:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vLSC_PROJECTED_EXPENSES_LSC_PIVOT]

AS

select wf_task_assignment_id,
	[6_8], 
	[6_9],
	[6_10],
	[6_11],
	[7_1],
	[7_2],
	[7_3],
	[7_4],
	[7_5],
	[7_6],
	[7_7],
	[7_8],
	[7_9],
	[7_10],
	[7_11],
	[7_12],
	[7_13],
	[7_14],
	[7_15],
	[7_16],
	[7_17],
	[7_18],
	[7_19],
	[7_20]
from
	(select wfta.wf_task_assignment_id,
		cast(bcp.sort_order as varchar(3)) + '_' + cast(bc.sort_order as varchar(3)) category_sort,
		isnull(lbi.lsc_expenditures, 0) lsc_expenditures
		from WF_TASK_ASSIGNMENT wfta
			join vLSC_WFTA_BUDGET_PERIOD wbp on wfta.wf_task_assignment_id = wbp.wf_task_assignment_id
			join grantee_project gp on wfta.grantee_project_id = gp.grantee_project_id
			join budget_item bi on wbp.budget_period_id = bi.budget_period_id
			join a_budget_category bc on bi.budget_category_id = bc.budget_category_id
			join a_budget_category bcp on bc.parent_id = bcp.budget_category_id
			join lsc_budget_item lbi on bi.budget_item_id = lbi.budget_item_id
		where wfta.wf_task_id = 19
			and bc.category_type_id = 6) as expense
	pivot
	(sum(lsc_expenditures)
		for category_sort in ([6_8], 
			[6_9],
			[6_10],
			[6_11],
			[7_1],
			[7_2],
			[7_3],
			[7_4],
			[7_5],
			[7_6],
			[7_7],
			[7_8],
			[7_9],
			[7_10],
			[7_11],
			[7_12],
			[7_13],
			[7_14],
			[7_15],
			[7_16],
			[7_17],
			[7_18],
			[7_19],
			[7_20])) as piv
go


CREATE VIEW [dbo].[vLSC_PROJECTED_EXPENSES_NON_LSC_PIVOT]

AS

select wf_task_assignment_id,
	[6_8], 
	[6_9],
	[6_10],
	[6_11],
	[7_1],
	[7_2],
	[7_3],
	[7_4],
	[7_5],
	[7_6],
	[7_7],
	[7_8],
	[7_9],
	[7_10],
	[7_11],
	[7_12],
	[7_13],
	[7_14],
	[7_15],
	[7_16],
	[7_17],
	[7_18],
	[7_19],
	[7_20]
from
	(select wfta.wf_task_assignment_id,
		cast(bcp.sort_order as varchar(3)) + '_' + cast(bc.sort_order as varchar(3)) category_sort,
		isnull(lbi.non_lsc_expenditures, 0) non_lsc_expenditures
		from WF_TASK_ASSIGNMENT wfta
			join vLSC_WFTA_BUDGET_PERIOD wbp on wfta.wf_task_assignment_id = wbp.wf_task_assignment_id
			join grantee_project gp on wfta.grantee_project_id = gp.grantee_project_id
			join budget_item bi on wbp.budget_period_id = bi.budget_period_id
			join a_budget_category bc on bi.budget_category_id = bc.budget_category_id
			join a_budget_category bcp on bc.parent_id = bcp.budget_category_id
			join lsc_budget_item lbi on bi.budget_item_id = lbi.budget_item_id
		where wfta.wf_task_id = 19
			and bc.category_type_id = 6) as expense
	pivot
	(sum(non_lsc_expenditures)
		for category_sort in ([6_8], 
			[6_9],
			[6_10],
			[6_11],
			[7_1],
			[7_2],
			[7_3],
			[7_4],
			[7_5],
			[7_6],
			[7_7],
			[7_8],
			[7_9],
			[7_10],
			[7_11],
			[7_12],
			[7_13],
			[7_14],
			[7_15],
			[7_16],
			[7_17],
			[7_18],
			[7_19],
			[7_20])) as piv

go

CREATE VIEW [dbo].[vLSC_PROJECTED_EXPENSES_TOTAL_PIVOT]

AS

select wf_task_assignment_id,
	[6_8], 
	[6_9],
	[6_10],
	[6_11],
	[7_1],
	[7_2],
	[7_3],
	[7_4],
	[7_5],
	[7_6],
	[7_7],
	[7_8],
	[7_9],
	[7_10],
	[7_11],
	[7_12],
	[7_13],
	[7_14],
	[7_15],
	[7_16],
	[7_17],
	[7_18],
	[7_19],
	[7_20]
from
	(select wfta.wf_task_assignment_id,
		cast(bcp.sort_order as varchar(3)) + '_' + cast(bc.sort_order as varchar(3)) category_sort,
		isnull(bi.amount, 0) amount
		from WF_TASK_ASSIGNMENT wfta
			join vLSC_WFTA_BUDGET_PERIOD wbp on wfta.wf_task_assignment_id = wbp.wf_task_assignment_id
			join budget_item bi on wbp.budget_period_id = bi.budget_period_id
			join a_budget_category bc on bi.budget_category_id = bc.budget_category_id
			join a_budget_category bcp on bc.parent_id = bcp.budget_category_id
		where wfta.wf_task_id = 19
			and bc.category_type_id = 6) as expense
	pivot
	(sum(amount)
		for category_sort in ([6_8], 
			[6_9],
			[6_10],
			[6_11],
			[7_1],
			[7_2],
			[7_3],
			[7_4],
			[7_5],
			[7_6],
			[7_7],
			[7_8],
			[7_9],
			[7_10],
			[7_11],
			[7_12],
			[7_13],
			[7_14],
			[7_15],
			[7_16],
			[7_17],
			[7_18],
			[7_19],
			[7_20])) as piv

go

CREATE VIEW [dbo].[vLSC_PROJECTED_EXPENSES]

AS

select pelp.wf_task_assignment_id,
	o.legacy_organization_id recipient_id,
	wcy.wfta_year,
	c.abbr serv_area,
	pelp.[6_8] Lawyers,
	pelp.[6_9] Paralegals,
	pelp.[6_10] Other_Staff,
	pelp.[6_11] Empl_Benefits,
	pelp.[6_8] + pelp.[6_9] + pelp.[6_10] + pelp.[6_11] Personnel_LSC,
	pelp.[7_1] Space_Rent,
	pelp.[7_2] Space_Mortgage,
	pelp.[7_3] Space_Other,
	pelp.[7_4] Equip_Rental,
	pelp.[7_5] Off_Supplies,
	pelp.[7_6] Telephone,
	pelp.[7_7] Travel_Board,
	pelp.[7_8] Travel_Staff,
	pelp.[7_9] Traing_Board,
	pelp.[7_10] Traing_Staff,
	pelp.[7_11] Library,
	pelp.[7_12] Insurance,
	pelp.[7_13] Dues,
	pelp.[7_14] Audit,
	pelp.[7_15] Litigation,
	pelp.[7_16] Property_Acqu,
	pelp.[7_17] Purch_Payments,
	pelp.[7_18] Contr_Serv_Clt,
	pelp.[7_19] Contr_Serv_Rec,
	pelp.[7_20] Other,
	pelp.[7_1] + pelp.[7_2] + pelp.[7_3] + pelp.[7_4] + pelp.[7_5] + pelp.[7_6] + pelp.[7_7] + pelp.[7_8] + pelp.[7_9] + pelp.[7_10] + pelp.[7_11] + pelp.[7_12] + pelp.[7_13] + pelp.[7_14] + pelp.[7_15] + pelp.[7_16] + pelp.[7_17] + pelp.[7_18] + pelp.[7_19] + pelp.[7_20] Non_Personnel_LSC,
	pelp.[6_8] + pelp.[6_9] + pelp.[6_10] + pelp.[6_11] + pelp.[7_1] + pelp.[7_2] + pelp.[7_3] + pelp.[7_4] + pelp.[7_5] + pelp.[7_6] + pelp.[7_7] + pelp.[7_8] + pelp.[7_9] + pelp.[7_10] + pelp.[7_11] + pelp.[7_12] + pelp.[7_13] + pelp.[7_14] + pelp.[7_15] + pelp.[7_16] + pelp.[7_17] + pelp.[7_18] + pelp.[7_19] + pelp.[7_20] LSC_Total,
	penp.[6_8] Lawyers_NLSC,
	penp.[6_9] Paralgls_NLSC,
	penp.[6_10] Ot_Stf_NLSC,
	penp.[6_11] Empl_Bnfs_NLSC,
	penp.[6_8] + penp.[6_9] + penp.[6_10] + penp.[6_11] Personnel_Non_LSC,
	penp.[7_1] Sp_Rent_NLSC,
	penp.[7_2] Sp_Mortg_NLSC,
	penp.[7_3] Sp_Other_NLSC,
	penp.[7_4] Equp_Rent_NLSC,
	penp.[7_5] Off_Suppl_NLSC,
	penp.[7_6] Tel_NLSC,
	penp.[7_7] Trvl_Brd_NLSC,
	penp.[7_8] Trvl_Stf_NLSC,
	penp.[7_9] Trng_Brd_NLSC,
	penp.[7_10] Trng_Stf_NLSC,
	penp.[7_11] Library_NLSC,
	penp.[7_12] Insr_NLSC,
	penp.[7_13] Dues_NLSC,
	penp.[7_14] Audit_NLSC,
	penp.[7_15] Litig_NLSC,
	penp.[7_16] Prop_Acqu_NLSC,
	penp.[7_17] Purch_Pay_NLSC,
	penp.[7_18] Ct_Srv_Cl_NLSC,
	penp.[7_19] Ct_Srv_Rp_NLSC,
	penp.[7_20] Other_NLSC,
	penp.[7_1] + penp.[7_2] + penp.[7_3] + penp.[7_4] + penp.[7_5] + penp.[7_6] + penp.[7_7] + penp.[7_8] + penp.[7_9] + penp.[7_10] + penp.[7_11] + penp.[7_12] + penp.[7_13] + penp.[7_14] + penp.[7_15] + penp.[7_16] + penp.[7_17] + penp.[7_18] + penp.[7_19] + penp.[7_20] Non_Personnel_Non_LSC,
	penp.[6_8] + penp.[6_9] + penp.[6_10] + penp.[6_11] + penp.[7_1] + penp.[7_2] + penp.[7_3] + penp.[7_4] + penp.[7_5] + penp.[7_6] + penp.[7_7] + penp.[7_8] + penp.[7_9] + penp.[7_10] + penp.[7_11] + penp.[7_12] + penp.[7_13] + penp.[7_14] + penp.[7_15] + penp.[7_16] + penp.[7_17] + penp.[7_18] + penp.[7_19] + penp.[7_20] Non_LSC_Total,
	petp.[6_8] Lawyers_Total,
	petp.[6_9] Paralegals_Total,
	petp.[6_10] Other_Staff_Total,
	petp.[6_11] Empl_Benefits_Total,
	petp.[6_8] + petp.[6_9] + petp.[6_10] + petp.[6_11] Personnel_Total,
	petp.[7_1] Space_Rent_Total,
	petp.[7_2] Space_Mortgage_Total,
	petp.[7_3] Space_Other_Total,
	petp.[7_4] Equip_Rental_Total,
	petp.[7_5] Off_Supplies_Total,
	petp.[7_6] Telephone_Total,
	petp.[7_7] Travel_Board_Total,
	petp.[7_8] Travel_Staff_Total,
	petp.[7_9] Traing_Board_Total,
	petp.[7_10] Traing_Staff_Total,
	petp.[7_11] Library_Total,
	petp.[7_12] Insurance_Total,
	petp.[7_13] Dues_Total,
	petp.[7_14] Audit_Total,
	petp.[7_15] Litigation_Total,
	petp.[7_16] Property_Acqu_Total,
	petp.[7_17] Purch_Payments_Total,
	petp.[7_18] Contr_Serv_Clt_Total,
	petp.[7_19] Contr_Serv_Rec_Total,
	petp.[7_20] Other_Total,
	petp.[7_1] + petp.[7_2] + petp.[7_3] + petp.[7_4] + petp.[7_5] + petp.[7_6] + petp.[7_7] + petp.[7_8] + petp.[7_9] + petp.[7_10] + petp.[7_11] + petp.[7_12] + petp.[7_13] + petp.[7_14] + petp.[7_15] + petp.[7_16] + petp.[7_17] + petp.[7_18] + petp.[7_19] + petp.[7_20] Non_Personnel_Total,
	petp.[6_8] + petp.[6_9] + petp.[6_10] + petp.[6_11] + petp.[7_1] + petp.[7_2] + petp.[7_3] + petp.[7_4] + petp.[7_5] + petp.[7_6] + petp.[7_7] + petp.[7_8] + petp.[7_9] + petp.[7_10] + petp.[7_11] + petp.[7_12] + petp.[7_13] + petp.[7_14] + petp.[7_15] + petp.[7_16] + petp.[7_17] + petp.[7_18] + petp.[7_19] + petp.[7_20] Grand_Total
	from vLSC_PROJECTED_EXPENSES_LSC_PIVOT pelp
		join vLSC_PROJECTED_EXPENSES_NON_LSC_PIVOT penp on pelp.wf_task_assignment_id = penp.wf_task_assignment_id
		join vLSC_PROJECTED_EXPENSES_TOTAL_PIVOT petp on pelp.wf_task_assignment_id = petp.wf_task_assignment_id
		join wf_task_assignment wfta on pelp.wf_task_assignment_id = wfta.wf_task_assignment_id
		join grantee_project gp on wfta.grantee_project_id = gp.grantee_project_id
		join organization o on gp.primary_organization_id = o.organization_id
		join vwfta_competition_year wcy on wfta.wf_task_assignment_id = wcy.wf_task_assignment_id
		join a_wf_project wfp on gp.wf_project_id = wfp.id
		join a_competition c on wfp.competition_id = c.id
	