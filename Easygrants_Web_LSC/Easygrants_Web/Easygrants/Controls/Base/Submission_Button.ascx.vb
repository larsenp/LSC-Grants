Imports System.Xml
Imports Core.DataAccess
Imports Core.DataAccess.XMLAccess
Imports Core.Web.Modules
Imports Core_Web.Controls.Base
Imports EasyGrants.Workflow
Imports EasyGrants.Web.Modules
Imports Easygrants_Web.Modules.LOI

Namespace EasyGrants.Modules.Application.Controls.Page

Public MustInherit Class cSubmission_Button
    Inherits Easygrants_Web.Controls.Base.cValidationDataPresenterCtl
'=================================================

	Protected spnSubmitButton As HtmlGenericControl
	Private aWfTaskModuleObject As cWfTaskAssignment
	Protected mForceGen As Boolean = True
	Private aWfDataObject As cWfTaskAssignment
	Protected mNotifyThirdParty As Boolean = False

'=================================================

	Public Property ForceGen() As Boolean
		Get
			Return mForceGen
		End Get
		Set(ByVal Value As Boolean)
			mForceGen = Value
		End Set
	End Property

	Public Property NotifyThirdParty() As Boolean
		Get
			Return mNotifyThirdParty
		End Get
		Set(ByVal Value As Boolean)
			mNotifyThirdParty = Value
		End Set
	End Property

'=================================================

	Public Overrides Sub CoreCtl_Load(ByVal aSrc As Object, ByVal aEvent As EventArgs)
		MyBase.CoreCtl_Load(aSrc, aEvent)
		
		Dim aValidationNode As XmlNode
		Dim aValid As Boolean


		aValidationNode = (CType(Page, cModulePage)).ValidationNode
		aWfDataObject = CType(mDataObjHash("WfTaskAssignment")(0), cWfTaskAssignment)

		'aValid = Validate(aValidationNode, WebSession.DataObjectFactory)

		If Not Valid Then
			'spnInvalidText.Visible = True
			spnSubmitButton.Visible = False
		Else
			'if aWfDataObject.GetPropertyInt("WfTaskStatusID") = 1 then
			'	spnSubmitText.Visible = True
			'end if
		End If
	End Sub

