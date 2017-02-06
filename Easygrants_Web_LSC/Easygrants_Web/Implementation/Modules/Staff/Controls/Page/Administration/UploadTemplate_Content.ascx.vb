Imports Core.Web
Imports Core_Web.Controls.Base
Imports Core.DataAccess

Namespace Easygrants_Web.Modules.Staff.Controls.Page.Administration

Public MustInherit Class cUploadTemplate_Content
	Inherits Core_Web.Controls.Base.cDataPresenterCtl

	Protected ctlNewWindowOpener As cNewWindowOpener
	Protected ctlUploadTemplateList As cDataListCtl
	Protected aLinkHash As Hashtable

	Public Overrides Sub CoreCtl_Load(ByVal aSrc As Object, ByVal aEvent As EventArgs)
		MyBase.CoreCtl_Load(aSrc, aEvent)

		'Here we are Updating the Href of the Links , before we use to Open a new window with NewWindowControl , but now we are opening a New window with Target=_blank
		Dim aUpTempDO As cDataObject
		Dim aUploadTemplateID As Integer
		Dim aGetLinkID As Integer
		Dim aLink As cLink
		Dim aUpTempList As cDataObjectList = CType(DataObjectCollection("UploadTemplate"), cDataObjectList)
		ctlUploadTemplateList = FindControl("ctlUploadTemplateList")
		aLinkHash = ctlUploadTemplateList.DataListCtl_GetControlCollection("lnkTemplate")
		For Each aUpTempDO In aUpTempList
			aUploadTemplateID = aUpTempDO.GetRelatedPropertyInt("UploadTemplateID", 0)
			aGetLinkID = aUpTempDO.GetRelatedPropertyInt("UploadTemplateID")
			aLink = CType(aLinkHash(aGetLinkID), cLink)
			If Not aLink Is Nothing Then
				Dim aUrl As String = WebAppl.Build_RootURL(CorePage.GetUploadViewerControlUrl("OriginalFileViewer"))
				aLink.Href = aUrl & "?DataObject=UploadTemplate&ID=" & aUploadTemplateID
			End If
		Next
	End Sub

	Public Sub ViewTemplate(ByVal aPrimaryKeyValue As String)
			Dim aHref As String
			aHref = WebAppl.Build_RootURL(CorePage.GetUploadViewerControlUrl("OriginalFileViewer"))
			Dim aUploadTemplateDO As cDataObject = WebSession.DataObjectFactory.GetDataObjectFromPrimaryKey("UploadTemplate", aPrimaryKeyValue)
			Dim aUploadTemplateID As String
			aUploadTemplateID = aUploadTemplateDO.GetPropertyString("UploadTemplateID")

			aHref = cWebLib.AddQuerystringParameter(aHref, "DataObject", "UploadTemplate")
			aHref = cWebLib.AddQuerystringParameter(aHref, "ID", aUploadTemplateID)
			ctlNewWindowOpener.NewWindowURL = aHref
			ctlNewWindowOpener.Open()
			'Response.Redirect(aHref)
	End Sub

	Public Sub Delete(ByVal aPrimaryKeyValue As String)
		'Dim aUploadTemplateDO As cDataObject = WebSession.DataObjectFactory.GetDataObjectFromPrimaryKey("UploadTemplate", aPrimaryKeyValue)
		'Dim aUploadTemplateID As String
		'If Not aUploadTemplateDO Is Nothing Then
  '          Dim aUploadDO as cDataObject
  '          Dim aUploadDOList as cDataObjectList = WebSession.DataObjectFactory.GetDataObjectListWithFilter("Upload", "UploadTemplateID", aPrimaryKeyValue)
		'	if aUploadDOList.Count > 0 then
  '              for each aUploadDO in aUploadDOList
  '                  if aUploadDO.GetPropertyInt("UploadTemplateID", 0) = aPrimaryKeyValue then
  '                      aUploadDO("UploadTemplateID") = System.DBNull.Value
  '                      aUploadDO.SaveData()
  '                  End If
  '              Next
  '          End If
  '          EventController_Delete("UploadTemplate", aPrimaryKeyValue)
		'End If

		'we are moving the delete UploadTemplate File from database to dataPresenter class. as we are also checking whether the sharepoint is active and deleting the from sharepoint.
		UploadTemplateFile_Delete(aPrimaryKeyValue)
		CorePage.Redirect()
	End Sub

End Class
End Namespace