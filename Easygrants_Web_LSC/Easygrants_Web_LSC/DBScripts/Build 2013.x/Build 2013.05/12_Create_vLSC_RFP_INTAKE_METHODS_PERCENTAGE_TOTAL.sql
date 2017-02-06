

CREATE VIEW vLSC_RFP_INTAKE_METHODS_PERCENTAGE_TOTAL

AS 


SELECT wf_task_assignment_id, 
       SUM(intake_percentage) total_percentage
	FROM LSC_RFP_INTAKE_METHODS_BY_TYPE
	GROUP BY wf_task_assignment_id