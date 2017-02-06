
ALTER  PROCEDURE [dbo].[spSHAREPOINT_QUEUED_UPLOADTEMPLATE]
AS
SELECT UT.upload_template_id AS UploadTemplateID 
FROM a_UPLOAD_TEMPLATE UT ,  s_SHAREPOINT_INTEGRATION SI
WHERE 
(UT.sharepoint_conversion_status = 0 or UT.sharepoint_conversion_status is null or UT.sharepoint_conversion_status = 1 or UT.sharepoint_conversion_status = 2) 
and (SI.Active = 'True')
ORDER BY UT.sharepoint_conversion_status