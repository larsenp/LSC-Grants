Imports Core.DataAccess
Imports Core_Web.Controls.Base
Imports System.Xml
Imports Core.DataAccess.XMLAccess
Imports Core.Web.Modules
Imports EasyGrants.Web.User
Imports EasyGrants.Web
Imports EasyGrants.Workflow
Imports EasyGrants.Web.Modules


Namespace Implementation.Modules.ThirdParty.Controls.Page

Public MustInherit Class cThirdPartyUploads
	Inherits Easygrants_Web.Controls.Base.cValidationDataPresenterCtl

	Protected ctlNewWindowOpener As cNewWindowOpener
	Protected TblSubmission As HtmlTable
	Protected TblPostSubPDF As HtmlTable
	Protected TrViewApp As HtmlTableRow
	Protected TblUploads As HtmlTable
	Protected spnSubmitButton As HtmlGenericControl
	Private aWfTaskAssignmentObject As cWfTaskAssignment
	Protected mForceGen As Boolean = True
	Private aWfDataObject As cWfTaskAssignment
	Dim aApplicationWfTaskAssignmentDOL As cDataObjectList
	Protected TblInstructions As HtmlTable
	Protected spnValidationSummary As HtmlGenericControl
	Protected btnView As cLink
	Protected btnPostSubViewApp As cLink
	Public Overrides Sub CoreCtl_Load(ByVal aSrc As Object, ByVal aEvent As EventArgs)
		TblUploads.Visible = True
		TblInstructions.Visible = True
		MyBase.CoreCtl_Load(aSrc, aEvent)
		Dim aValidationNode As XmlNode
		Dim aValid As Boolean

		aValidationNode = (CType(Page, cModulePage)).ValidationNode
		aWfDataObject = CType(mDataObjHash("WfTaskAssignment")(0), cWfTaskAssignment)

		aValid = Validate(aValidationNode, WebSession.DataObjectFactory)

		'If Not aValid Then
		'	spnSubmitButton.Visible = False
		'End If

		btnView = CType(Me.FindControl("btnView"), cLink)
		If Not btnView Is Nothing Then
			Dim aDO As cDataObject = CType(Me.DataObjectCollection("ApplicationWfTaskAssignment"), cDataObjectList)(0)
			Dim aEntityID As String = aDO.GetPropertyString("WfTaskAssignmentID", "")
			Dim aDefinitionID As String = aDO.GetRelatedPropertyString("WfProjectTask.AppPDFReportKeyLink.FinalPDFReportKeyLink.ReportOutputDefinitionID")
			Dim aHref As String
			aHref = CType(WebAppl, cEGAppl).Build_ReportOutput_EntityID_URL(aEntityID, aDefinitionID, "False")
			btnView.Href = aHref
			btnView.Target = "_blank"
			btnView.Add_Attribute("class", "CSSButtonStyle")
		End If

		btnPostSubViewApp = CType(Me.FindControl("btnPostSubViewApp"), cLink)
		If Not btnPostSubViewApp Is Nothing Then
			Dim aPostDO As cDataObject = CType(Me.DataObjectCollection("WfTaskAssignment"), cDataObjectList)(0)
			Dim aPostEntityID As String = aPostDO.GetPropertyString("WfTaskAssignmentID", "")
			Dim aPostDefinitionID As String = aPostDO.GetRelatedPropertyString("WfProjectTask.AppPDFReportKeyLink.FinalPDFReportKeyLink.ReportOutputDefinitionID")
			btnPostSubViewApp.Href = CType(WebAppl, cEGAppl).Build_ReportOutput_EntityID_URL(aPostEntityID, aPostDefinitionID, "False")
			btnPostSubViewApp.Add_Attribute("class", "CSSButtonStyle")
		End If
	End Sub

	Public Sub ViewAppPDF(ByVal aEntityID As String, ByVal aDefinitionID As String)
		Dim aHref As String
		aHref = CType(WebAppl, cEGAppl).Build_ReportOutput_EntityID_URL(aEntityID, aDefinitionID, "False")
		ctlNewWindowOpener.NewWindowURL = aHref
		ctlNewWindowOpener.Open()
	End Sub

	Protected Overrides Sub OnPreRender(ByVal e As EventArgs)
		MyBase.OnPreRender(e)
		Dim aUser As cEGUser
		Dim aStatus As Integer = 0

		Dim aWFTaskAssignmentDo As cDataObject = Me.DataObjectCollection("WfTaskAssignment")(0)

		If Not aWFTaskAssignmentDo Is Nothing Then
			aStatus = aWFTaskAssignmentDo("WfTaskStatusID")
		End If

		If aStatus = 1 Or aStatus = 4 Then
			TblSubmission.Visible = True
			TblUploads.Visible = True
			TblPostSubPDF.Visible = False
			TrViewApp.Visible = True
			TblInstructions.Visible = True
		ElseIf aStatus = 2 Then
			TblSubmission.Visible = False
			TblUploads.Visible = False
			TblPostSubPDF.Visible = True
			TrViewApp.Visible = False
			TblInstructions.Visible = False
		End If
	End Sub

	Public Sub SubmissionContent_Submit()
		Dim aValidationNode As XmlNode
		Dim aValid As Boolean

		aValidationNode = (CType(Page, cModulePage)).ValidationNode
		aWfDataObject = CType(mDataObjHash("WfTaskAssignment")(0), cWfTaskAssignment)
		aValid = Validate(aValidationNode, WebSession.DataObjectFactory)
		If aValid = False Then
			'spnValidationSummary.InnerHtml = "<span class='ValidationSummaryHeader'> " + _
			'		"Page did not save. Please correct the following items and re-submit.<br></span>"
			spnValidationSummary.InnerHtml = ""
			WriteValidationResults(aValidationNode)
		Else
			spnValidationSummary.InnerHtml = ""
			Dim aSubmitPage As cSubmissionModulePage
			Dim aApplicationWfTaskAssignmentDOL As cDataObjectList

			aSubmitPage = CType(Page, cSubmissionModulePage)
			aWfTaskAssignmentObject = aSubmitPage.WfTaskAssignmentObject
			'Set post-submission parameters. Navigate to default page of current module (i.e., the ApplicationChecklist page key, 
			'which uses SubmittedContent.ascx as its post-submission content control) 
			If aWfTaskAssignmentObject.GetRelatedPropertyDataObject("WfTask").HasProperty("WfTaskModuleConfig") AndAlso Not aWfTaskAssignmentObject.GetRelatedPropertyDataObject("WfTask.WfTaskModuleConfig") Is Nothing Then
			'If  Task is configured with Task Builder and Workflow builder
				aSubmitPage.PostSubmitModuleConfig = Request.QueryString("Config")
				aSubmitPage.PostSubmitModuleName = aWfTaskAssignmentObject.GetRelatedPropertyString("WfTask.WfTaskModule.ModuleName")
				aSubmitPage.Submit_UpdateData()

				aApplicationWfTaskAssignmentDOL = Me.DataObjectCollection("ApplicationWfTaskAssignment")
				ReportOutput_Create(aWfTaskAssignmentObject.GetPropertyInt("WfTaskAssignmentID", 0), aWfTaskAssignmentObject.GetRelatedPropertyInt("WfProjectTask.AppPDFReportKeyLink.FinalPDFReportKeyLink.ReportOutputDefinitionID", 0))
				ReportOutput_Create(aApplicationWfTaskAssignmentDOL(0).GetPropertyInt("WfTaskAssignmentID", 0), aApplicationWfTaskAssignmentDOL(0).GetRelatedPropertyInt("WfProjectTask.StaffPDFReportKeyLink.FinalPDFReportKeyLink.ReportOutputDefinitionID", 0))
				aSubmitPage.Submit_Redirect(aSubmitPage.PostSubmitModuleName, aSubmitPage.PostSubmitModuleConfig)
			End If
		End If
	End Sub


	Public Sub ReportOutput_Create(ByVal aEntityID As Integer, ByVal aDefinitionID As Integer)
		If aDefinitionID > 0 Then
			Dim aReportOutputDOL As cDataObjectList = WebSession.DataObjectFactory.GetDataObjectListWithFilter("ReportOutput", "EntityID", aEntityID, "DefinitionID", aDefinitionID)
			Dim aReportOutputDO As cDataObject
			If aReportOutputDOL.Count > 0 Then
				aReportOutputDO = aReportOutputDOL(0)
			End If
			If Not aReportOutputDO Is Nothing Then
				aReportOutputDO("GenStatus") = 0
				aReportOutputDO.SaveData()
			Else
				aReportOutputDO = WebSession.DataObjectFactory.CreateNewDataObjectFromKey("ReportOutput")
				aReportOutputDO("EntityID") = aEntityID
				aReportOutputDO("DefinitionID") = aDefinitionID
				aReportOutputDO("GenRequestDate") = DateTime.Now
				aReportOutputDO("GenStatus") = 0
				aReportOutputDO("GenResult") = "Report is in the queue to be generated."
				WebSession.DataObjectFactory.SaveDataObject(aReportOutputDO)
			End If
		End If
	End Sub

	Public Sub ValidateUploads(ByVal aSrc As Object, ByVal aArgs As ServerValidateEventArgs)
		Dim aValidationNode As XmlNode
		Dim aValid As Boolean
		aValidationNode = (CType(Page, cModulePage)).ValidationNode
		If Validate(aValidationNode, WebSession.DataObjectFactory) Then
			aArgs.IsValid = False
		Else
			aArgs.IsValid = True
		End If
   End Sub

	Private Sub WriteValidationResults(ByVal aValidationNode As XmlNode)
		Dim aValidationSectionList As XmlNodeList
		Dim aResultNodeList As XmlNodeList
		Dim aResultCode As Integer
		aValidationSectionList = aValidationNode.SelectNodes("ValidationHeader/ValidationSection")
		For Each aValidationSectionNode As XmlNode In aValidationSectionList
			aResultNodeList = aValidationSectionNode.SelectNodes("ValidationItem/Results/Result")
			 For Each aResultNode As XmlNode In aResultNodeList
			  aResultCode = cXMLDoc.AttributeToInt(aResultNode, "ResultCode", -1)
				If cXMLDoc.AttributeToBool(aResultNode, "ActualResult") And aResultCode <> 0 Then
				  'Here if there is no Message then we are not adding the row to the table
				  If cXMLDoc.AttributeToString(aResultNode, "Message", "") <> "" Then
					  spnValidationSummary.InnerHtml = spnValidationSummary.InnerHtml + cXMLDoc.AttributeToString(aResultNode, "Message", "") + "<br/>"
				  End If
			  End If
			Next

		Next
	End Sub

End Class
End Namespace