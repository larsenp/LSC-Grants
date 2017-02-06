
CREATE  PROCEDURE [dbo].[spSHAREPOINT_QUEUED_UPLOADTEMPLATE]
AS
SELECT UT.upload_template_id AS UploadTemplateID 
FROM a_UPLOAD_TEMPLATE UT ,  s_SHAREPOINT_INTEGRATION SI
WHERE 
(UT.sharepoint_conversion_status >= 0 or UT.sharepoint_conversion_status is null) 
and (SI.Active = 'True')
ORDER BY UT.sharepoint_conversion_status