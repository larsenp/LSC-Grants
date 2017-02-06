ALTER VIEW [dbo].[vLSC_PROJECTED_STAFF_TOTALS]

AS

SELECT [lsc_projected_staff_id]
      ,ISNULL([dir_ft], 0) + ISNULL([dir_pt], 0) + ISNULL([dir_vlnt], 0) dir_total
      ,ISNULL([dep_Dir_ft], 0) + ISNULL([dep_Dir_pt], 0) + ISNULL([dep_Dir_vlnt], 0) dep_Dir_total
      ,ISNULL([dir_Ltg_ft], 0) + ISNULL([dir_Ltg_pt], 0) + ISNULL([dir_Ltg_vlnt], 0) dir_Ltg_total
      ,ISNULL([mng_Atrny_ft], 0) + ISNULL([mng_Atrny_pt], 0) + ISNULL([mng_Atrny_vlnt], 0) mng_Atrny_total
      ,ISNULL([supr_Atrny_ft], 0) + ISNULL([supr_Atrny_pt], 0) + ISNULL([supr_Atrny_vlnt], 0) supr_Atrny_total
      ,ISNULL([stf_Atrny_ft], 0) + ISNULL([stf_Atrny_pt], 0) + ISNULL([stf_Atrny_vlnt], 0) stf_Atrny_total
      ,ISNULL([prlgl_ft], 0) + ISNULL([prlgl_pt], 0) + ISNULL([prlgl_vlnt], 0) prlgl_total
      ,ISNULL([pai_Cord_ft], 0) + ISNULL([pai_Cord_pt], 0) + ISNULL([pai_Cord_vlnt], 0) pai_Cord_total
      ,ISNULL([dev_dir_ft], 0) + ISNULL([dev_dir_pt], 0) + ISNULL([dev_dir_vlnt], 0) dev_dir_total
      ,ISNULL([trng_Cord_ft], 0) + ISNULL([trng_Cord_pt], 0) + ISNULL([trng_Cord_vlnt], 0) trng_Cord_total
      ,ISNULL([fin_Prof_ft], 0) + ISNULL([fin_Prof_pt], 0) + ISNULL([fin_Prof_vlnt], 0) fin_Prof_total
      ,ISNULL([mng_Prof_ft], 0) + ISNULL([mng_Prof_pt], 0) + ISNULL([mng_Prof_vlnt], 0) mng_Prof_total
      ,ISNULL([grants_mgr_ft], 0) + ISNULL([grants_mgr_pt], 0) + ISNULL([grants_mgr_vlnt], 0) grants_mgr_total
      ,ISNULL([law_Clerk_ft], 0) + ISNULL([law_Clerk_pt], 0) + ISNULL([law_Clerk_vlnt], 0) law_Clerk_total
      ,ISNULL([sr_Aide_ft], 0) + ISNULL([sr_Aide_pt], 0) + ISNULL([sr_Aide_vlnt], 0) sr_Aide_total
      ,ISNULL([admn_Asst_ft], 0) + ISNULL([admn_Asst_pt], 0) + ISNULL([admn_Asst_vlnt], 0) admn_Asst_total
      ,ISNULL([sec_Or_Cl_ft], 0) + ISNULL([sec_Or_Cl_pt], 0) + ISNULL([sec_Or_Cl_vlnt], 0) sec_Or_Cl_total
      ,ISNULL([other_ft], 0) + ISNULL([other_pt], 0) + ISNULL([other_vlnt], 0) other_total
      ,ISNULL([it_ft], 0) + ISNULL([it_pt], 0) + ISNULL([it_VInt], 0) it_total
	,ISNULL([dir_ft], 0) + ISNULL([dep_Dir_ft], 0) + ISNULL([dir_Ltg_ft], 0) + ISNULL([mng_Atrny_ft], 0) + ISNULL([supr_Atrny_ft], 0) + ISNULL([stf_Atrny_ft], 0) + ISNULL([prlgl_ft], 0) + ISNULL([pai_Cord_ft], 0) + ISNULL([dev_dir_ft], 0) + ISNULL([trng_Cord_ft], 0) + ISNULL([fin_Prof_ft], 0) + ISNULL([mng_Prof_ft], 0) + ISNULL([grants_mgr_ft], 0) + ISNULL([law_Clerk_ft], 0) + ISNULL([sr_Aide_ft], 0) + ISNULL([admn_Asst_ft], 0) + ISNULL([sec_Or_Cl_ft], 0) + ISNULL([other_ft], 0) + ISNULL([it_ft], 0) ft_total
	,ISNULL([dir_pt], 0) + ISNULL([dep_Dir_pt], 0) + ISNULL([dir_Ltg_pt], 0) + ISNULL([mng_Atrny_pt], 0) + ISNULL([supr_Atrny_pt], 0) + ISNULL([stf_Atrny_pt], 0) + ISNULL([prlgl_pt], 0) + ISNULL([pai_Cord_pt], 0) + ISNULL([dev_dir_pt], 0) + ISNULL([trng_Cord_pt], 0) + ISNULL([fin_Prof_pt], 0) + ISNULL([mng_Prof_pt], 0) + ISNULL([grants_mgr_pt], 0) + ISNULL([law_Clerk_pt], 0) + ISNULL([sr_Aide_pt], 0) + ISNULL([admn_Asst_pt], 0) + ISNULL([sec_Or_Cl_pt], 0) + ISNULL([other_pt], 0) + ISNULL([it_pt], 0) pt_total
	,ISNULL([dir_vlnt], 0) + ISNULL([dep_Dir_vlnt], 0) + ISNULL([dir_Ltg_vlnt], 0) + ISNULL([mng_Atrny_vlnt], 0) + ISNULL([supr_Atrny_vlnt], 0) + ISNULL([stf_Atrny_vlnt], 0) + ISNULL([prlgl_vlnt], 0) + ISNULL([pai_Cord_vlnt], 0) + ISNULL([dev_dir_vlnt], 0) + ISNULL([trng_Cord_vlnt], 0) + ISNULL([fin_Prof_vlnt], 0) + ISNULL([mng_Prof_vlnt], 0) + ISNULL([grants_mgr_vlnt], 0) + ISNULL([law_Clerk_vlnt], 0) + ISNULL([sr_Aide_vlnt], 0) + ISNULL([admn_Asst_vlnt], 0) + ISNULL([sec_Or_Cl_vlnt], 0) + ISNULL([other_vlnt], 0) + ISNULL([it_vInt], 0) vlnt_total  
	,ISNULL([dir_ft], 0) + ISNULL([dep_Dir_ft], 0) + ISNULL([dir_Ltg_ft], 0) + ISNULL([mng_Atrny_ft], 0) + ISNULL([supr_Atrny_ft], 0) + ISNULL([stf_Atrny_ft], 0) + ISNULL([prlgl_ft], 0) + ISNULL([pai_Cord_ft], 0) + ISNULL([dev_dir_ft], 0) + ISNULL([trng_Cord_ft], 0) + ISNULL([fin_Prof_ft], 0) + ISNULL([mng_Prof_ft], 0) + ISNULL([grants_mgr_ft], 0) + ISNULL([law_Clerk_ft], 0) + ISNULL([sr_Aide_ft], 0) + ISNULL([admn_Asst_ft], 0) + ISNULL([sec_Or_Cl_ft], 0) + ISNULL([other_ft], 0) + ISNULL([it_ft], 0) 
		+ ISNULL([dir_pt], 0) + ISNULL([dep_Dir_pt], 0) + ISNULL([dir_Ltg_pt], 0) + ISNULL([mng_Atrny_pt], 0) + ISNULL([supr_Atrny_pt], 0) + ISNULL([stf_Atrny_pt], 0) + ISNULL([prlgl_pt], 0) + ISNULL([pai_Cord_pt], 0) + ISNULL([dev_dir_pt], 0) + ISNULL([trng_Cord_pt], 0) + ISNULL([fin_Prof_pt], 0) + ISNULL([mng_Prof_pt], 0) + ISNULL([grants_mgr_pt], 0) + ISNULL([law_Clerk_pt], 0) + ISNULL([sr_Aide_pt], 0) + ISNULL([admn_Asst_pt], 0) + ISNULL([sec_Or_Cl_pt], 0) + ISNULL([other_pt], 0) + ISNULL([it_pt], 0) 
		+ ISNULL([dir_vlnt], 0) + ISNULL([dep_Dir_vlnt], 0) + ISNULL([dir_Ltg_vlnt], 0) + ISNULL([mng_Atrny_vlnt], 0) + ISNULL([supr_Atrny_vlnt], 0) + ISNULL([stf_Atrny_vlnt], 0) + ISNULL([prlgl_vlnt], 0) + ISNULL([pai_Cord_vlnt], 0) + ISNULL([dev_dir_vlnt], 0) + ISNULL([trng_Cord_vlnt], 0) + ISNULL([fin_Prof_vlnt], 0) + ISNULL([mng_Prof_vlnt], 0) + ISNULL([grants_mgr_vlnt], 0) + ISNULL([law_Clerk_vlnt], 0) + ISNULL([sr_Aide_vlnt], 0) + ISNULL([admn_Asst_vlnt], 0) + ISNULL([sec_Or_Cl_vlnt], 0) + ISNULL([other_vlnt], 0) + ISNULL([it_vInt], 0) grand_total
	FROM [LSC_PROJECTED_STAFF]
