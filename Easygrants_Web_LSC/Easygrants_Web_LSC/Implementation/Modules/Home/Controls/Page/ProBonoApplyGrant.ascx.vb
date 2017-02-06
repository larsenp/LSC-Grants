Imports System.Xml
Imports Core.DataAccess
Imports Core.DataAccess.XMLAccess
Imports Core.Web.Modules
Imports EasyGrants.Web
Imports EasyGrants.Web.User
Imports EasyGrants.Workflow
Namespace Implementation.Modules.Home.Controls.Page
    Public Class cProBonoApplyGrant
        Inherits Core_Web.Controls.Base.cLSCDataPresenterCtl

        Public Sub CreateWfTAAndRedirect(ByVal aWfTaskID As String, ByVal aProgramID As String)
            Dim aUser As cEGUser
            aUser = CType(CType(Page, cModulePage).ModuleUser, cEGUser)

            'Create grant application
            Dim aList As cDataObjectList = WebSession.DataObjectFactory.GetDataObjectListWithFilter("LscCreateSandyGrantAppl", _
              "person_id", aUser.PersonID.ToString, "wf_task_id", aWfTaskID, "program_id", aProgramID)

            'Find and redirect to application module
            Dim aWfTaskModuleDO As cDataObject = WebSession.DataObjectFactory.GetDataObjectListWithFilter("WfTaskModule", "WfTaskID", aWfTaskID, "WfTaskRoleID", "1")(0)
            Dim aModuleName As String = aWfTaskModuleDO("ModuleName")
            Dim aModuleConfig As String = aWfTaskModuleDO("ModuleConfigFilename")
            Dim aWfTaskAssignmentID As Integer = aList(0)("NewWfTAID")

            CType(WebSession, cEGSession).RedirectToModule(aModuleName, aModuleConfig, "", aWfTaskAssignmentID)

        End Sub
    End Class
End Namespace
