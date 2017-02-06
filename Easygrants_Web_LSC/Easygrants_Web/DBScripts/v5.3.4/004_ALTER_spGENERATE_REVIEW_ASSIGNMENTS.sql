
/*
Developer		: 	Harish Avula
Date			:	11/19/2009
Modification	:	0007808: Priority: HIGH - generic bulk assignment error 
*/


set ANSI_NULLS ON
set QUOTED_IDENTIFIER ON
GO
ALTER     PROCEDURE [dbo].[spGENERATE_REVIEW_ASSIGNMENTS]
(
	@review_cycle_stage_id INT,
	@wf_task_role_id INT = 7
)
AS

SET NOCOUNT ON

DECLARE @review_cycle_id INT,
		@rev_task_id INT,
		@task_id INT,
		@project_id INT,
		@outcome_id INT,
		@wfta_id INT,
		@grantee_project_id INT,
		@app_person_id INT,
		@rev_person_id INT,
		@rev_committee_id INT,
		@ReturnCode INT,
		@table VARCHAR(100),
		@id INT,
		@NewID INT,
		@mode INT,
		@count INT,
		@num_reviewers_per_applicant INT,
		@check_conflict INT,
		@rev_count INT,
		@counter INT,
		@request_conflict_wf_task_id INT,
		@ReqConID INT,
		@assignment_ordinal TINYINT,
		@cnt INT,
		@PrimaryAssignment TINYINT

/*
DECLARE	@CurrentDataCommand INT
--SET the data command status to in process
SELECT	@CurrentDataCommand = MAX(DATA_COMMAND_REQUEST_ID) 
FROM	DATA_COMMAND_REQUEST

UPDATE	DATA_COMMAND_REQUEST 
SET	status = 1 
WHERE	DATA_COMMAND_REQUEST_ID = @CurrentDataCommand
*/

SELECT	@review_cycle_id = review_cycle_id, 
		@rev_task_id = task_id, 
		@num_reviewers_per_applicant = num_reviewers_per_applicant, 
		@check_conflict = check_conflict
FROM	review_cycle_stage
WHERE	review_cycle_stage_id = @review_cycle_stage_id

SELECT	@rev_count = count(*)
FROM	review_cycle_committee  rcc
	join review_committee_member rcm ON rcc.review_committee_id = rcm.review_committee_id
WHERE	rcc.review_cycle_id = @review_cycle_id


CREATE TABLE #reviewers
(
	pk_rev_id INT identity, 
	person_id INT, 
	rev_committee_id INT, 
	number_assigned INT,
	number_primary INT
)

DECLARE reviewers CURSOR FORWARD_ONLY FOR 
	SELECT DISTINCT rcm.person_id,
			rcc.review_committee_id
	FROM	review_cycle_committee  rcc
		join review_committee_member rcm ON rcc.review_committee_id = rcm.review_committee_id
	WHERE	rcc.review_cycle_id = @review_cycle_id
OPEN reviewers
FETCH NEXT FROM reviewers 
INTO @rev_person_id, @rev_committee_id

WHILE @@fetch_status=0
BEGIN
	SELECT	@count = COUNT(*)
	FROM	#reviewers
	WHERE	person_id = @rev_person_id

	IF @count = 0
	BEGIN
		INSERT INTO #reviewers(person_id, rev_committee_id, number_assigned, number_primary)
		VALUES(@rev_person_id, @rev_committee_id, 0, 0)
	END

	FETCH NEXT FROM reviewers 
	INTO @rev_person_id, @rev_committee_id
END

CLOSE reviewers
DEALLOCATE reviewers


--delete previous assignments for this review cycle stage
DELETE FROM WF_TASK_ASSIGNMENT_REVIEW 
WHERE wf_task_assignment_id IN (
	SELECT	wf_task_assignment_id 
	FROM	WF_TASK_ASSIGNMENT
	WHERE wf_task_id = @rev_task_id 
		AND review_cycle_stage_id = @review_cycle_stage_id
	)

DELETE FROM WF_TASK_ASSIGNMENT 
WHERE wf_task_id = @rev_task_id 
	AND review_cycle_stage_id = @review_cycle_stage_id

