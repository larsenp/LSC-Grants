DECLARE @comp_id INT
	,@fund_id INT
	,@new_id INT

SELECT @comp_id = id
	FROM a_COMPETITION
	WHERE description = 'LA-13'

SELECT @fund_id = fund_id
	FROM a_FUND
	WHERE fund_name = 'LA-13 2014'


EXEC @new_id = getid_sel @table = 'a_WF_PROJECT'
	,@mode = 2

INSERT a_WF_PROJECT
	(id
	,description
	,competition_id
	,support_email_address
	,content_email_address
	,start_date
	,end_date
	,time_period_id
	,auto_generate_payment
	,default_payment_setup
	,auto_generate_report
	,default_report_setup
	,award_term
	,fund_id
	,grantee_default_type_id)
	VALUES
		(@new_id
		,'LA-13 2014'
		,@comp_id
		,'techsupport@lsc.gov'
		,'competition@lsc.gov'
		,'2014-1-1'
		,'2016-12-31'
		,19
		,0
		,0
		,0
		,0
		,3
		,@fund_id
		,1)

SELECT @comp_id = id
	FROM a_COMPETITION
	WHERE description = 'MSX-2'

SELECT @fund_id = fund_id
	FROM a_FUND
	WHERE fund_name = 'MSX-2 2014'


EXEC @new_id = getid_sel @table = 'a_WF_PROJECT'
	,@mode = 2

INSERT a_WF_PROJECT
	(id
	,description
	,competition_id
	,support_email_address
	,content_email_address
	,start_date
	,end_date
	,time_period_id
	,auto_generate_payment
	,default_payment_setup
	,auto_generate_report
	,default_report_setup
	,award_term
	,fund_id
	,grantee_default_type_id)
	VALUES
		(@new_id
		,'MSX-2 2014'
		,@comp_id
		,'techsupport@lsc.gov'
		,'competition@lsc.gov'
		,'2014-1-1'
		,'2016-12-31'
		,19
		,0
		,0
		,0
		,0
		,3
		,@fund_id
		,1)
