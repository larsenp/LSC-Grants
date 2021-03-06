
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

ALTER VIEW [dbo].[vLSC_TECHNOLOGY_BUDGET_TOTAL] AS
SELECT [lsc_technology_budget_id]
      ,[wf_task_assignment_id]
      ,[org_id]
      ,[time_period_id]
      ,ISNULL([program_IT_staffing_costs], 0)
      + ISNULL([external_IT_staffing_costs], 0)
      + ISNULL([space_cost], 0)
      + ISNULL([travel], 0)
      + ISNULL([equipment_purchase], 0)
      + ISNULL([equipment_rental], 0)
      + ISNULL([telecom_bandwidth_charges], 0)
      + ISNULL([communications_other], 0)
      + ISNULL([software], 0)
      + ISNULL([supplies], 0)
      + ISNULL([contracts], 0)
      + ISNULL([training_IT_staff], 0)
      + ISNULL([training_IT_otherstaff], 0)
      + ISNULL([other], 0)  technologybudgettotal 
  FROM [dbo].[LSC_TECHNOLOGY_BUDGET]
GO

SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO

