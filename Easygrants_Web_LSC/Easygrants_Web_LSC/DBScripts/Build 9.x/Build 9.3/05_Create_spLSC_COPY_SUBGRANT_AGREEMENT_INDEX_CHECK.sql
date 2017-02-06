CREATE PROCEDURE spLSC_COPY_SUBGRANT_AGREEMENT_INDEX_CHECK
	(@source_wfta_id INT,
	@target_wfta_id INT)

AS

DECLARE @count INT

SELECT @count = count(*) FROM LSC_SUBGRANT_AGREEMENT_INDEX
	WHERE wf_task_assignment_id = @target_wfta_id

IF @count = 0
	EXEC spLSC_COPY_SUBGRANT_AGREEMENT_INDEX
		@source_wfta_id = @source_wfta_id,
		@target_wfta_id = @target_wfta_id
