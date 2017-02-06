Imports Core_Web.Controls.Base
Imports Core.Web
Imports Core.DataAccess


Namespace Easygrants_Web.Controls.PageSection
Public MustInherit Class cPublicationsList
    Inherits Core_Web.Controls.Base.cDataPresenterCtl

'=============================================================

	Protected ctlNewWindowOpener As cNewWindowOpener
	Protected ctlDataList As cDataListCtl
	Dim aLinkHash As Hashtable
'=============================================================

	Public Overrides Sub CoreCtl_Load(ByVal aSrc As Object, ByVal aEvent As EventArgs)
			MyBase.CoreCtl_Load(aSrc, aEvent)

		'Here we are Updating the Href of the Links , before we use to Open a new window with NewWindowControl , but now we are opening a New window with Target=_blank
		Dim aPubUploadDO As cDataObject
		Dim aSubmittedFileID As Integer
		Dim aGetLinkID As Integer
		Dim aLink As cLink
		Dim aPubUploadList As cDataObjectList = CType(DataObjectCollection("GranteeProjectPublications"), cDataObjectList)
		ctlDataList = FindControl("ctlDataList")
		aLinkHash = ctlDataList.DataListCtl_GetControlCollection("btnView")
		For Each aPubUploadDO In aPubUploadList
			aSubmittedFileID = aPubUploadDO.GetRelatedPropertyInt("PublicationUpload.SubmittedFileID", 0)
			aGetLinkID = aPubUploadDO.GetRelatedPropertyInt("GranteeProjectPublicationsID")
			aLink = CType(aLinkHash(aGetLinkID), cLink)
			If Not aLink Is Nothing Then
				Dim aUrl As String = WebAppl.Build_RootURL(CorePage.GetUploadViewerControlUrl("OriginalFileViewer"))
				aLink.Href = aUrl & "?SubmittedFileID=" & aSubmittedFileID
				'aLink.Add_Attribute("class", "CSSButtonStyle")
			End If
		Next

	End Sub

    Public Sub DocumentList_ViewConvertedUploadedFile(ByVal aPrimaryKeyValue As String)

		Dim aHref As String

		aHref = WebAppl.Build_RootURL(CorePage.GetUploadViewerControlUrl("OriginalFileViewer"))
		aHref = cWebLib.AddQuerystringParameter(aHref, "SubmittedFileID", aPrimaryKeyValue)
		ctlNewWindowOpener.NewWindowURL = aHref
		ctlNewWindowOpener.Open()
		'Response.Redirect(aHref)

	End Sub

	Public Sub Publication_Delete(ByVal aPublicationPrimaryKeyValue As String)
		Dim aPublicationDOL As cDataObjectList = WebSession.DataObjectFactory.GetDataObjectListWithFilter("GranteeProjectPublications", "GranteeProjectPublicationsID", aPublicationPrimaryKeyValue)
		If aPublicationDOL.Count > 0 Then
			If aPublicationDOL(0).GetPropertyInt("PublicationUploadID", 0) > 0 Then
				Dim aSubmittedFileDO As cSubmittedFile = WebSession.DataObjectFactory.GetDataObjectFromPrimaryKey("SubmittedFile", aPublicationDOL(0).GetPropertyString("PublicationUploadID"))
				MyBase.DeleteSubmittedFile(aSubmittedFileDO)
			End If
		End If
		WebSession.DataObjectFactory.DeleteData(aPublicationDOL(0))
		CorePage.Redirect()
	End Sub
'=============================================================

End Class
End Namespace