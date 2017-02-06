Imports Core.DataAccess
Imports EasyGrants.Web
Imports Easygrants.Workflow

Namespace Easygrants.Controls.PageSection

	Public Class cToDoList_SubgrantApprovalStep2
		Inherits Core_Web.Controls.Base.cLSCDataPresenterCtl

		Public Overridable Sub CreateSubgrantModificationRequestStep2(ByVal aGranteeProjectID As String, ByVal aPersonID As String)
			'Create new task assignment
			Dim aWfTA As cWfTaskAssignment = WebSession.DataObjectFactory.CreateNewDataObjectFromKey("WfTaskAssignment")
			aWfTA("GranteeProjectID") = aGranteeProjectID
			aWfTA("PersonID") = aPersonID
			aWfTA("WfTaskStatusID") = 1
			aWfTA("WfTaskID") = 73
			aWfTA("StartDate") = System.DateTime.Now()
			aWfTA("OpenDate") = System.DateTime.Now()
			aWfTA("WfTaskRoleID") = 1
			aWfTA.SaveData()

			'Set outcome based on default outcome id set in workflow
			aWfTA("WfTaskOutcomeID") = aWfTA.GetRelatedPropertyInt("WfProjectTask.DefaultOutcomeID")

			'Set due, close, and end dates based on the subgrant end date indicated in the original application
			Dim aAppList As cDataObjectList = WebSession.DataObjectFactory.GetDataObjectListWithFilter("WfTaskAssignment", _
			   "GranteeProjectID", aGranteeProjectID, _
			   "WfTaskID", "116")
			If aAppList.Count > 0 Then
				Dim aDate As System.DateTime = aAppList(0).GetRelatedPropertyValue("LscWfTASubgrant.EndDate")
				aWfTA("DueDate") = aDate
				aWfTA("CloseDate") = aDate
				aWfTA("EndDate") = aDate
			End If
			aWfTA.SaveData()

			'Redirect to module
			CType(WebSession, cEGSession).RedirectToModule("Application", "RequestSubgrantModification73Config", "", aWfTA.GetPropertyString("WfTaskAssignmentID"))


		End Sub

	End Class

End Namespace
