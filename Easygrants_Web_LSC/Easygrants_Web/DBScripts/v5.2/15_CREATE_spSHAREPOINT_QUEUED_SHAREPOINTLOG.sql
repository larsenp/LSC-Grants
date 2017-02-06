
CREATE  PROCEDURE [dbo].[spSHAREPOINT_QUEUED_SHAREPOINTLOG]
AS
set nocount on
	
select	SPL.id
 
from s_SHAREPOINT_LOG SPL ,  s_SHAREPOINT_INTEGRATION SI
where	(SPL.sharepoint_conversion_status >= 0 or SPL.sharepoint_conversion_status is null) 
and (SI.Active = 'True')
order by SPL.event_type_id , SPL.id