'-------------------------------------------------

	Public Overridable Sub SubmissionContent_Submit()

		Dim aSubmitPage As cSubmissionModulePage
		Dim aPersonRelationshipDOL As cDataObjectList
		Dim aWfStatusID As Integer = -1
		Dim aWftaReopenRequestDOL As cDataObjectList

		aSubmitPage = CType(Page, cSubmissionModulePage)
		aWfTaskModuleObject = aSubmitPage.WfTaskAssignmentObject
		aWfStatusID = aWfTaskModuleObject.GetPropertyInt("WfTaskStatusID", "-1")
		'Set post-submission parameters. Navigate to default page of current module (i.e., the ApplicationChecklist page key, 
		'which uses SubmittedContent.ascx as its post-submission content control) 
		If aWfTaskModuleObject.GetRelatedPropertyDataObject("WfTask").HasProperty("WfTaskModuleConfig") AndAlso Not aWfTaskModuleObject.GetRelatedPropertyDataObject("WfTask.WfTaskModuleConfig") Is Nothing Then
		'If  Task is configured with Task Builder and Workflow builder
			aSubmitPage.PostSubmitModuleConfig = Request.QueryString("Config")
			aSubmitPage.PostSubmitModuleName = aWfTaskModuleObject.GetRelatedPropertyString("WfTask.WfTaskModule.ModuleName")
			aSubmitPage.Submit_UpdateData()

			''If the current task assignment status is Resubmit and once its resubmitted make the requesting task assignment incomplete 
			'If aWfStatusID = 4 Then
			'	aWftaReopenRequestDOL = WebSession.DataObjectFactory.GetDataObjectListWithFilter("WftaReopenRequest", "ReopenWfTaskAssignmentID", aWfTaskModuleObject.GetPropertyInt("WfTaskAssignmentID", "-1"))
			'	If aWftaReopenRequestDOL.Count > 0 Then
			'		Dim aRequestingWfTaskAssignmentDO As cDataObject
			'		aRequestingWfTaskAssignmentDO = aWftaReopenRequestDOL(0).GetRelatedPropertyDataObject("RequestingWfTaskAssignment")
			'		aRequestingWfTaskAssignmentDO("WfTaskStatusID") = 1
			'		aRequestingWfTaskAssignmentDO.SaveData()
			'	End If
			'End If


			If NotifyThirdParty = True Then
				SubmissionContent_NotifyThirdParty()
			End If

			ReportOutput_Create(aWfTaskModuleObject.GetPropertyInt("WfTaskAssignmentID", 0), aWfTaskModuleObject.GetRelatedPropertyInt("WfProjectTask.AppPDFReportKeyLink.FinalPDFReportKeyLink.ReportOutputDefinitionID", 0))
			aSubmitPage.Submit_Redirect(aSubmitPage.PostSubmitModuleName, aSubmitPage.PostSubmitModuleConfig)
		Else
			'Task submission the old way
			aSubmitPage.PostSubmitModuleConfig = Request.QueryString("Config")
			If aSubmitPage.PostSubmitModuleConfig <> "" Then
				If aSubmitPage.PostSubmitModuleConfig = "ProgressReportConfig" Then
					aSubmitPage.PostSubmitModuleName = "ProgressReport"
				ElseIf aSubmitPage.PostSubmitModuleConfig = "LOIModuleConfig" Then
					aSubmitPage.PostSubmitModuleName = "LOI"
					aSubmitPage.Submit_UpdateData()
					Dim aReportOutputDO As cDataObject = aWfDataObject.GetRelatedPropertyDataObject("ReportOutput")
					aReportOutputDO("GenStatus") = 0
					aReportOutputDO.SaveData()
					aSubmitPage.Submit_Redirect(aSubmitPage.PostSubmitModuleName, aSubmitPage.PostSubmitModuleConfig)
				ElseIf aSubmitPage.PostSubmitModuleConfig = "ApplModuleConfig" Then
					aSubmitPage.PostSubmitModuleName = "Application"
					aSubmitPage.Submit_UpdateData()
					Dim aReportOutputDO As cDataObject = aWfDataObject.GetRelatedPropertyDataObject("ReportOutput")
					aReportOutputDO("GenStatus") = 0
					aReportOutputDO.SaveData()
					aSubmitPage.Submit_Redirect(aSubmitPage.PostSubmitModuleName, aSubmitPage.PostSubmitModuleConfig)
				End If
			End If
		End If

		aSubmitPage.Submit(ForceGen)

	End Sub

	Public Sub SubmissionContent_NotifyThirdParty()
			Dim aPersonRelationshipDOL As cDataObjectList
			aPersonRelationshipDOL = WebSession.DataObjectFactory.GetDataObjectListWithFilter("PersonRelationship", "PersonID", aWfTaskModuleObject.GetPropertyString("PersonID"), "TaskID", aWfTaskModuleObject.GetPropertyString("WfTaskID"), "GranteeProjectID", aWfTaskModuleObject.GetPropertyString("GranteeProjectID"))
			If aPersonRelationshipDOL.Count > 0 Then
				For Each aPersonRelationshipDO As cDataObject In aPersonRelationshipDOL
					CType(Page, cSubmissionModulePage).SelectAndNotifyThirdParty(aPersonRelationshipDO.GetPropertyString("PersonRelationshipID"), "False")
				Next
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
					aReportOutputDO("SharepointConversionStatus") = 0
					aReportOutputDO.SaveData()
				Else
					aReportOutputDO = WebSession.DataObjectFactory.CreateNewDataObjectFromKey("ReportOutput")
					aReportOutputDO("EntityID") = aEntityID
					aReportOutputDO("DefinitionID") = aDefinitionID
					aReportOutputDO("GenRequestDate") = DateTime.Now
					aReportOutputDO("GenStatus") = 0
					aReportOutputDO("SharepointConversionStatus") = 0
					aReportOutputDO("GenResult") = "Report is in the queue to be generated."
					WebSession.DataObjectFactory.SaveDataObject(aReportOutputDO)
				End If
			End If
		End Sub

'=================================================
End Class
End Namespace