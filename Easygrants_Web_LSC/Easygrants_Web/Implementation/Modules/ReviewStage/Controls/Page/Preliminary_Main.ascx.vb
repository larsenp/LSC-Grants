Imports Core.DataAccess
Imports Core_Web.Controls.Base
Imports System.Xml
Imports EasyGrants.Workflow
Imports Core.DataAccess.XMLAccess
Imports Core.Web.Modules
Imports EasyGrants.Web.User
Imports EasyGrants.Web


Namespace Easygrants_Web.Implementation.Modules.ReviewStage.Controls.Page

Public MustInherit Class cPreliminary_Main
	Inherits Core_Web.Controls.Base.cDataPresenterCtl


	Protected ctlNewWindowOpener As cNewWindowOpener
	Protected TblIncomplete As HtmlTable
	Protected Tblcomplete As HtmlTable
	Private mReportOuputDefinitionTypeID As String = "1"
	Private mDefinitionID As String
	Private mEditorPageKey As String
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
		If aReviewCycleProjectTaskDOL.Count > 0 Then
			aDataObjectFiltersNode.AppendChild(WebSession.DataObjectFactory.CreateGroupArgumentNode(aXmlDoc, "("))
		End If

		For Each aReviewCycleProjectTaskDO As cDataObject In aReviewCycleProjectTaskDOL
			If Position = 0 Then
				aArgNode = aDataObjectFiltersNode.AppendChild(WebSession.DataObjectFactory.CreateArgumentNode(aXmlDoc, "Data", "WfProjectTaskID", aReviewCycleProjectTaskDO.GetPropertyInt("WfProjectTaskID", -1), ""))
			Else
				aArgNode = aDataObjectFiltersNode.AppendChild(WebSession.DataObjectFactory.CreateArgumentNode(aXmlDoc, "Data", "WfProjectTaskID", aReviewCycleProjectTaskDO.GetPropertyInt("WfProjectTaskID", -1), "Or"))
			End If
			Position = Position + 1
		Next
		
		If aReviewCycleProjectTaskDOL.Count > 0 Then
			aDataObjectFiltersNode.AppendChild(WebSession.DataObjectFactory.CreateGroupArgumentNode(aXmlDoc, ")", ""))
		End If
		spnConfigXML.InnerText = aXmlDoc.DocElement.OuterXml
		MyBase.CoreCtl_Load(sender, e)
		'Dim aUser As cEGUser
		Dim aStatus As Integer = 0
		'aUser = CType(CType(Page, cModulePage).ModuleUser, cEGUser)
		'Dim aWFTaskAssignmentDo As cDataObject = aUser.WfTaskAssignmentObject
		If Not aWFTaskAssignmentDo Is Nothing Then
			aStatus = aWFTaskAssignmentDo("WfTaskStatusID")
		End If
		If aStatus = 1 Or aStatus = 4 Then
			TblIncomplete.Visible = True
			Tblcomplete.Visible = False
		ElseIf aStatus = 2 Then
			TblIncomplete.Visible = False
			Tblcomplete.Visible = True
		End If

	End Sub

	Public Sub RedirectToModule(ByVal aPageKey As String, ByVal AppWftaID As String, ByVal ReturnURL As String)
		EventController_NavigateToModulePageKey(aPageKey, AppWftaID, ReturnURL)
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


End Class
End Namespace