-- Delete from GRANTEE_PROJECT_REVIEW_STAGE
DELETE FROM GRANTEE_PROJECT_REVIEW_STAGE 
WHERE review_cycle_stage_id = @review_cycle_stage_id


DECLARE criteria CURSOR FORWARD_ONLY FOR 
	SELECT DISTINCT
			task_id, 
			project_id, 
			task_outcome_id
	FROM	review_cycle_project_task_outcome
	WHERE	review_cycle_id = @review_cycle_id

OPEN criteria
FETCH NEXT FROM criteria INTO @task_id, @project_id, @outcome_id

WHILE @@FETCH_STATUS=0
BEGIN
	DECLARE app CURSOR FORWARD_ONLY FOR 
		SELECT DISTINCT
				wfta.person_id, 
				wfta.wf_task_assignment_id, 
				wfta.grantee_project_id
		FROM wf_task_assignment wfta
			JOIN grantee_project gp ON wfta.grantee_project_id = gp.grantee_project_id
			JOIN grantee_project_outcomes gpo on gp.grantee_project_id = gpo.grantee_project_id AND wfta.wf_task_id = gpo.wf_task_id
			JOIN a_WF_TASK wt ON wt.id = wfta.wf_task_id
		WHERE	wfta.wf_task_role_id = 1 
			AND wfta.wf_task_status_id = 2 
			AND gp.wf_project_id = @project_id 
			AND gpo.wf_task_id = @task_id
			AND gpo.outcome_id = @outcome_id 
