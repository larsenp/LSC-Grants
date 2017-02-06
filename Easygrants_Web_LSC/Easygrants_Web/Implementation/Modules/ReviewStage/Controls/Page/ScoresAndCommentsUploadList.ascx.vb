Imports Core.DataAccess
Imports Core.Web
Imports Core_Web.Controls.Base
Imports Core.DataAccess.XMLAccess
Imports Core.Web.Modules
Imports System.Xml
Imports EasyGrants.Workflow
Imports EasyGrants.Web.User
Imports EasyGrants.Web

Namespace Implementation.Modules.ReviewStage.Controls.Page

Public MustInherit Class cScoresandCommentsUploadList
	Inherits Core_Web.Controls.Base.cEntityDataPresenterCtl

	Protected ctlList As cDataListCtl
	Private isValidScore As Boolean = True
	Protected ctlNewWindowOpener As cNewWindowOpener
	Private mReportOuputDefinitionTypeID As String = "1"
	Private mDefinitionID As String
	Private mEditorPageKey As String = ""
	Private mIsUserBased As Boolean = False

	Public Property EditorPageKeyName() As String
		Get
			Return mEditorPageKey
		End Get
		Set(ByVal value As String)
			mEditorPageKey = value
		End Set
	End Property

	Public Property ReportOuputDefinitionTypeID() As String
		Get
			Return mReportOuputDefinitionTypeID
		End Get
		Set(ByVal value As String)
			mReportOuputDefinitionTypeID = value
		End Set
	End Property

	Public Property IsUserBased() As Boolean
		Get
			Return mIsUserBased
		End Get
		Set(ByVal value As Boolean)
			mIsUserBased = value
		End Set
	End Property


	Public Overrides Sub CoreCtl_Load(ByVal sender As System.Object, ByVal e As System.EventArgs)

		Dim aXmlDoc As cXMLDoc = Nothing
		Dim aDataObjectFiltersNode As XmlNode = Nothing
		Dim aReviewCycleProjectTaskDOL As cDataObjectList
		Dim aArgNode As XmlNode = Nothing
		Dim aUser As cEGUser
		Dim aWFTaskAssignmentDo As cDataObject
		Dim Position As Integer = 0

		aUser = CType(CType(Page, cModulePage).ModuleUser, cEGUser)
		aWFTaskAssignmentDo = aUser.WfTaskAssignmentObject
		aReviewCycleProjectTaskDOL = aWFTaskAssignmentDo.GetRelatedPropertyDataObjectList("ReviewCycleStage.ReviewCycle.ReviewCycleProjectTask")

		aXmlDoc = New cXMLDoc()
		aXmlDoc.LoadFromXML(spnConfigXML.InnerText)
		aDataObjectFiltersNode = aXmlDoc.DocElement.SelectSingleNode("DataObject[@Key='ExternalReviewApplicationsList']/Filters")

		aArgNode = aDataObjectFiltersNode.AppendChild(WebSession.DataObjectFactory.CreateArgumentNode(aXmlDoc, "Data", "ReviewCycleStageID", aWFTaskAssignmentDo.GetPropertyInt("ReviewCycleStageID", -1)))
		'If aReviewCycleProjectTaskDOL.Count > 1 Then
			aDataObjectFiltersNode.AppendChild(WebSession.DataObjectFactory.CreateGroupArgumentNode(aXmlDoc, "("))
		'End If
		
		For Each aReviewCycleProjectTaskDO As cDataObject In aReviewCycleProjectTaskDOL
			If Position = 0 Then
				aArgNode = aDataObjectFiltersNode.AppendChild(WebSession.DataObjectFactory.CreateArgumentNode(aXmlDoc, "Data", "WfProjectTaskID", aReviewCycleProjectTaskDO.GetPropertyInt("WfProjectTaskID", -1), ""))
			Else
				aArgNode = aDataObjectFiltersNode.AppendChild(WebSession.DataObjectFactory.CreateArgumentNode(aXmlDoc, "Data", "WfProjectTaskID", aReviewCycleProjectTaskDO.GetPropertyInt("WfProjectTaskID", -1), "Or"))
			End If
			Position = Position + 1
		Next
		'If aReviewCycleProjectTaskDOL.Count > 1 Then
			aDataObjectFiltersNode.AppendChild(WebSession.DataObjectFactory.CreateGroupArgumentNode(aXmlDoc, ")", ""))
		'End If
		spnConfigXML.InnerText = aXmlDoc.DocElement.OuterXml

		MyBase.CoreCtl_Load(sender, e)

		If Not IsPostBack Then
			Dim aWftaDOList As cDataObjectList
			Dim aWftaDO As cDataObject
			Dim aBtnAddCommentHash As Hashtable
			Dim aBtnEditCommentHash As Hashtable
			Dim aBtnAddComment As cCSSButton
			Dim aBtnEditComment As cCSSButton
			ctlList = FindControl("ctlList")
			aBtnAddCommentHash = ctlList.DataListCtl_GetControlCollection("btnAddScore")
			aBtnEditCommentHash = ctlList.DataListCtl_GetControlCollection("btnEditScore")
			aWftaDOList = CType(DataObjectCollection("ExternalReviewApplicationsList"), cDataObjectList)
		End If
	End Sub


	Public Sub RedirectToModule(ByVal AppWftaID As String, ByVal ReturnURL As String)
		EventController_NavigateToModulePageKey(EditorPageKeyName, AppWftaID, ReturnURL)
	End Sub


	Public Sub ViewPDF(ByVal EntityID As String)
		Dim aHref As String
		Dim aWftaDO As cDataObject = WebSession.DataObjectFactory.GetDataObjectListFromPrimaryKey("WfTaskAssignment", EntityID)(0)
		If IsUserBased = True Then
			Dim aUser As cEGUser
			aUser = CType(CType(Page, cModulePage).ModuleUser, cEGUser)
			Dim aUserDO As cDataObject = WebSession.DataObjectFactory.GetDataObjectListFromPrimaryKey("User", aUser.UserID)(0)
			If aUserDO.GetPropertyString("UserTypeID") = 1 Then
				mDefinitionID = aWftaDO.GetRelatedPropertyString("WfProjectTask.AppPDFReportKeyLink.FinalPDFReportKeyLink.ReportOutputDefinitionID")
			ElseIf aUserDO.GetPropertyString("UserTypeID") = 2 Or aUserDO.GetPropertyString("UserTypeID") = 3 Then
				mDefinitionID = aWftaDO.GetRelatedPropertyString("WfProjectTask.StaffPDFReportKeyLink.FinalPDFReportKeyLink.ReportOutputDefinitionID")
			End If
		ElseIf ReportOuputDefinitionTypeID = 1 Then
			mDefinitionID = aWftaDO.GetRelatedPropertyString("WfProjectTask.AppPDFReportKeyLink.FinalPDFReportKeyLink.ReportOutputDefinitionID")
		ElseIf ReportOuputDefinitionTypeID = 2 Then
			mDefinitionID = aWftaDO.GetRelatedPropertyString("WfProjectTask.RevPDFReportKeyLink.FinalPDFReportKeyLink.ReportOutputDefinitionID")
		ElseIf ReportOuputDefinitionTypeID = 3 Then
			mDefinitionID = aWftaDO.GetRelatedPropertyString("WfProjectTask.StaffPDFReportKeyLink.FinalPDFReportKeyLink.ReportOutputDefinitionID")
		End If

		aHref = CType(WebAppl, cEGAppl).Build_ReportOutput_EntityID_URL(EntityID, mDefinitionID, "False")
		ctlNewWindowOpener.NewWindowURL = aHref
		ctlNewWindowOpener.Open()
	End Sub
	
	Public Sub RedirectToUploadEditor(ByVal aPageKey As String, ByVal aRevWftaID As String, ByVal aReturnURL As String)
		Dim aNewURL As String
		Dim aWFTAReviewDOL As cDataObjectList = WebSession.DataObjectFactory.GetDataObjectListWithFilter("WfTaskAssignmentReview", "WfTaskAssignmentID", aRevWftaID)
		Dim aWFTAReviewDO As cDataObject
		If aWFTAReviewDOL.Count = 0 Then
			aWFTAReviewDO = WebSession.DataObjectFactory.CreateNewDataObjectFromKey("WfTaskAssignmentReview")
			aWFTAReviewDO("WfTaskAssignmentID") = Convert.ToInt32(aRevWftaID)
			aWFTAReviewDO.SaveData()
		Else
			aWFTAReviewDO = aWFTAReviewDOL(0)
		End If
		Dim aCommentsUploadedFileID As String = aWFTAReviewDO.GetPropertyString("CommentsUploadedFileID", "0")
		aNewURL = CType(CorePage, cModulePage).PageURL
		aNewURL = cWebLib.AddQuerystringParameter(aNewURL, "Page", aPageKey)
		aNewURL = cWebLib.AddQuerystringParameter(aNewURL, "SubmittedFileID", aCommentsUploadedFileID)
		aNewURL = cWebLib.AddQuerystringParameter(aNewURL, "EntityDataObjectKey=WfTaskAssignment")
		aNewURL = cWebLib.AddQuerystringParameter(aNewURL, "WfTaskAssignmentID", aRevWftaID)
		aNewURL = cWebLib.AddQuerystringParameter(aNewURL, "WfProjectTaskUploadID", aWFTAReviewDO.GetRelatedPropertyString("WfTaskAssignment.WfProjectTask.TaskUploadType.UploadId"))
		aNewURL = cWebLib.AddQuerystringParameter(aNewURL, "ReturnAfterDelete=False")
		aNewURL = cWebLib.AddQuerystringParameter(aNewURL, aReturnURL, Server)
		Response.Redirect(aNewURL)
	End Sub
	
	Public Sub ViewParticipantSummary(ByVal aPageKey As String, ByVal aGranteeProjectID As String)
		If Not EventController_Save(True) Then
			Exit Sub
		End If
		Dim aNewWindowUrl As String = Request.Url.ToString
		aNewWindowUrl = cWebLib.AddQuerystringParameter(aNewWindowUrl, "Page", aPageKey)
		aNewWindowUrl = cWebLib.AddQuerystringParameter(aNewWindowUrl, "PageFrame=Print")
		aNewWindowUrl = cWebLib.AddQuerystringParameter(aNewWindowUrl, aGranteeProjectID)
		ctlNewWindowOpener.NewWindowURL() = aNewWindowUrl
		ctlNewWindowOpener.Open()
	End Sub

End Class
End Namespace