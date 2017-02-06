Imports Core.Web.Modules
Imports Core.DataAccess
Imports Core.Web
Imports Core_Web.Controls.Base

Namespace Easygrants_Web.Modules.Staff.Controls.PageSection
Public MustInherit Class cGrantTripReportEditor
	Inherits Core_Web.Controls.Base.cDataPresenterCtl
	
'=============================================================

	Public Overrides Function EventController_Save() As Boolean
		MyBase.EventController_Save()
		
		Dim aPublicationUpload As cUploadSaveAll = FindControl("ctlUpload")
		
		Dim aGPPublicationDO As cDataObject
		aGPPublicationDO = CType(DataObjectCollection("GranteeProjectTrip"), cDataObjectList)(0)
		aGPPublicationDO("UploadID") = aPublicationUpload.SubmittedFileID
		aGPPublicationDO.SaveData()
	End Function

End Class
End Namespace