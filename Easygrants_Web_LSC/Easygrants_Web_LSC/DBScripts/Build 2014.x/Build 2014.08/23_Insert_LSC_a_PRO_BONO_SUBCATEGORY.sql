INSERT LSC_a_PRO_BONO_SUBCATEGORY
	(id
	,lsc_pro_bono_category_id
	,abbr
	,description
	,max_score
	,sort_order)
	VALUES
		(1
		,1
		,'Need Statement'
		,'The need statement should provide a description of the client needs and gaps in service that the project seeks to address. It should also provide a statement that sets forth the challenge or inefficiency in the pro bono system that will be the focus of this project. '
		,4
		,1)
		
INSERT LSC_a_PRO_BONO_SUBCATEGORY
	(id
	,lsc_pro_bono_category_id
	,abbr
	,description
	,max_score
	,sort_order)
	VALUES
		(2
		,1
		,'Available Pro Bono Resources '
		,'Applicants should provide an analysis of the pro bono capacity of the private bar and legal community in your area and, the volunteers you seek to target in your Pro Bono Innovation Project, and explain your strategy to target these volunteers.'
		,4
		,2)
		
INSERT LSC_a_PRO_BONO_SUBCATEGORY
	(id
	,lsc_pro_bono_category_id
	,abbr
	,description
	,max_score
	,sort_order)
	VALUES
		(3
		,1
		,'Goals, Objectives, and Activities'
		,'Applicant should describe the project goals and objectives and the specific project activities that are designed to meet gaps in service and engage more pro bono volunteers to meet the identified client needs.'
		,4
		,3)
		
INSERT LSC_a_PRO_BONO_SUBCATEGORY
	(id
	,lsc_pro_bono_category_id
	,abbr
	,description
	,max_score
	,sort_order)
	VALUES
		(4
		,1
		,'Innovation(s) Proposed and Potential for Replication'
		,'Applicants should describe the innovative and replicable strategies that the project will employ.'
		,4
		,4)
		
INSERT LSC_a_PRO_BONO_SUBCATEGORY
	(id
	,lsc_pro_bono_category_id
	,abbr
	,description
	,max_score
	,sort_order)
	VALUES
		(5
		,1
		,'Proposed Performance Measures'
		,'Applicants should identify specific, measurable outcomes that the project proposes to accomplish in the proposed timeframe.'
		,4
		,5)
		
INSERT LSC_a_PRO_BONO_SUBCATEGORY
	(id
	,lsc_pro_bono_category_id
	,abbr
	,description
	,max_score
	,sort_order)
	VALUES
		(6
		,2
		,'Track Record on Pro Bono and Collaborative Efforts'
		,'Applicant should provide an overview of Applicant’s success in collaborative and pro bono efforts, including specific and recent examples indicating the dates/years the partnerships and collaborations were in effect.'
		,4
		,1)
		
INSERT LSC_a_PRO_BONO_SUBCATEGORY 
	(id
	,lsc_pro_bono_category_id
	,abbr
	,description
	,max_score
	,sort_order)
	VALUES
		(7
		,2
		,'Ability to Provide Project Support, Oversight, and Capable Leadership'
		,'Applicant should describe Applicant’s capacity to set and implement goals and provide programmatic and financial oversight of this project.   The response should include relevant information about the key staff who will be responsible for the project.'
		,4
		,2)
		
INSERT LSC_a_PRO_BONO_SUBCATEGORY 
	(id
	,lsc_pro_bono_category_id
	,abbr
	,description
	,max_score
	,sort_order)
	VALUES
		(8
		,3
		,'Budget Justification'
		,'Applicant should provide a brief statement to supplement the Budget and Budget Narrative that describes how the project budget, including other sources of support, will advance the desired goals, objectives, and activities being proposed.'
		,4
		,1)
		

UPDATE s_ID_GEN
	SET next_id = 9
	WHERE table_name = 'LSC_a_PRO_BONO_SUBCATEGORY'