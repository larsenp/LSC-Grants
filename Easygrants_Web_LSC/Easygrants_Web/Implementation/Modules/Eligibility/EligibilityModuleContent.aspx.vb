Imports System.Xml
Imports System.Diagnostics
Imports Core.Web.Navigation
Imports Core.DataAccess
Imports Core.DataAccess.XMLAccess
Imports EasyGrants.Workflow
Imports EasyGrants.Web.User

Namespace Easygrants_Web.Modules.Eligibility

Public Class cEligibilityModuleContent
	Inherits EasyGrants.Web.Modules.cSubmissionModulePage

'=============================================================

	Public Overrides Sub CorePage_Load(ByVal aSrc As Object, ByVal aEvent As EventArgs)
		 MyBase.CorePage_Load(aSrc, aEvent)

		If Not ModuleUser.MasterNavElement Is Nothing Then
			Dim aReturnHomeNavElement As cNavElement
			aReturnHomeNavElement = ModuleUser.MasterNavElement.Find_ChildElement("ReturnHome")
			If Not aReturnHomeNavElement Is Nothing Then
				aReturnHomeNavElement.Visible = True
				aReturnHomeNavElement.Enabled = True
				'aReturnHomeNavElement.SourceFile = WebAppl.Remove_RootFromURL(aModuleState.LastURL)
				End If


				Dim aChangePasswordNavElement As cNavElement
				aChangePasswordNavElement = ModuleUser.MasterNavElement.Find_ChildElement("ChangePassword")
				If Not aChangePasswordNavElement Is Nothing Then
					aChangePasswordNavElement.Visible = True
					aChangePasswordNavElement.Enabled = True
					'aChangePasswordNavElement.SourceFile = WebAppl.Remove_RootFromURL(aModuleState.LastURL)
				End If

				Dim aFTFEligibilityNavElement As cNavElement
				aFTFEligibilityNavElement = ModuleUser.MasterNavElement.Find_ChildElement("FTFEligibility")
				If Not aFTFEligibilityNavElement Is Nothing Then
					aFTFEligibilityNavElement.Visible = True
					aFTFEligibilityNavElement.Enabled = True
					'aFTFEligibilityNavElement.SourceFile = WebAppl.Remove_RootFromURL(aModuleState.LastURL)
				End If

				Dim aGuidelinesNavElement As cNavElement
				aGuidelinesNavElement = ModuleUser.MasterNavElement.Find_ChildElement("Guidelines")
				If Not aGuidelinesNavElement Is Nothing Then
					aGuidelinesNavElement.Visible = True
					aGuidelinesNavElement.Enabled = True
					'aGuidelinesNavElement.SourceFile = WebAppl.Remove_RootFromURL(aModuleState.LastURL)
				End If
			End If

	End Sub

