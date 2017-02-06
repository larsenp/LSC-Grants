TRUNCATE TABLE LSC_a_TIG_BUDGET_NARRATIVE_INSTRUCTION

EXEC spUPDATE_IDGEN @select = 0

DECLARE @new_id INT

EXEC @new_id = getid_sel @table='LSC_a_TIG_BUDGET_NARRATIVE_INSTRUCTION'

INSERT INTO [LSC_a_TIG_BUDGET_NARRATIVE_INSTRUCTION]
           ([id]
           ,[time_period_id]
           ,[lsc_tig_budget_line_id]
           ,[lsc_tig_budget_funding_type_id]
           ,[instruction])
     VALUES
           (@new_id
           ,16
           ,1
           ,1
           ,'Detail the proposed expenditures requested from TIG funding for any of your program’s personnel. If the term of the project is for more than one year, give the proposed expenditures for each year. Do not include expenditures for contract or partner personnel. Those expenditures should be detailed under the Contracts or Partner line items.')

EXEC @new_id = getid_sel @table='LSC_a_TIG_BUDGET_NARRATIVE_INSTRUCTION'

INSERT INTO [LSC_a_TIG_BUDGET_NARRATIVE_INSTRUCTION]
           ([id]
           ,[time_period_id]
           ,[lsc_tig_budget_line_id]
           ,[lsc_tig_budget_funding_type_id]
           ,[instruction])
     VALUES
           (@new_id
           ,16
           ,1
           ,2
           ,'Detail the proposed expenditures for any program personnel in relation to the project timetable. If the term of the project is for more than one year, give the proposed expenditures for each  year. Include only grantee personnel expenditures contributed by the program. Contract or partner personnel expenditures should be detailed under the Contracts or Partner line items.')

EXEC @new_id = getid_sel @table='LSC_a_TIG_BUDGET_NARRATIVE_INSTRUCTION'

INSERT INTO [LSC_a_TIG_BUDGET_NARRATIVE_INSTRUCTION]
           ([id]
           ,[time_period_id]
           ,[lsc_tig_budget_line_id]
           ,[lsc_tig_budget_funding_type_id]
           ,[instruction])
     VALUES
           (@new_id
           ,16
           ,2
           ,1
           ,'Include the cost of fringe benefits requested from TIG funding for any program personnel detailed in Line 1, Column A.')

EXEC @new_id = getid_sel @table='LSC_a_TIG_BUDGET_NARRATIVE_INSTRUCTION'

INSERT INTO [LSC_a_TIG_BUDGET_NARRATIVE_INSTRUCTION]
           ([id]
           ,[time_period_id]
           ,[lsc_tig_budget_line_id]
           ,[lsc_tig_budget_funding_type_id]
           ,[instruction])
     VALUES
           (@new_id
           ,16
           ,2
           ,2
           ,'Include the cost of fringe benefits the grantee will be contributing for any program personnel detailed in Line 1, Column B.')

EXEC @new_id = getid_sel @table='LSC_a_TIG_BUDGET_NARRATIVE_INSTRUCTION'

INSERT INTO [LSC_a_TIG_BUDGET_NARRATIVE_INSTRUCTION]
           ([id]
           ,[time_period_id]
           ,[lsc_tig_budget_line_id]
           ,[lsc_tig_budget_funding_type_id]
           ,[instruction])
     VALUES
           (@new_id
           ,16
           ,11
           ,2
           ,'Outline any contracts not included in the LSC funding request (Budget line 11 A.) and/or provide details of any program contributions to the contracts specified in the Contracts Form (if required) above. All expenditures, including personnel, travel, equipment, etc. that will be part of the contract should be included. Regardless of whether you identify a specific contractor, provide as much information as possible about the planned contracts, including the expected contract amount, the contractor''s staff that will work on the project, and the contractor''s anticipated responsibilities.')

EXEC @new_id = getid_sel @table='LSC_a_TIG_BUDGET_NARRATIVE_INSTRUCTION'

INSERT INTO [LSC_a_TIG_BUDGET_NARRATIVE_INSTRUCTION]
           ([id]
           ,[time_period_id]
           ,[lsc_tig_budget_line_id]
           ,[lsc_tig_budget_funding_type_id]
           ,[instruction])
     VALUES
           (@new_id
           ,16
           ,11
           ,3
           ,'Outline any contracts not included in the LSC funding request (Budget line 11 A.) and/or provide details of how funds from Other LSC-funded partners will be used in the contracts specified in the Contracts Form (if required) above. All expenditures, including personnel, travel, equipment, etc. that will be part of the contract should be included. Regardless of whether you identify a specific contractor, provide as much information as possible about the planned contracts, including the expected contract amount, the contractor''s staff that will work on the project, and the contractor''s anticipated responsibilities.')

EXEC @new_id = getid_sel @table='LSC_a_TIG_BUDGET_NARRATIVE_INSTRUCTION'

INSERT INTO [LSC_a_TIG_BUDGET_NARRATIVE_INSTRUCTION]
           ([id]
           ,[time_period_id]
           ,[lsc_tig_budget_line_id]
           ,[lsc_tig_budget_funding_type_id]
           ,[instruction])
     VALUES
           (@new_id
           ,16
           ,11
           ,4
           ,'Outline any contracts not included in the LSC funding request (Budget line 11 A.) and/or provide details of how funds from non-LSC funded partners will be used in the contracts specified in the Contracts Form (if required) above. All expenditures, including personnel, travel, equipment, etc. that will be part of the contract should be included. Regardless of whether you identify a specific contractor, provide as much information as possible about the planned contracts, including the expected contract amount, the contractor''s staff that will work on the project, and the contractor''s anticipated responsibilities.')

EXEC @new_id = getid_sel @table='LSC_a_TIG_BUDGET_NARRATIVE_INSTRUCTION'

INSERT INTO [LSC_a_TIG_BUDGET_NARRATIVE_INSTRUCTION]
           ([id]
           ,[time_period_id]
           ,[lsc_tig_budget_line_id]
           ,[lsc_tig_budget_funding_type_id]
           ,[instruction])
     VALUES
           (@new_id
           ,16
           ,15
           ,1
           ,'Provide detailed information for any other anticipated costs. Unspecified administrative costs will not be allowed.')
