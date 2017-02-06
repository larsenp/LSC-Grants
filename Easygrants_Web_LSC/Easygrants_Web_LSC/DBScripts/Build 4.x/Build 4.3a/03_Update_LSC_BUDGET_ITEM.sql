/*
This script was developed to mitigate a problem with data migration in the table LSC_BUDGET_ITEM. Essentially,
it disconnects all table rows that were migrated from the old system by setting their budget_item_id = null.
The old value for budget_item_id is preserved in the new column migration_budget_item_id in case it is ever needed,
but it is expected that these rows will be replaced by new rows added by a migration fix. See Mantis task #1064 for details.
*/

ALTER TABLE LSC_BUDGET_ITEM
    ADD migration_budget_item_id int

GO

UPDATE LSC_BUDGET_ITEM
    SET migration_budget_item_id = budget_item_id

GO

UPDATE lbi
    SET budget_item_id = null
    FROM LSC_BUDGET_ITEM lbi
        JOIN [LSC-EGDEV].EG_Migration_Stage_Grantee_Reports.dbo.LSC_BUDGET_ITEM mig ON lbi.lsc_budget_item_id = mig.lsc_budget_item_id

GO
/*
After running the scripts above, users entering revenue or expense forms for the first time experienced out-of-memory
errors when the code attempted to retrieve a related LscBudgetItem data object from a new BudgetItem data object.
The situation was remedied by substituting a -1 for the null value.
*/

update LSC_BUDGET_ITEM
	set budget_item_id = -1
	WHERE budget_item_id is null