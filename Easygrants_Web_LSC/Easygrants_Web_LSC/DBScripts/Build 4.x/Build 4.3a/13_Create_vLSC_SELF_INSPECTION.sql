/****** Object:  View [dbo].[vLSC_SELF_INSPECTION]    Script Date: 02/17/2009 16:39:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vLSC_SELF_INSPECTION]

AS

SELECT lsi.lsc_self_inspection_id,
	o.legacy_organization_id recipient_id,
	o.organization_name,
	tp.sort_order year,
	lsi.organization_id,
	lsi.time_period_id,
	lsi.cases,
	lsi.exceptions,
	lsi.exclude_pri,
	lsi.exclude_aft,
	lsi.exclude_case,
	lsi.income,
	lsi.assets,
	lsi.citizenship,
	lsi.not_in_file,
	lsi.not_timely,
	lsi.other,
	lsi.other_spec,
	lsi.exec_dir,
	lsi.qcase1,
	lsi.action1,
	lsi.qcase2,
	lsi.action2,
	lsi.qcase3,
	lsi.action3,
	lsi.qcase4,
	lsi.action4,
	lsi.qcase5,
	lsi.action5,
	lsi.qcase6,
	lsi.action6,
	lsi.qcase7,
	lsi.action7,
	lsi.qcase8,
	lsi.action8,
	lsi.qcase9,
	lsi.action9,
	lsi.qcase10,
	lsi.action10,
	lsi.qcase11,
	lsi.action11,
	lsi.qcase12,
	lsi.action12,
	lsi.nlsc_cases,
	lsi.figure,
	lsi.counted,
	lsi.estimated,
	wlsi.wf_task_assignment_id
	FROM LSC_SELF_INSPECTION lsi
		join ORGANIZATION o ON lsi.organization_id = o.organization_id
		join c_TIME_PERIOD tp ON lsi.time_period_id = tp.id
		left join vWFTA_LSC_SELF_INSPECTION wlsi ON lsi.lsc_self_inspection_id = wlsi.lsc_self_inspection_id
