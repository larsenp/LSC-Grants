Imports System.Xml
Imports System.IO
Imports System.Text
Imports Core.DataAccess.XMLAccess
Imports Core.Web
Imports EasyGrants.Web.User
Imports Core_Web.Controls.Base
Imports Core.DataAccess

Namespace Easygrants_Web.Controls.PageSection
Public Class cTaskUploads
	Inherits Core_Web.Controls.Base.cDataPresenterCtl
	Protected ctlType As cDropDown
	Protected spnNoUploadTypeMsg As HtmlGenericControl
	Protected ctlNewWindowOpener As cNewWindowOpener
	Private mSubmittedFileID As Integer
	Protected TblInstructions As HtmlTable
	Private mIsHideInstructions As Boolean = True

	Protected ctlUploadsList As cDataListCtl
	Dim aLinkHash As Hashtable

	Public WriteOnly Property HideInstructions() As Boolean
		Set(ByVal value As Boolean)
			mIsHideInstructions = value
		End Set
	End Property

	Public ReadOnly Property URL() As String
		Get
			Dim aURL As String = WebAppl.Build_RootURL("Core/Controls/Base/UploadFormattingRequirements.htm")
			Return aURL
		End Get
	End Property

	Public Overrides Sub CoreCtl_Load(ByVal aSrc As Object, ByVal aEvent As EventArgs)
		MyBase.CoreCtl_Load(aSrc, aEvent)

		TblInstructions.Visible = mIsHideInstructions

		Dim aGranteeProjectDO As cDataObject = CType(Me.DataObjectCollection("GranteeProject"), cDataObjectList)(0)
		Dim aWfProjectTaskDO As cDataObject = CType(Me.DataObjectCollection("WfProjectTask"), cDataObjectList)(0)

		Dim aWfProjectTaskID As String = aWfProjectTaskDO("WfProjectTaskID")
		'Dim aWfProjectTaskUploadDOList As cDataObjectList = WebSession.DataObjectFactory.GetDataObjectListWithFilter("WfProjectTaskUpload", "WfProjectTaskID", aWfProjectTaskID, "IncludeInTask", True)
		Dim aWfProjectTaskUploadDOList As cDataObjectList = CType(Me.DataObjectCollection("WfProjectTaskUpload"), cDataObjectList)
		
		Dim i As Integer
		Dim aItem As ListItem
		ctlType.Items.Clear()
		aItem = New ListItem("<Select>", "")
		ctlType.Items.Add(aItem)
		If aWfProjectTaskUploadDOList.Count > 0 Then
		For i = 0 To aWfProjectTaskUploadDOList.Count - 1
				aItem = New ListItem(aWfProjectTaskUploadDOList(i).GetRelatedPropertyString("Upload.UploadName"), aWfProjectTaskUploadDOList(i).GetPropertyString("WfProjectTaskUploadID"))
				ctlType.Items.Add(aItem)
		Next
		End If

		'Here we are Updating the Href of the Links , before we use to Open a new window with NewWindowControl , but now we are opening a New window with Target=_blank
		Dim aWFPTUDO As cDataObject
		Dim aUploadID As Integer
		Dim aGetLinkID As Integer
		Dim aLink As cLink
		Dim aWFPTUList As cDataObjectList = CType(DataObjectCollection("WfProjectTaskUpload"), cDataObjectList)
		ctlUploadsList = FindControl("ctlUploadsList")
		aLinkHash = ctlUploadsList.DataListCtl_GetControlCollection("lnkTemplate")
		For Each aWFPTUDO In aWFPTUList
			aUploadID = aWFPTUDO.GetRelatedPropertyInt("Upload.UploadTemplateID", 0)
			aGetLinkID = aWFPTUDO.GetRelatedPropertyInt("WfProjectTaskUploadID")
			aLink = CType(aLinkHash(aGetLinkID), cLink)
			If Not aLink Is Nothing Then
				Dim aUrl As String = WebAppl.Build_RootURL(CorePage.GetUploadViewerControlUrl("OriginalFileViewer"))
				aLink.Href = aUrl & "?DataObject=UploadTemplate&ID=" & aUploadID
			End If
		Next

	End Sub
	
	Protected Overrides Function DataPresenter_Get_DataObjectList(ByRef aDataObjectElement As System.Xml.XmlElement) As Core.DataAccess.cDataObjectList
	
		If cXMLDoc.AttributeToString(aDataObjectElement, "Key") = "WfProjectTaskUpload" Then
			Dim aWfProjectTaskUploadDOL As cDataObjectList = MyBase.DataPresenter_Get_DataObjectList(aDataObjectElement)
			Dim aGranteeProjectDO As cDataObject = CType(Me.DataObjectCollection("GranteeProject"), cDataObjectList)(0)
			If aGranteeProjectDO.GetRelatedPropertyInt("PrimaryPerson.PersonPrimaryAffiliation.Organization.EligibilityStatusID", -1) <> -1 Then
				Dim aPrimaryOrgEligStatusID As Integer = aGranteeProjectDO.GetRelatedPropertyInt("PrimaryPerson.PersonPrimaryAffiliation.Organization.EligibilityStatusID")
				Dim aIdx As Integer
				Dim aIdxToRemoveFromList As ArrayList = new ArrayList()
				For aIdx = 0 To aWfProjectTaskUploadDOL.Count-1
					Dim aWfProjectTaskUploadDO As cDataObject = aWfProjectTaskUploadDOL(aIdx)
					Dim aWfProjectTaskUploadEligDOL As cDataObjectList = aWfProjectTaskUploadDO.GetRelatedPropertyDataObjectList("WfProjectTaskUploadOrganizationEligibility")
					Dim aWfProjectTaskUploadEligDO As cDataObject
					For each aWfProjectTaskUploadEligDO in aWfProjectTaskUploadEligDOL
						If aWfProjectTaskUploadEligDO.GetPropertyInt("OrganizationEligibilityID", -1) = aPrimaryOrgEligStatusID Then 
							'When the Primary Organization Eligibility Status is one of the project task upload eligible status add the index to the Arraylist for removal.
							'Directly removing an object from the DataObjectList during looping will cause errors.
							aIdxToRemoveFromList.Add(aIdx)
							Exit For
						End If
					Next
				Next
				Dim aIdxObj As Object
				 aIdxToRemoveFromList.Reverse()
					For Each aIdxObj In aIdxToRemoveFromList
						aWfProjectTaskUploadDOL.Remove(aWfProjectTaskUploadDOL(Convert.ToInt32(aIdxObj)))
					Next
				Return aWfProjectTaskUploadDOL
			End If
			
			Return MyBase.DataPresenter_Get_DataObjectList(aDataObjectElement)
		Else
			Return MyBase.DataPresenter_Get_DataObjectList(aDataObjectElement)
		End If
		
	End Function

	Public Sub NavigateToUploadEditor(ByVal ReturnUrl As String)

	ctlType = CType(FindControl("ctlType"), cDropDown)
	If ctlType.SelectedValue = "" Then
		spnNoUploadTypeMsg.Visible = True
		Exit Sub
	End If
	EventController_NavigateToModulePageKey("UploadEditor", "WfProjectTaskUploadID=" + ctlType.SelectedValue, "EntityDataObjectKey=WfTaskAssignment", ReturnUrl)
	End Sub

	'Public Sub DocumentList_ViewConvertedUploadedFile(ByVal aPrimaryKeyValue As String)

	'	Dim aHref As String

	'	aHref = WebAppl.Build_RootURL("Core/Controls/Base/pgUploadReader.aspx")
	'	aHref = cWebLib.AddQuerystringParameter(aHref, "SubmittedFileID", aPrimaryKeyValue)
	'	ctlNewWindowOpener.NewWindowURL = aHref
	'	ctlNewWindowOpener.Open()
	'	'Response.Redirect(aHref)

	'End Sub
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

	Public Sub DocumentList_ViewConvertedUploadedFile(ByVal aPrimaryKeyValue As String)

		Dim aHref As String
		aHref = WebAppl.Build_RootURL(CorePage.GetUploadViewerControlUrl("ConvertedFileViewer"))
		aHref = cWebLib.AddQuerystringParameter(aHref, "SubmittedFileID", aPrimaryKeyValue)
		ctlNewWindowOpener.NewWindowURL = aHref
		ctlNewWindowOpener.Open()
		'Response.Redirect(aHref)
	End Sub
'----------------------------------------------------

	Public Sub DocumentList_Delete(ByVal aPrimaryKeyValue As String)

		''get aSubmittedFile and call SubmittedFileDelete
		'Dim aSubmittedFile As cSubmittedFile
		'Dim aURL = Request.Url.PathAndQuery()
		'Dim aValue As String = mSubmittedFileID
		'aSubmittedFile = WebSession.DataObjectFactory.GetDataObjectFromPrimaryKey("SubmittedFile", aPrimaryKeyValue)
		'aSubmittedFile.SubmittedFile_Delete()

		'The above code is commented out because , we moved this code section to cDataPresenterCtl as if there is Sharepoint Integration , then we need to delete the File from sharepoint.
		'So the delete Functionality is placed at once place in cDataPresenterCtl Class.
		SubmittedFile_Delete(aPrimaryKeyValue)

		CorePage.Redirect()

	End Sub
End Class

End Namespace
