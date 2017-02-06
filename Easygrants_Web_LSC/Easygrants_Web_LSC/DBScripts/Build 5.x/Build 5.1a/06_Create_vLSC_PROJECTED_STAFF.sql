/****** Object:  View [dbo].[vLSC_PROJECTED_STAFF]    Script Date: 04/16/2009 14:27:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vLSC_PROJECTED_STAFF]

AS

SELECT o.legacy_organization_id OrgID,
	tp.sort_order YearID,
	ot.abbr Office_Type,
	dir_ft,
	dir_pt,
	dir_vlnt,
	dep_Dir_ft,
	dep_Dir_pt,
	dep_Dir_vlnt,
	dir_Ltg_ft,
	dir_Ltg_pt,
	dir_Ltg_vlnt,
	mng_Atrny_ft,
	mng_Atrny_pt,
	mng_Atrny_vlnt,
	supr_Atrny_ft,
	supr_Atrny_pt,
	supr_Atrny_vlnt,
	stf_Atrny_ft,
	stf_Atrny_pt,
	stf_Atrny_vlnt,
	prlgl_ft,
	prlgl_pt,
	prlgl_vlnt,
	pai_Cord_ft,
	pai_Cord_pt,
	pai_Cord_vlnt,
	trng_Cord_ft,
	trng_Cord_pt,
	trng_Cord_vlnt,
	fin_Prof_ft,
	fin_Prof_pt,
	fin_Prof_vlnt,
	mng_Prof_ft,
	mng_Prof_pt,
	mng_Prof_vlnt,
	law_Clerk_ft,
	law_Clerk_pt,
	law_Clerk_vlnt,
	sr_Aide_ft,
	sr_Aide_pt,
	sr_Aide_vlnt,
	admn_Asst_ft,
	admn_Asst_pt,
	admn_Asst_vlnt,
	sec_Or_Cl_ft,
	sec_Or_Cl_pt,
	sec_Or_Cl_vlnt,
	other_ft,
	other_pt,
	other_vlnt,
	it_ft,
	it_pt,
	it_VInt
	FROM LSC_PROJECTED_STAFF ps
		JOIN ORGANIZATION o ON ps.organization_id = o.organization_id
		JOIN c_TIME_PERIOD tp ON ps.time_period_id = tp.id
		JOIN LSC_c_OFFICE_TYPE ot ON ps.lsc_office_type_id = ot.id
