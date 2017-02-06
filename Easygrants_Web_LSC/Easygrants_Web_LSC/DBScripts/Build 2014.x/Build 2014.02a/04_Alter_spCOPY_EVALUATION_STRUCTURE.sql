/****** Object:  StoredProcedure [dbo].[spCOPY_EVALUATION_STRUCTURE]    Script Date: 03/07/2014 13:57:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[spCOPY_EVALUATION_STRUCTURE]
	(@old_time_period_id int, 
	@new_time_period_id int)

AS

CREATE TABLE #pa
	(ident int identity(0,1),
	old_id int ,
	new_id int,
	time_period_id int ,
	abbr varchar(20) ,
	description varchar(max) ,
	sort_order int )

INSERT #pa
	(old_id ,
	time_period_id ,
	abbr  ,
	description ,
	sort_order )
	SELECT id ,
		@new_time_period_id,
		abbr,
		description,
		sort_order
		FROM LSC_a_REVIEW_PERFORMANCE_AREA
	WHERE time_period_id = @old_time_period_id
		AND end_date IS NULL

CREATE TABLE #cat(
	ident int identity(0, 1),
	old_id int,
	new_id int,
	old_pa_id int,
	new_pa_id int,
	abbr varchar(20),
	description varchar(100),
	sort_order int)

INSERT #cat
	(old_id,
	old_pa_id,
	abbr,
	description,
	sort_order)
	SELECT rcat.id,
		rcat.lsc_review_performance_area_id,
		rcat.abbr,
		rcat.description,
		rcat.sort_order
		FROM LSC_a_REVIEW_CATEGORY rcat
			JOIN #pa ON rcat.lsc_review_performance_area_id = #pa.old_id
		WHERE rcat.end_date IS NULL

CREATE TABLE #c(
	ident int identity(0, 1),
	old_id int,
	new_id int,
	old_cat_id int,
	new_cat_id int,
	abbr varchar(20),
	description varchar(100),
	weighting int,
	sort_order int)

INSERT #c
	(old_id ,
	old_cat_id ,
	abbr ,
	description ,
	weighting ,
	sort_order)
	SELECT rc.id,
		rc.lsc_review_category_id,
		rc.abbr,
		rc.description,
		rc.weighting,
		rc.sort_order
		FROM LSC_a_REVIEW_CRITERION rc
			JOIN #cat ON rc.lsc_review_category_id = #cat.old_id
		WHERE rc.end_date IS NULL

CREATE TABLE #q(
	ident int identity(0,1),
	old_id int,
	new_id int,
	old_c_id int,
	new_c_id int,
	abbr varchar(20),
	description varchar(1000),
	sort_order int,
	new_applicants_only bit,
	existing_applicants_only bit,
	form_page_key varchar(50),
	base_inquiry_id int)

INSERT #q(
	old_id ,
	old_c_id ,
	abbr ,
	description ,
	sort_order,
	new_applicants_only,
	existing_applicants_only,
	form_page_key,
	base_inquiry_id)
	SELECT q.id,
		q.lsc_review_criterion_id,
		q.abbr,
		q.description,
		q.sort_order,
		q.new_applicants_only,
		q.existing_applicants_only,
		q.form_page_key,
		q.base_inquiry_id
		FROM LSC_a_REVIEW_INQUIRY q
			JOIN #c ON q.lsc_review_criterion_id = #c.old_id
		WHERE q.end_date IS NULL

CREATE TABLE #s(
	ident int identity(0, 1),
	old_id int,
	new_id int,
	old_q_id int,
	new_q_id int,
	abbr varchar(20),
	description varchar(max),
	sort_order int)

INSERT #s(
	old_id,
	old_q_id,
	abbr,
	description,
	sort_order)
	SELECT s.id,
	s.lsc_review_inquiry_id,
	s.abbr,
	s.description,
	s.sort_order
		FROM LSC_a_REVIEW_SUBTOPIC s
			JOIN #q ON s.lsc_review_inquiry_id = #q.old_id
		WHERE s.end_date IS NULL

CREATE TABLE #e(
	ident int identity(0,1),
	old_id int,
	new_id int,
	old_q_id int,
	new_q_id int,
	old_s_id int,
	new_s_id int,
	lsc_review_element_type_id int,
	sort_order int,
	description varchar(max))

--Insert elements related to subtopics
INSERT #e
	(old_id ,
	old_q_id ,
	old_s_id ,
	lsc_review_element_type_id ,
	sort_order ,
	description)
	SELECT e.id,
		e.lsc_review_inquiry_id,
		e.lsc_review_subtopic_id,
		e.lsc_review_element_type_id,
		e.sort_order,
		e.description
		FROM LSC_a_REVIEW_ELEMENT e
			JOIN #s ON e.lsc_review_subtopic_id = #s.old_id
		WHERE e.end_date IS NULL

--Insert elements related to inquiries
INSERT #e
	(old_id ,
	old_q_id ,
	old_s_id ,
	lsc_review_element_type_id ,
	sort_order ,
	description)
	SELECT e.id,
		e.lsc_review_inquiry_id,
		e.lsc_review_subtopic_id,
		e.lsc_review_element_type_id,
		e.sort_order,
		e.description
		FROM LSC_a_REVIEW_ELEMENT e
			JOIN #q ON e.lsc_review_inquiry_id = #q.old_id
		WHERE e.end_date IS NULL
			AND e.lsc_review_subtopic_id IS NULL

BEGIN TRY
	BEGIN TRAN


		EXEC spUPDATE_IDGEN @select = 0

		--Set new_id values for all temp tables. These will be used as primary key values when inserting into the database.
		DECLARE @rowcount int, @first_new_id int

		SELECT @rowcount = count(*) FROM #pa

		EXEC @first_new_id = spGETID_RANGE_SEL @table = 'LSC_a_REVIEW_PERFORMANCE_AREA', @count = @rowcount, @mode = 2

		UPDATE #pa
			SET new_id = ident + @first_new_id

		SELECT @rowcount = count(*) FROM #cat

		EXEC @first_new_id = spGETID_RANGE_SEL @table = 'LSC_a_REVIEW_CATEGORY', @count = @rowcount, @mode = 2

		UPDATE #cat
			SET new_id = ident + @first_new_id

		SELECT @rowcount = count(*) FROM #c

		EXEC @first_new_id = spGETID_RANGE_SEL @table = 'LSC_a_REVIEW_CRITERION', @count = @rowcount, @mode = 2

		UPDATE #c
			SET new_id = ident + @first_new_id

		SELECT @rowcount = count(*) FROM #q

		EXEC @first_new_id = spGETID_RANGE_SEL @table = 'LSC_a_REVIEW_INQUIRY', @count = @rowcount, @mode = 2

		UPDATE #q
			SET new_id = ident + @first_new_id

		SELECT @rowcount = count(*) FROM #s

		EXEC @first_new_id = spGETID_RANGE_SEL @table = 'LSC_a_REVIEW_SUBTOPIC', @count = @rowcount, @mode = 2

		UPDATE #s
			SET new_id = ident + @first_new_id

		SELECT @rowcount = count(*) FROM #e

		EXEC @first_new_id = spGETID_RANGE_SEL @table = 'LSC_a_REVIEW_ELEMENT', @count = @rowcount, @mode = 2

		UPDATE #e
			SET new_id = ident + @first_new_id

		--Set foreign key IDs
		UPDATE #cat
			SET new_pa_id = #pa.new_id
			FROM #cat
				JOIN #pa ON #cat.old_pa_id = #pa.old_id

		UPDATE #c
			SET new_cat_id = #cat.new_id
			FROM #c
				JOIN #cat ON #c.old_cat_id = #cat.old_id

		UPDATE #q
			SET new_c_id = #c.new_id
			FROM #q
				JOIN #c ON #q.old_c_id = #c.old_id

		UPDATE #s
			SET new_q_id = #q.new_id
			FROM #s
				JOIN #q ON #s.old_q_id = #q.old_id

		UPDATE #e
			SET new_s_id = #s.new_id
			FROM #e
				JOIN #s ON #e.old_s_id = #s.old_id

		UPDATE #e
			SET new_q_id = #q.new_id
			FROM #e
				JOIN #q ON #e.old_q_id = #q.old_id

		--Delete existing data, if any
		IF EXISTS(SELECT id FROM LSC_a_REVIEW_PERFORMANCE_AREA WHERE time_period_id = @new_time_period_id)
		BEGIN

			DELETE LSC_a_REVIEW_ELEMENT
				FROM LSC_a_REVIEW_ELEMENT e
					JOIN LSC_a_REVIEW_SUBTOPIC s ON e.lsc_review_subtopic_id = s.id
					JOIN LSC_a_REVIEW_INQUIRY i ON s.lsc_review_inquiry_id = i.id
					JOIN LSC_a_REVIEW_CRITERION c ON i.lsc_review_criterion_id = c.id
					JOIN LSC_a_REVIEW_CATEGORY cat ON c.lsc_review_category_id = cat.id
					JOIN LSC_a_REVIEW_PERFORMANCE_AREA pa ON cat.lsc_review_performance_area_id = pa.id
				WHERE pa.time_period_id = @new_time_period_id

			DELETE LSC_a_REVIEW_ELEMENT
				FROM LSC_a_REVIEW_ELEMENT e
					JOIN LSC_a_REVIEW_INQUIRY i ON e.lsc_review_inquiry_id = i.id
					JOIN LSC_a_REVIEW_CRITERION c ON i.lsc_review_criterion_id = c.id
					JOIN LSC_a_REVIEW_CATEGORY cat ON c.lsc_review_category_id = cat.id
					JOIN LSC_a_REVIEW_PERFORMANCE_AREA pa ON cat.lsc_review_performance_area_id = pa.id
				WHERE pa.time_period_id = @new_time_period_id

			DELETE LSC_a_REVIEW_SUBTOPIC
				FROM LSC_a_REVIEW_SUBTOPIC s
					JOIN LSC_a_REVIEW_INQUIRY i ON s.lsc_review_inquiry_id = i.id
					JOIN LSC_a_REVIEW_CRITERION c ON i.lsc_review_criterion_id = c.id
					JOIN LSC_a_REVIEW_CATEGORY cat ON c.lsc_review_category_id = cat.id
					JOIN LSC_a_REVIEW_PERFORMANCE_AREA pa ON cat.lsc_review_performance_area_id = pa.id
				WHERE pa.time_period_id = @new_time_period_id

			DELETE LSC_a_REVIEW_INQUIRY
				FROM LSC_a_REVIEW_INQUIRY i
					JOIN LSC_a_REVIEW_CRITERION c ON i.lsc_review_criterion_id = c.id
					JOIN LSC_a_REVIEW_CATEGORY cat ON c.lsc_review_category_id = cat.id
					JOIN LSC_a_REVIEW_PERFORMANCE_AREA pa ON cat.lsc_review_performance_area_id = pa.id
				WHERE pa.time_period_id = @new_time_period_id

			DELETE LSC_a_REVIEW_CRITERION
				FROM LSC_a_REVIEW_CRITERION c 
					JOIN LSC_a_REVIEW_CATEGORY cat ON c.lsc_review_category_id = cat.id
					JOIN LSC_a_REVIEW_PERFORMANCE_AREA pa ON cat.lsc_review_performance_area_id = pa.id
				WHERE pa.time_period_id = @new_time_period_id

			DELETE LSC_a_REVIEW_CATEGORY
				FROM LSC_a_REVIEW_CATEGORY cat
					JOIN LSC_a_REVIEW_PERFORMANCE_AREA pa ON cat.lsc_review_performance_area_id = pa.id
				WHERE pa.time_period_id = @new_time_period_id

			DELETE LSC_a_REVIEW_PERFORMANCE_AREA
				FROM LSC_a_REVIEW_PERFORMANCE_AREA 
				WHERE time_period_id = @new_time_period_id

		END --IF EXISTS(SELECT id FROM LSC_a_REVIEW_PERFORMANCE_AREA WHERE time_period_id = @new_time_period_id)

		INSERT LSC_a_REVIEW_PERFORMANCE_AREA
			(id,
			time_period_id,
			abbr,
			description,
			sort_order)
			SELECT new_id,
				time_period_id,
				abbr,
				description,
				sort_order
				FROM #pa

		INSERT LSC_a_REVIEW_CATEGORY
			(id,
			lsc_review_performance_area_id,
			abbr,
			description,
			sort_order)
			SELECT new_id,
				new_pa_id,
				abbr,
				description,
				sort_order
				FROM #cat

		INSERT LSC_a_REVIEW_CRITERION
			(id,
			lsc_review_category_id,
			abbr,
			description,
			weighting,
			sort_order)
			SELECT new_id,
				new_cat_id,
				abbr,
				description,
				weighting,
				sort_order
				FROM #c

		INSERT LSC_a_REVIEW_INQUIRY
			(id,
			lsc_review_criterion_id,
			abbr,
			description,
			sort_order,
			new_applicants_only,
			existing_applicants_only,
			form_page_key,
			base_inquiry_id)
			SELECT new_id,
				new_c_id,
				abbr,
				description,
				sort_order,
				new_applicants_only,
				existing_applicants_only,
				form_page_key,
				base_inquiry_id
				FROM #q

		INSERT LSC_a_REVIEW_SUBTOPIC
			(id,
			lsc_review_inquiry_id,
			abbr,
			description,
			sort_order)
			SELECT new_id,
				new_q_id,
				abbr,
				description,
				sort_order
				FROM #s

		INSERT LSC_a_REVIEW_ELEMENT
			(id,
			lsc_review_inquiry_id,
			lsc_review_subtopic_id,
			lsc_review_element_type_id,
			sort_order,
			description)
			SELECT new_id,
				new_q_id,
				new_s_id,
				lsc_review_element_type_id,
				sort_order,
				description
				FROM #e

	COMMIT TRAN
END TRY
BEGIN CATCH
	SELECT 'Rolling back transaction' as [status],
		'spCOPY_EVALUATION_STRUCTURE' as [Error in procedure], 
		ERROR_NUMBER() as ErrorNumber,
		ERROR_MESSAGE() as ErrorMessage;
	ROLLBACK TRAN
	RETURN
END CATCH
