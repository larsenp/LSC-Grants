Imports Core.Web
Imports Core_Web.Controls.Base
Imports Core.DataAccess


Namespace Easygrants_Web.Modules.Staff.Controls.Page.Administration

Public MustInherit Class cUploadManager_Content
	Inherits Core_Web.Controls.Base.cDataPresenterCtl

Protected ctlNewWindowOpener As cNewWindowOpener
Protected ctlUploadsList As cDataListCtl
Protected aLinkHash As Hashtable

Public Overrides Sub CoreCtl_Load(ByVal aSrc As Object, ByVal aEvent As EventArgs)
		MyBase.CoreCtl_Load(aSrc, aEvent)



		'Here we are Updating the Href of the Links , before we use to Open a new window with NewWindowControl , but now we are opening a New window with Target=_blank
		Dim aUpDO As cDataObject
		Dim aUploadID As Integer
		Dim aGetLinkID As Integer
		Dim aLink As cLink
		Dim aUpList As cDataObjectList = CType(DataObjectCollection("UploadList"), cDataObjectList)
		ctlUploadsList = FindControl("ctlUploadsList")
		aLinkHash = ctlUploadsList.DataListCtl_GetControlCollection("lnkTemplate")
		For Each aUpDO In aUpList
			aUploadID = aUpDO.GetRelatedPropertyInt("UploadTemplateID", 0)
			aGetLinkID = aUpDO.GetRelatedPropertyInt("UploadID")
			aLink = CType(aLinkHash(aGetLinkID), cLink)
			If Not aLink Is Nothing Then
				Dim aUrl As String = WebAppl.Build_RootURL(CorePage.GetUploadViewerControlUrl("OriginalFileViewer"))
				aLink.Href = aUrl & "?DataObject=UploadTemplate&ID=" & aUploadID
			End If
		Next

	End Sub

Public Sub ViewTemplate(ByVal aPrimaryKeyValue As String)

		Dim aHref As String

		aHref = WebAppl.Build_RootURL(CorePage.GetUploadViewerControlUrl("OriginalFileViewer"))
		Dim aUploadDO As cDataObject = WebSession.DataObjectFactory.GetDataObjectFromPrimaryKey("Upload", aPrimaryKeyValue)
		Dim aUploadTemplateID As String
		If Not aUploadDO Is Nothing Then
			aUploadTemplateID = aUploadDO.GetPropertyString("UploadTemplateID")
		End If
		aHref = cWebLib.AddQuerystringParameter(aHref, "DataObject", "UploadTemplate")
		aHref = cWebLib.AddQuerystringParameter(aHref, "ID", aUploadTemplateID)
		ctlNewWindowOpener.NewWindowURL = aHref
		ctlNewWindowOpener.Open()
		'Response.Redirect(aHref)

End Sub
	

End Class
End Namespace