CREATE VIEW vLSC_TIG_LOI_READONLY

AS

SELECT [lsc_tig_loi_id]
      ,[wf_task_assignment_id]
      ,[requested_amount]
      ,dbo.fnCRLF_to_br([project_description]) project_description
      ,dbo.fnCRLF_to_br([benefits]) benefits
      ,dbo.fnCRLF_to_br([costs]) costs
      ,dbo.fnCRLF_to_br([partners]) partners
      ,dbo.fnCRLF_to_br([innovation]) innovation
      ,dbo.fnCRLF_to_br([prev_web]) prev_web
      ,dbo.fnCRLF_to_br([non_web]) non_web
      ,dbo.fnCRLF_to_br([add_info]) add_info
  FROM [LSC_TIG_LOI]
