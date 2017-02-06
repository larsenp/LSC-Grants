DECLARE @new_id INT

EXEC @new_id = getid_sel @table = 'LSC_a_PRO_BONO_SUBCATEGORY'
INSERT LSC_a_PRO_BONO_SUBCATEGORY
	(id
	,lsc_pro_bono_category_id 
	,abbr
	,description 
	,max_score 
	,sort_order 
	,weighting )
	VALUES(@new_id
		,4
		,'Need Statement'
		,'The need statement should provide a description of the client needs and gaps in service that this project seeks to address.  Please also provide a statement that sets forth the challenge or inefficiency in the pro bono system that will be the focus of this project.'
		,3
		,1
		,10)

EXEC @new_id = getid_sel @table = 'LSC_a_PRO_BONO_SUBCATEGORY'
INSERT LSC_a_PRO_BONO_SUBCATEGORY
	(id
	,lsc_pro_bono_category_id 
	,abbr
	,description 
	,max_score 
	,sort_order 
	,weighting )
	VALUES(@new_id
		,4
		,'Role of Pro Bono Volunteers'
		,'Applicants should provide an analysis of the pro bono capacity of the private bar and legal community in your area and, the volunteers you seek to target and recruit in your Pro Bono Innovation Project, and detail the role of the volunteers in your project.'
		,3
		,2
		,15)

EXEC @new_id = getid_sel @table = 'LSC_a_PRO_BONO_SUBCATEGORY'
INSERT LSC_a_PRO_BONO_SUBCATEGORY
	(id
	,lsc_pro_bono_category_id 
	,abbr
	,description 
	,max_score 
	,sort_order 
	,weighting )
	VALUES(@new_id
		,4
		,'Goals, Objectives, and Activities'
		,'Applicant should describe the project goals and objectives and the specific project activities that are designed to meet gaps in service and engage more pro bono volunteers to meet the identified client needs. In addition to the response in the Narrative, reviewers should consider the role of any contracts and subgrants when scoring this section.'
		,3
		,3
		,10)

EXEC @new_id = getid_sel @table = 'LSC_a_PRO_BONO_SUBCATEGORY'
INSERT LSC_a_PRO_BONO_SUBCATEGORY
	(id
	,lsc_pro_bono_category_id 
	,abbr
	,description 
	,max_score 
	,sort_order 
	,weighting )
	VALUES(@new_id
		,4
		,'Innovation(s) Proposed and Potential for Replication'
		,'Applicants should describe the innovative and replicable strategies that the project will employ.'
		,3
		,4
		,15)

EXEC @new_id = getid_sel @table = 'LSC_a_PRO_BONO_SUBCATEGORY'
INSERT LSC_a_PRO_BONO_SUBCATEGORY
	(id
	,lsc_pro_bono_category_id 
	,abbr
	,description 
	,max_score 
	,sort_order 
	,weighting )
	VALUES(@new_id
		,4
		,'Proposed Performance Measures'
		,'Applicants should identify specific, measurable outcomes that the project proposes to accomplish in the proposed timeframe.'
		,3
		,5
		,10)

EXEC @new_id = getid_sel @table = 'LSC_a_PRO_BONO_SUBCATEGORY'
INSERT LSC_a_PRO_BONO_SUBCATEGORY
	(id
	,lsc_pro_bono_category_id 
	,abbr
	,description 
	,max_score 
	,sort_order 
	,weighting )
	VALUES(@new_id
		,5
		,'Track Record on Pro Bono and Collaborative Efforts'
		,'Applicant should provide an  overview of Applicant’s success in collaborative and pro bono efforts, including specific and recent examples indicating the dates/years the partnerships and collaborations were in effect.'
		,3
		,1
		,5)

EXEC @new_id = getid_sel @table = 'LSC_a_PRO_BONO_SUBCATEGORY'
INSERT LSC_a_PRO_BONO_SUBCATEGORY
	(id
	,lsc_pro_bono_category_id 
	,abbr
	,description 
	,max_score 
	,sort_order 
	,weighting )
	VALUES(@new_id
		,5
		,'Ability to Provide Project Support, Oversight, and Capable Leadership'
		,'Applicant should describe their capacity to set and implement goals and provide programmatic and financial oversight of this project.   The response should include relevant information about the key staff who will be responsible for the project. In addition to the relevant section of the Narrative, reviewers should consider resumes of key staff when scoring this section.'
		,3
		,2
		,10)

EXEC @new_id = getid_sel @table = 'LSC_a_PRO_BONO_SUBCATEGORY'
INSERT LSC_a_PRO_BONO_SUBCATEGORY
	(id
	,lsc_pro_bono_category_id 
	,abbr
	,description 
	,max_score 
	,sort_order 
	,weighting )
	VALUES(@new_id
		,5
		,'Plans and Potential to Sustain the Project Beyond the Grant Period'
		,'Applicant should describe their strategy to sustain the proposed project beyond the grant period. The response should include information on current or future partners and funders and the Applicant’s plans to adapt its operations and staffing to support the project after the grant period.'
		,3
		,3
		,10)

EXEC @new_id = getid_sel @table = 'LSC_a_PRO_BONO_SUBCATEGORY'
INSERT LSC_a_PRO_BONO_SUBCATEGORY
	(id
	,lsc_pro_bono_category_id 
	,abbr
	,description 
	,max_score 
	,sort_order 
	,weighting )
	VALUES(@new_id
		,6
		,'Budget Justification'
		,' Applicant should provide  a brief statement to supplement the Budget Form and detailed Project Budget that describes how the project budget, including other sources of support, will advance the desired goals, objectives, and activities being proposed. In addition to the relevant section of the Narrative, reviewers should consider the Budget Form and the uploaded, detailed Project Budget, Contracts, and Subgrant Forms when scoring this section.'
		,3
		,1
		,15)
