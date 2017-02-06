--Every year, the new funding cycles each get an identical set of budget
--categories. This year's funding cycles will have two new budget categories.
--In the past, we have always copied budget categories from existing projects.
--This year, we will create a new, unattached set of budget categories which 
--will serve as our "model" for this year and can be adjusted as necessary for
--coming years. We start by copying our base set of budget categories to a "nonexistent" 
--project_id (i.e., there is no row in a_WF_PROJECT where id = 1)
EXEC spCOPY_BUDGET_CATEGORIES_TO_PROJECT
	@source_project_id = 4,
	@target_project_id = 1
	
--The stored procedure spLSC_NEW_FUNDING_CYCLE, which used to draw from the set of
--budget categories where project_id = 4, has been modified to draw from this newly-created
--set of "orphan" budget categories where project_id = 1. We will add the new budget categories
--to this set so that they can feed into all the new funding cycles for this year.
EXEC spLSC_INSERT_NEW_BUDGET_CATEGORY_2011 
	@project_id = 1
GO
--This script creates a new funding cycle for each service area in competition
--in 2011 (time_period_id = 16). The stored procedure that it calls also creates
--a new set of budget categories for each funding cycle.
spLSC_NEW_FUNDING_CYCLE @serv_area = 'MAL' , @new_time_period_id = 16
GO
spLSC_NEW_FUNDING_CYCLE @serv_area = 'AS-1' , @new_time_period_id = 16
GO
spLSC_NEW_FUNDING_CYCLE @serv_area = 'AZ-3' , @new_time_period_id = 16
GO
spLSC_NEW_FUNDING_CYCLE @serv_area = 'MAZ' , @new_time_period_id = 16
GO
spLSC_NEW_FUNDING_CYCLE @serv_area = 'AZ-5' , @new_time_period_id = 16
GO
spLSC_NEW_FUNDING_CYCLE @serv_area = 'NAZ-6' , @new_time_period_id = 16
GO
spLSC_NEW_FUNDING_CYCLE @serv_area = 'AZ-2' , @new_time_period_id = 16
GO
spLSC_NEW_FUNDING_CYCLE @serv_area = 'NAZ-5' , @new_time_period_id = 16
GO
spLSC_NEW_FUNDING_CYCLE @serv_area = 'AR-6' , @new_time_period_id = 16
GO
spLSC_NEW_FUNDING_CYCLE @serv_area = 'AR-7' , @new_time_period_id = 16
GO
spLSC_NEW_FUNDING_CYCLE @serv_area = 'MAR' , @new_time_period_id = 16
GO
spLSC_NEW_FUNDING_CYCLE @serv_area = 'CA-1' , @new_time_period_id = 16
GO
spLSC_NEW_FUNDING_CYCLE @serv_area = 'NCA-1' , @new_time_period_id = 16
GO
spLSC_NEW_FUNDING_CYCLE @serv_area = 'CA-27' , @new_time_period_id = 16
GO
spLSC_NEW_FUNDING_CYCLE @serv_area = 'CA-28' , @new_time_period_id = 16
GO
spLSC_NEW_FUNDING_CYCLE @serv_area = 'DC-1' , @new_time_period_id = 16
GO
spLSC_NEW_FUNDING_CYCLE @serv_area = 'IL-3' , @new_time_period_id = 16
GO
spLSC_NEW_FUNDING_CYCLE @serv_area = 'IL-7' , @new_time_period_id = 16
GO
spLSC_NEW_FUNDING_CYCLE @serv_area = 'KY-10' , @new_time_period_id = 16
GO
spLSC_NEW_FUNDING_CYCLE @serv_area = 'KY-2' , @new_time_period_id = 16
GO
spLSC_NEW_FUNDING_CYCLE @serv_area = 'KY-5' , @new_time_period_id = 16
GO
spLSC_NEW_FUNDING_CYCLE @serv_area = 'KY-9' , @new_time_period_id = 16
GO
spLSC_NEW_FUNDING_CYCLE @serv_area = 'MKY' , @new_time_period_id = 16
GO
spLSC_NEW_FUNDING_CYCLE @serv_area = 'LA-1' , @new_time_period_id = 16
GO
spLSC_NEW_FUNDING_CYCLE @serv_area = 'LA-12' , @new_time_period_id = 16
GO
spLSC_NEW_FUNDING_CYCLE @serv_area = 'MLA' , @new_time_period_id = 16
GO
spLSC_NEW_FUNDING_CYCLE @serv_area = 'MA-11' , @new_time_period_id = 16
GO
spLSC_NEW_FUNDING_CYCLE @serv_area = 'MI-12' , @new_time_period_id = 16
GO
spLSC_NEW_FUNDING_CYCLE @serv_area = 'MMI' , @new_time_period_id = 16
GO
spLSC_NEW_FUNDING_CYCLE @serv_area = 'MI-14' , @new_time_period_id = 16
GO
spLSC_NEW_FUNDING_CYCLE @serv_area = 'MI-9' , @new_time_period_id = 16
GO
spLSC_NEW_FUNDING_CYCLE @serv_area = 'MI-15' , @new_time_period_id = 16
GO
spLSC_NEW_FUNDING_CYCLE @serv_area = 'MI-13' , @new_time_period_id = 16
GO
spLSC_NEW_FUNDING_CYCLE @serv_area = 'NMI-1' , @new_time_period_id = 16
GO
spLSC_NEW_FUNDING_CYCLE @serv_area = 'MN-1' , @new_time_period_id = 16
GO
spLSC_NEW_FUNDING_CYCLE @serv_area = 'MN-6' , @new_time_period_id = 16
GO
spLSC_NEW_FUNDING_CYCLE @serv_area = 'MN-4' , @new_time_period_id = 16
GO
spLSC_NEW_FUNDING_CYCLE @serv_area = 'MN-5' , @new_time_period_id = 16
GO
spLSC_NEW_FUNDING_CYCLE @serv_area = 'MMN' , @new_time_period_id = 16
GO
spLSC_NEW_FUNDING_CYCLE @serv_area = 'MS-10' , @new_time_period_id = 16
GO
spLSC_NEW_FUNDING_CYCLE @serv_area = 'MMS' , @new_time_period_id = 16
GO
spLSC_NEW_FUNDING_CYCLE @serv_area = 'MO-3' , @new_time_period_id = 16
GO
spLSC_NEW_FUNDING_CYCLE @serv_area = 'MMO' , @new_time_period_id = 16
GO
spLSC_NEW_FUNDING_CYCLE @serv_area = 'MO-4' , @new_time_period_id = 16
GO
spLSC_NEW_FUNDING_CYCLE @serv_area = 'MO-5' , @new_time_period_id = 16
GO
spLSC_NEW_FUNDING_CYCLE @serv_area = 'MO-7' , @new_time_period_id = 16
GO
spLSC_NEW_FUNDING_CYCLE @serv_area = 'NV-1' , @new_time_period_id = 16
GO
spLSC_NEW_FUNDING_CYCLE @serv_area = 'MNV' , @new_time_period_id = 16
GO
spLSC_NEW_FUNDING_CYCLE @serv_area = 'NNV-1' , @new_time_period_id = 16
GO
spLSC_NEW_FUNDING_CYCLE @serv_area = 'NM-1' , @new_time_period_id = 16
GO
spLSC_NEW_FUNDING_CYCLE @serv_area = 'NNM-2' , @new_time_period_id = 16
GO
spLSC_NEW_FUNDING_CYCLE @serv_area = 'NM-5' , @new_time_period_id = 16
GO
spLSC_NEW_FUNDING_CYCLE @serv_area = 'MNM' , @new_time_period_id = 16
GO
spLSC_NEW_FUNDING_CYCLE @serv_area = 'NNM-4' , @new_time_period_id = 16
GO
spLSC_NEW_FUNDING_CYCLE @serv_area = 'NY-9' , @new_time_period_id = 16
GO
spLSC_NEW_FUNDING_CYCLE @serv_area = 'MND' , @new_time_period_id = 16
GO
spLSC_NEW_FUNDING_CYCLE @serv_area = 'ND-3' , @new_time_period_id = 16
GO
spLSC_NEW_FUNDING_CYCLE @serv_area = 'NND-3' , @new_time_period_id = 16
GO
spLSC_NEW_FUNDING_CYCLE @serv_area = 'OH-20' , @new_time_period_id = 16
GO
spLSC_NEW_FUNDING_CYCLE @serv_area = 'OH-18' , @new_time_period_id = 16
GO
spLSC_NEW_FUNDING_CYCLE @serv_area = 'OH-21' , @new_time_period_id = 16
GO
spLSC_NEW_FUNDING_CYCLE @serv_area = 'OH-23' , @new_time_period_id = 16
GO
spLSC_NEW_FUNDING_CYCLE @serv_area = 'MOH' , @new_time_period_id = 16
GO
spLSC_NEW_FUNDING_CYCLE @serv_area = 'NOK-1' , @new_time_period_id = 16
GO
spLSC_NEW_FUNDING_CYCLE @serv_area = 'PA-1' , @new_time_period_id = 16
GO
spLSC_NEW_FUNDING_CYCLE @serv_area = 'MPA' , @new_time_period_id = 16
GO
spLSC_NEW_FUNDING_CYCLE @serv_area = 'PA-24' , @new_time_period_id = 16
GO
spLSC_NEW_FUNDING_CYCLE @serv_area = 'PR-2' , @new_time_period_id = 16
GO
spLSC_NEW_FUNDING_CYCLE @serv_area = 'SD-2' , @new_time_period_id = 16
GO
spLSC_NEW_FUNDING_CYCLE @serv_area = 'SD-4' , @new_time_period_id = 16
GO
spLSC_NEW_FUNDING_CYCLE @serv_area = 'MSD' , @new_time_period_id = 16
GO
spLSC_NEW_FUNDING_CYCLE @serv_area = 'NSD-1' , @new_time_period_id = 16
GO
spLSC_NEW_FUNDING_CYCLE @serv_area = 'TN-9' , @new_time_period_id = 16
GO
spLSC_NEW_FUNDING_CYCLE @serv_area = 'TN-4' , @new_time_period_id = 16
GO
spLSC_NEW_FUNDING_CYCLE @serv_area = 'TN-10' , @new_time_period_id = 16
GO
spLSC_NEW_FUNDING_CYCLE @serv_area = 'TN-7' , @new_time_period_id = 16
GO
spLSC_NEW_FUNDING_CYCLE @serv_area = 'MTN' , @new_time_period_id = 16
GO
spLSC_NEW_FUNDING_CYCLE @serv_area = 'TX-14' , @new_time_period_id = 16
GO
spLSC_NEW_FUNDING_CYCLE @serv_area = 'TX-13' , @new_time_period_id = 16
GO
spLSC_NEW_FUNDING_CYCLE @serv_area = 'TX-15' , @new_time_period_id = 16
GO
spLSC_NEW_FUNDING_CYCLE @serv_area = 'MTX' , @new_time_period_id = 16
GO
spLSC_NEW_FUNDING_CYCLE @serv_area = 'NTX-1' , @new_time_period_id = 16
GO
spLSC_NEW_FUNDING_CYCLE @serv_area = 'VA-20' , @new_time_period_id = 16
GO
spLSC_NEW_FUNDING_CYCLE @serv_area = 'VA-18' , @new_time_period_id = 16
GO
spLSC_NEW_FUNDING_CYCLE @serv_area = 'MVA' , @new_time_period_id = 16
GO
spLSC_NEW_FUNDING_CYCLE @serv_area = 'VA-17' , @new_time_period_id = 16
GO
spLSC_NEW_FUNDING_CYCLE @serv_area = 'VA-19' , @new_time_period_id = 16
GO
spLSC_NEW_FUNDING_CYCLE @serv_area = 'WV-5' , @new_time_period_id = 16
GO
spLSC_NEW_FUNDING_CYCLE @serv_area = 'MWV' , @new_time_period_id = 16
GO
spLSC_NEW_FUNDING_CYCLE @serv_area = 'WI-5' , @new_time_period_id = 16
GO
spLSC_NEW_FUNDING_CYCLE @serv_area = 'MWI' , @new_time_period_id = 16
GO
spLSC_NEW_FUNDING_CYCLE @serv_area = 'WY-4' , @new_time_period_id = 16
GO
spLSC_NEW_FUNDING_CYCLE @serv_area = 'MWY' , @new_time_period_id = 16
GO
spLSC_NEW_FUNDING_CYCLE @serv_area = 'NWY-1' , @new_time_period_id = 16