'=============================================================

  Public Overloads Overrides Sub Submit(ByVal aPersonDataObject As cDataObject, ByVal aModuleName As String, ByVal aModuleConfig As String, ByVal aPageKey As String)
		Dim aWfTaskObject As cDataObject
		Dim aGranteeWfTaskObject As cDataObject
		Dim aOutcomeXmlDoc As cXMLDoc = New cXMLDoc()
		Dim aOutcomeID As Integer
		Dim aOutcomeConfig As String
		Dim aOutcomeModule As String
		Dim aCompetitionID As Integer
		Dim aOutcomeNode As XmlNode

		If Not WfTaskAssignmentObject("WfTaskStatusID") = 2 Then

			'set Eligibility Task to Completed    
			'WfTaskAssignmentObject("WfTaskStatusID") = 2 'completed
			'Added NS:10/12/04 for updating submitted date
			'WfTaskAssignmentObject("SubmittedDate") = System.DateTime.Now.ToString()
			'Checking eligibility
			Dim aIsEligible As Boolean = False

			Dim aWfProjectTaskID = WebSession.DataObjectFactory.GetDataObjectListWithFilter("WfProjectTask", "WfProjectID", WfTaskAssignmentObject.GetRelatedPropertyString("GranteeProject.WfProjectID"), "WfTaskID", WfTaskAssignmentObject.GetPropertyString("WfTaskID"))(0).GetPropertyString("WfProjectTaskID")
			Dim aEligibilityDOL As cDataObjectList = WebSession.DataObjectFactory.GetDataObjectListWithFilter("Eligibility", "GranteeProjectID", WfTaskAssignmentObject.GetPropertyString("GranteeProjectID"), "WfProjectTaskID", aWfProjectTaskID)

			Dim aEligibilityDO As cDataObject
			for each aEligibilityDO in aEligibilityDOL
				Dim aWFProjectTaskEligibilityAnswerDO As cDataObject = WebSession.DataObjectFactory.GetDataObjectListWithFilter("WFProjectTaskEligibilityAnswer", "WfProjectTaskID", aWfProjectTaskID, "QuestionID", aEligibilityDO("QuestionID"))(0)
				If aEligibilityDO("AnswerID") = aWFProjectTaskEligibilityAnswerDO.GetRelatedPropertyString("ValidAnswerID") Then
					aIsEligible = True
				Else
					aIsEligible = False
					Exit For
				End If
			Next

			If WfTaskAssignmentObject.GetRelatedPropertyDataObject("WfTask").HasProperty("WfTaskModuleConfig") AndAlso Not WfTaskAssignmentObject.GetRelatedPropertyDataObject("WfTask.WfTaskModuleConfig") Is Nothing Then
				'If Eligibility Task is configured with Task Builder and Workflow builder
				Dim aWfTaskOutcomeDO As cDataObject = Nothing
				If aIsEligible Then
					aWfTaskOutcomeDO = WebSession.DataObjectFactory.GetDataObjectListWithFilter("WfTaskOutcome", "WfTaskID", WfTaskAssignmentObject("WfTaskID"), "WfTaskOutcome_Abbr", "Eligible")(0)
					Dim WfTaskOutcomeID As Integer = aWfTaskOutcomeDO("WfTaskOutcomeID")
					WfTaskAssignmentObject("WfTaskOutcomeID") = WfTaskOutcomeID
				Else
					aWfTaskOutcomeDO = WebSession.DataObjectFactory.GetDataObjectListWithFilter("WfTaskOutcome", "WfTaskID", WfTaskAssignmentObject("WfTaskID"), "WfTaskOutcome_Abbr", "NotEligible")(0)
					Dim WfTaskOutcomeID As Integer = aWfTaskOutcomeDO("WfTaskOutcomeID")
					WfTaskAssignmentObject("WfTaskOutcomeID") = WfTaskOutcomeID
				End If
			Else
				'Eligibility the old way
				If aIsEligible Then
					Dim aWFTaskEligibilityOutcomeDO As cDataObject = WebSession.DataObjectFactory.GetDataObjectListWithFilter("WFProjectTaskEligibilityOutcome", "WfProjectTaskID", aWfProjectTaskID, "EligibilityStatusID", 1)(0)
					Dim WfTaskOutcomeID As Integer = aWFTaskEligibilityOutcomeDO("WFTaskOutcomeID")
					WfTaskAssignmentObject("WfTaskOutcomeID") = WfTaskOutcomeID
				Else
					Dim aWFTaskEligibilityOutcomeDO As cDataObject = WebSession.DataObjectFactory.GetDataObjectListWithFilter("WFProjectTaskEligibilityOutcome", "WfProjectTaskID", aWfProjectTaskID, "EligibilityStatusID", 2)(0)
					Dim WfTaskOutcomeID As Integer = aWFTaskEligibilityOutcomeDO("WFTaskOutcomeID")
					WfTaskAssignmentObject("WfTaskOutcomeID") = WfTaskOutcomeID
				End If
			End If
			'Save the outcome
			WebSession.DataObjectFactory.SaveDataObject(WfTaskAssignmentObject)

			Submit_UpdateData()
			
		End If
		ModulePage_RedirectToPageKey("EligibilityConfirm")

  End Sub

'=============================================================
End Class 'cModuleContent

End Namespace 'Easygrants_Web.Modules.Eligibility