Imports Core.DataAccess
Imports EasyGrants.Web
Namespace Easygrants_Web.Modules.Home.Controls.Page
Public Class cInitiateSubgrantStep2
	Inherits Core_Web.Controls.Base.cDataPresenterCtl

	Public Sub CreateWfTAAndRedirect(ByVal aGranteeProjectID As String, ByVal aPersonID As String, ByVal aUserID As String, byval aPageKey As String)
		'Create task assignment
		Dim aList As cDataObjectList = WebSession.DataObjectFactory.GetDataObjectListWithFilter("LscSubgrantsCopyStep1ToStep2", _
			"grantee_project_id", aGranteeProjectID, "person_id", aPersonID, "user_id", aUserID)

		If aList.Count > 0 Then
			Dim aWfTaskModuleDO As cDataObject = WebSession.DataObjectFactory.GetDataObjectListWithFilter("WfTaskModule", "WfTaskID", "116", "WfTaskRoleID", "1")(0)
			Dim aModuleName As String = aWfTaskModuleDO("ModuleName")
			Dim aModuleConfig As String = aWfTaskModuleDO("ModuleConfigFilename")
			Dim aWfTaskAssignmentID As Integer = aList(0)("new_wfta_id")

			CType(WebSession, cEGSession).RedirectToModule(aModuleName, aModuleConfig, aPageKey, aWfTaskAssignmentID)
		End If

	End Sub

End Class
End Namespace