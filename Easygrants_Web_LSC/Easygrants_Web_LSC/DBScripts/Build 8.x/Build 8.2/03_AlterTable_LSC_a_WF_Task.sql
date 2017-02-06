
ALTER TABLE LSC_a_WF_Task
 ADD EditableView_PageKey varchar(50);

GO

UPDATE LSC_a_WF_Task
SET EditableView_PageKey = 'Form_D1'
WHERE form_number = 'D-1'

UPDATE LSC_a_WF_Task
SET EditableView_PageKey = 'Form_D3'
WHERE form_number = 'D-3'

UPDATE LSC_a_WF_Task
SET EditableView_PageKey = 'Form_G3'
WHERE form_number = 'G-3'

UPDATE LSC_a_WF_Task
SET EditableView_PageKey = 'Form_G3d'
WHERE form_number = 'G-3(d)'

UPDATE LSC_a_WF_Task
SET EditableView_PageKey = 'Form_G4'
WHERE form_number = 'G-4'

UPDATE LSC_a_WF_Task
SET EditableView_PageKey = 'Form_G5'
WHERE form_number = 'G-5'

UPDATE LSC_a_WF_Task
SET EditableView_PageKey = 'Form_G5d'
WHERE form_number = 'G-5(d)'

UPDATE LSC_a_WF_Task
SET EditableView_PageKey = 'Form_J1'
WHERE form_number = 'J-1'

UPDATE LSC_a_WF_Task
SET EditableView_PageKey = 'CommunityLegalEducation'
WHERE form_number = 'M'

UPDATE LSC_a_WF_Task
SET EditableView_PageKey = 'Certification'
WHERE form_number = 'G-6'

UPDATE LSC_a_WF_Task
SET EditableView_PageKey = 'Form_L'
WHERE form_number = 'L'

UPDATE LSC_a_WF_Task
SET EditableView_PageKey = 'Form_D2'
WHERE form_number = 'D-2'

UPDATE LSC_a_WF_Task
SET EditableView_PageKey = 'Form_D4'
WHERE form_number = 'D-4'

UPDATE LSC_a_WF_Task
SET EditableView_PageKey = 'Form_G1'
WHERE form_number = 'G-1'

UPDATE LSC_a_WF_Task
SET EditableView_PageKey = 'Form_G1d'
WHERE form_number = 'G-1(d)'

UPDATE LSC_a_WF_Task
SET EditableView_PageKey = 'Form_J2'
WHERE form_number = 'J-2'

UPDATE LSC_a_WF_Task
SET EditableView_PageKey = 'Form_E0'
WHERE form_number = 'E-0'

UPDATE LSC_a_WF_Task
SET EditableView_PageKey = 'Form_E1a'
WHERE form_number = 'E-1(a)'

UPDATE LSC_a_WF_Task
SET EditableView_PageKey = 'BranchOffices'
WHERE form_number = 'E-1(b)'

UPDATE LSC_a_WF_Task
SET EditableView_PageKey = 'SubrecipientOffices'
WHERE form_number = 'E-1(c)'

UPDATE LSC_a_WF_Task
SET EditableView_PageKey = 'Form_E2a'
WHERE form_number = 'E-2(a)'

UPDATE LSC_a_WF_Task
SET EditableView_PageKey = 'Form_E2c'
WHERE form_number = 'E-2(c)'







--select * from LSC_a_WF_Task