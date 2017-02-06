ALTER TABLE LSC_a_REVIEW_INQUIRY
ADD form_page_key varchar(20)

GO

Update LSC_a_REVIEW_INQUIRY
SET form_page_key = 'PV_Intake_System'
WHERE abbr='F1'

Update LSC_a_REVIEW_INQUIRY
SET form_page_key = 'PV_LEP'
WHERE abbr='F2'

Update LSC_a_REVIEW_INQUIRY
SET form_page_key = 'PV_Training'
WHERE abbr='F3'

Update LSC_a_REVIEW_INQUIRY
SET form_page_key = 'PV_Legal_Work_Mngt'
WHERE abbr='F4'

Update LSC_a_REVIEW_INQUIRY
SET form_page_key = 'PV_CaseHandling'
WHERE abbr='F5'

Update LSC_a_REVIEW_INQUIRY
SET form_page_key = 'PV_CaseDevelopment'
WHERE abbr='F6'

Update LSC_a_REVIEW_INQUIRY
SET form_page_key = 'PV_PAI'
WHERE abbr='F7'

Update LSC_a_REVIEW_INQUIRY
SET form_page_key = 'PV_Recruit_PA'
WHERE abbr='F8'

Update LSC_a_REVIEW_INQUIRY
SET form_page_key = 'PV_Retain_PA'
WHERE abbr='F9'

Update LSC_a_REVIEW_INQUIRY
SET form_page_key = 'PV_Board_Policies'
WHERE abbr='F10'
