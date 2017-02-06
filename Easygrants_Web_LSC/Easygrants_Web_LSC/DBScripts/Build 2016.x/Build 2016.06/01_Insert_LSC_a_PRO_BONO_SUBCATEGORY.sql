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
		,7
		,'Needs Statement'
		,'The need statement should provide a description of the client needs and gaps in service that this project seeks to address and why it is a strategic priority for the organization to address it. It should also have a statement that sets forth the challenge or inefficiency in the pro bono system that will be the focus of this project.'
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
		,7
		,'Project Description Including Goals, Objective, and Project Activities'
		,'Applicants should clearly state the project’s high-level goals and objectives, then provide a complete description of the project and the project activities that are designed to address the issues identified in the Needs Statement and goals of the Pro Bono Innovation Fund. The response should also provide a detailed description of the targeted volunteers and their role and activities in the project.'
		,3
		,2
		,20)

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
		,7
		,'Capacity, Interest, and Recruitment of the Pro Bono Volunteer'
		,'Applicant should provide a description and analysis of (A) the pro bono capacity, including the size and makeup, of the private bar and legal community in the area, (B) clear evidence of volunteer interest or demand for the project or the assumptions about volunteer motivation and interest in this project, and (C) a well-defined recruitment strategy for the targeted volunteers.'
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
		,7
		,'Innovations, Best Practices, and Potential for Replication'
		,'Applicants should a) Describe what is innovative about this project and what it offers that is new in the justice community. If the project replicates a best practice in pro bono delivery, tbe response should clearly identify the project elements that are proven best practices. b) Describe the part(s) of the project that the program believes will be replicable and describe what the plan to study, measure, and evaluate for replication potential.'
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
		,7
		,'Proposed Performance Measures'
		,'Applicants should identify specific, measurable outcomes that the project seeks to accomplish in the proposed timeframe. It should also indicate in this response which measures will best demonstrate the project’s effectiveness. '
		,3
		,5
		,5)


UPDATE LSC_a_PRO_BONO_CATEGORY
SET abbr = 'Organizational Capacity, Project Partners, and Sustainability',
    description = 'Organizational Capacity, Project Partners, and Sustainability'
WHERE id = 8 


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
		,8
		,'Project Staffing, Leadership and Oversight'
		,'Applicant should describe the role and involvement of key staff in the project. The response should include an explanation of their capacity to provide programmatic and financial oversight of this project, with information about the role of your executive management in the development or implementation of the project.'
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
		,8
		,'Project Partners'
		,'Applicant should describe the role and involvement of key partners who will be collaborating with their organization on the project. If the project proposes subgrantees and contractors, the response should outline the key project activities each partner will be responsible for.'
		,3
		,2
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
		,8
		,'Sustainability of the Project'
		,'Applicant should describe their strategy to sustain the proposed project beyond the grant period. The response should identify the elements of the project that they anticipate will require a commitment of staffing and resources beyond the project period and those that will not require ongoing resources. The response should also include information on current or future partners and funders who are positioned to sustain the project and/or plans that the Applicant can develop to adapt its operations and staffing to support the project after the grant period.'
		,3
		,3
		,10)


UPDATE LSC_a_PRO_BONO_CATEGORY
SET abbr = 'Cost-Effectiveness and Budget Adequacy',
    description = 'Cost-Effectiveness and Budget Adequacy'
WHERE id = 9



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
		,9
		,'Budget Justification'
		,'Applicant should describe how the overall project budget, including other sources of support, will advance the desired goals, objectives, and project activities being proposed.  This section should include a statement of where the highest percentage of the Pro Bono Innovation Fund grant will be directed and your justification for this allocation. In addition to the relevant section of the Narrative, reviewers should consider the Budget Form and the uploaded, detailed Project Budget, Contracts, and Subgrant Forms when scoring this section.'
		,3
		,1
		,15)