--			AND wt.wf_task_type_id = 1
		ORDER BY wfta.person_id

	OPEN app
	FETCH NEXT FROM app INTO @app_person_id, @wfta_id, @grantee_project_id
	
	WHILE @@fetch_status=0
	BEGIN
		SET @counter = 0
		SET	@assignment_ordinal = 1
		SET @PrimaryAssignment = 0

		IF @check_conflict = 1
			DECLARE rev CURSOR FORWARD_ONLY FOR 
				SELECT	revs.rev_committee_id, 
						revs.person_id,
						rc.request_conflict_id
				FROM	#reviewers  revs
				JOIN person p ON revs.person_id = p.person_id
				JOIN review_cycle_conflict rc ON rc.rev_person_id = revs.person_id 
					AND rc.app_person_id = @app_person_id
					AND	rc.review_cycle_id = @review_cycle_id
				WHERE	p.is_reviewer = 1
					AND rc.request_conflict_id <> 4 --avoid conflicts
				ORDER BY	revs.number_assigned,
							rc.request_conflict_id DESC,
							revs.number_primary
		ELSE
			DECLARE rev CURSOR FORWARD_ONLY FOR 
				SELECT	revs.rev_committee_id, 
						revs.person_id,
						0
				FROM	#reviewers  revs
				JOIN person p ON revs.person_id = p.person_id
				WHERE	p.is_reviewer = 1
				ORDER BY	revs.number_assigned,
							revs.number_primary

		OPEN rev
		FETCH NEXT FROM rev 
		INTO @rev_committee_id, @rev_person_id, @ReqConID

		WHILE @@fetch_status=0
		BEGIN
			IF @num_reviewers_per_applicant = -1
			BEGIN
				EXEC @ReturnCode = getid_sel @table = 'WF_TASK_ASSIGNMENT', @id = @NewID OUTPUT, @mode = 2
				INSERT INTO wf_task_assignment (wf_task_assignment_id, wf_task_id, wf_task_status_id, grantee_project_id, person_id, wf_task_role_id, review_cycle_stage_id, review_committee_id, review_assignment_type_id, review_preference_type_id, create_date)
					VALUES (@NewID, @rev_task_id,  1, @grantee_project_id, @rev_person_id, @wf_task_role_id, @review_cycle_stage_id, @rev_committee_id, @assignment_ordinal, @ReqConID, getdate())

				IF @counter = 0
				BEGIN
					EXEC @ReturnCode = getid_sel @table = 'GRANTEE_PROJECT_REVIEW_STAGE', @id = @NewID OUTPUT, @mode = 2			
					INSERT grantee_project_review_stage (id, grantee_project_id, review_cycle_stage_id, review_committee_id, app_wf_task_assignment_id)
						VALUES (@NewID, @grantee_project_id, @review_cycle_stage_id, @rev_committee_id, @wfta_id)
				END
				SET @counter = @counter + 1

				IF @assignment_ordinal = 1
				BEGIN
					SET	@assignment_ordinal = 2
					SET @PrimaryAssignment = 1
				END
				ELSE
				BEGIN
					SET @PrimaryAssignment = 0
				END

				UPDATE	#reviewers 
				SET		number_assigned = number_assigned + 1,
						number_primary = number_primary + @PrimaryAssignment
				WHERE	person_id = @rev_person_id
			END
			ELSE
			BEGIN
				IF @counter < @num_reviewers_per_applicant
				BEGIN
					SELECT	@count = count(*) 
					FROM	#reviewers 
					WHERE	person_id = @rev_person_id
						AND	number_assigned > 0

					IF @count = 0 OR @ReqConID = 1
					BEGIN
						SELECT	@cnt = COUNT(*)
						FROM	wf_task_assignment
						WHERE	wf_task_id = @rev_task_id
							AND	grantee_project_id = @grantee_project_id
							AND	person_id = @rev_person_id
							AND	wf_task_role_id = @wf_task_role_id
							AND	review_cycle_stage_id = @review_cycle_stage_id

						IF @cnt = 0
						BEGIN
							EXEC @ReturnCode = getid_sel @table = 'WF_TASK_ASSIGNMENT', @id = @NewID OUTPUT, @mode = 2
							INSERT INTO wf_task_assignment (wf_task_assignment_id, wf_task_id, wf_task_status_id, grantee_project_id, person_id, wf_task_role_id, review_cycle_stage_id, review_committee_id, review_assignment_type_id, review_preference_type_id, create_date)
								VALUES (@NewID, @rev_task_id,  1, @grantee_project_id, @rev_person_id, @wf_task_role_id, @review_cycle_stage_id, @rev_committee_id, @assignment_ordinal, @ReqConID, getdate())
	
							IF @counter = 0
							BEGIN
								EXEC @ReturnCode = getid_sel @table = 'GRANTEE_PROJECT_REVIEW_STAGE', @id = @NewID OUTPUT, @mode = 2			
								INSERT grantee_project_review_stage (id, grantee_project_id, review_cycle_stage_id, review_committee_id, app_wf_task_assignment_id)
									VALUES (@NewID, @grantee_project_id, @review_cycle_stage_id, @rev_committee_id, @wfta_id)
							END
							SET @counter = @counter + 1
							
							IF @assignment_ordinal = 1
							BEGIN
								SET	@assignment_ordinal = 2
								SET @PrimaryAssignment = 1
							END
							ELSE
							BEGIN
								SET @PrimaryAssignment = 0
							END

							UPDATE	#reviewers 
							SET		number_assigned = number_assigned + 1,
									number_primary = number_primary + @PrimaryAssignment
							WHERE	person_id = @rev_person_id
						END
					END
				END
				ELSE
					BREAK
			END

			SELECT	@cnt = count(*) 
			FROM	#reviewers
			WHERE	number_assigned >= 1

			IF @cnt >= @rev_count
			BEGIN
				UPDATE	#reviewers 
				SET		number_assigned = number_assigned - 1
			END

			FETCH NEXT FROM rev 
			INTO @rev_committee_id, @rev_person_id, @ReqConID
		END
		CLOSE rev
		DEALLOCATE rev

		--still need to assign reviewer(s) to this applicant
		IF @num_reviewers_per_applicant <> -1 AND @counter < @num_reviewers_per_applicant
		BEGIN
			IF @check_conflict = 1
				DECLARE rev2 CURSOR FORWARD_ONLY FOR 
					SELECT	revs.rev_committee_id, 
							revs.person_id,
							rc.request_conflict_id
					FROM	#reviewers  revs
					JOIN person p ON revs.person_id = p.person_id
					JOIN review_cycle_conflict rc ON rc.rev_person_id = revs.person_id 
						AND rc.app_person_id = @app_person_id
						AND	rc.review_cycle_id = @review_cycle_id
					WHERE	p.is_reviewer = 1
						AND rc.request_conflict_id <> 4 --avoid conflicts
					ORDER BY	revs.number_assigned,
								rc.request_conflict_id DESC,
								revs.number_primary
			ELSE
				DECLARE rev2 CURSOR FORWARD_ONLY FOR 
					SELECT	revs.rev_committee_id, 
							revs.person_id,
							0
					FROM	#reviewers  revs
					JOIN person p ON revs.person_id = p.person_id
					WHERE	p.is_reviewer = 1
					ORDER BY	revs.number_assigned,
								revs.number_primary
			
			OPEN rev2
			FETCH NEXT FROM rev2
			INTO @rev_committee_id, @rev_person_id, @ReqConID
	
			WHILE @@fetch_status=0
			BEGIN
				IF @counter < @num_reviewers_per_applicant
				BEGIN
					SELECT	@cnt = COUNT(*)
					FROM	wf_task_assignment
					WHERE	wf_task_id = @rev_task_id
						AND	grantee_project_id = @grantee_project_id
						AND	person_id = @rev_person_id
						AND	wf_task_role_id = @wf_task_role_id
						AND	review_cycle_stage_id = @review_cycle_stage_id

					IF @cnt = 0
					BEGIN
						EXEC @ReturnCode = getid_sel @table = 'WF_TASK_ASSIGNMENT', @id = @NewID OUTPUT, @mode = 2
						INSERT INTO wf_task_assignment (wf_task_assignment_id, wf_task_id, wf_task_status_id, grantee_project_id, person_id, wf_task_role_id, review_cycle_stage_id, review_committee_id, review_assignment_type_id, review_preference_type_id, create_date)
							VALUES (@NewID, @rev_task_id,  1, @grantee_project_id, @rev_person_id, @wf_task_role_id, @review_cycle_stage_id, @rev_committee_id, @assignment_ordinal, @ReqConID, getdate())
	
						IF @counter = 0
						BEGIN
							EXEC @ReturnCode = getid_sel @table = 'GRANTEE_PROJECT_REVIEW_STAGE', @id = @NewID OUTPUT, @mode = 2			
							INSERT grantee_project_review_stage (id, grantee_project_id, review_cycle_stage_id, review_committee_id, app_wf_task_assignment_id)
								VALUES (@NewID, @grantee_project_id, @review_cycle_stage_id, @rev_committee_id, @wfta_id)
						END
						SET @counter = @counter + 1

						IF @assignment_ordinal = 1
						BEGIN
							SET	@assignment_ordinal = 2
							SET @PrimaryAssignment = 1
						END
						ELSE
						BEGIN
							SET @PrimaryAssignment = 0
						END

						SELECT	@count = count(*) 
						FROM	#reviewers 
						WHERE	person_id = @rev_person_id
	
						UPDATE	#reviewers 
						SET		number_assigned = number_assigned + 1,
								number_primary = number_primary + @PrimaryAssignment
						WHERE	person_id = @rev_person_id
					END
				END
				ELSE
					BREAK

				SELECT	@cnt = count(*) 
				FROM	#reviewers
				WHERE	number_assigned >= 1

				IF @cnt >= @rev_count
				BEGIN
					UPDATE	#reviewers 
					SET		number_assigned = number_assigned - 1
				END

				FETCH NEXT FROM rev2
				INTO @rev_committee_id, @rev_person_id, @ReqConID
			END
			CLOSE rev2
			DEALLOCATE rev2
		END

		FETCH NEXT FROM app INTO @app_person_id, @wfta_id, @grantee_project_id
	END
	CLOSE app
	DEALLOCATE app

	FETCH NEXT FROM criteria INTO @task_id, @project_id, @outcome_id
END
CLOSE criteria
DEALLOCATE criteria

SET NOCOUNT OFF



GO

