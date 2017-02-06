
ALTER VIEW [dbo].[vLSC_TIG_LOI_READONLY]

AS

SELECT tl.[lsc_tig_loi_id]
      ,tl.[wf_task_assignment_id]
	  ,wfta.grantee_project_id
      ,tl.[requested_amount]
      ,dbo.fnCRLF_to_br(tl.[project_description]) project_description
      ,dbo.fnCRLF_to_br(tl.[benefits]) benefits
      ,dbo.fnCRLF_to_br(tl.[costs]) costs
      ,dbo.fnCRLF_to_br(tl.[partners]) partners
      ,dbo.fnCRLF_to_br(tl.[innovation]) innovation
      ,dbo.fnCRLF_to_br(tl.[prev_web]) prev_web
      ,dbo.fnCRLF_to_br(tl.[non_web]) non_web
      ,dbo.fnCRLF_to_br(tl.[add_info]) add_info
      ,tl.[parallel_pbif]
      ,tl.[apply_for_pbif]
  FROM [LSC_TIG_LOI] tl
	JOIN WF_TASK_ASSIGNMENT wfta ON tl.wf_task_assignment_id = wfta.wf_task_assignment_id

