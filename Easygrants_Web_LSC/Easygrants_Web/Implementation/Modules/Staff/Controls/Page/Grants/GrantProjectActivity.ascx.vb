Imports System.Xml
Imports Core.DataAccess
Imports Core.DataAccess.XMLAccess
Imports Core_Web.Controls.Base
Imports Core.Web

Namespace Easygrants_Web.Modules.Staff.Controls.Page.Grants

Public MustInherit Class cGrantProjectActivity
    Inherits Core_Web.Controls.Base.cDataPresenterCtl

	Protected ctlGrantTasks As cDropDown

#Region " Web Form Designer Generated Code "

    'This call is required by the Web Form Designer.
    <System.Diagnostics.DebuggerStepThrough()> Private Sub InitializeComponent()

    End Sub

    Private Sub Page_Init(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Init
        'CODEGEN: This method call is required by the Web Form Designer
        'Do not modify it using the code editor.
        InitializeComponent()
    End Sub

#End Region

	Public Overrides Sub CoreCtl_Load(ByVal aSrc As Object, ByVal aEvent As EventArgs)
		MyBase.CoreCtl_Load(aSrc, aEvent)
		ctlGrantTasks = FindControl("ctlGrantTasks")
	End Sub
	
 '   Public Sub CreateGrantTask()
	'	Dim aWfProjectTaskID As String = ctlGrantTasks.SelectedValue()
	'	If Not aWfProjectTaskID = "" Then
	'		Dim aWfTADO As cDataObject = WebSession.DataObjectFactory.CreateNewDataObjectFromKey("WfTaskAssignment")
	'		Dim aGranteeProjectID As String = Request.QueryString("GranteeProjectID")
	'		Dim aGPDO As cDataObject = WebSession.DataObjectFactory.GetDataObjectFromPrimaryKey("GranteeProject", aGranteeProjectID)
	'		Dim aWfProjectTaskDO As cDataObject = WebSession.DataObjectFactory.GetDataObjectFromPrimaryKey("WfProjectTask", aWfProjectTaskID)
	'		Dim aWfTaskRoleDO As cDataObject = WebSession.DataObjectFactory.GetDataObjectListWithFilter("WfTaskRole", "TaskTypeID", "8", "IsDefault", "True")(0)
	'		Dim aWfTaskRoleID As String = "114"
	'		If Not aWfTaskRoleDO Is Nothing Then
	'			aWfTaskRoleID = aWfTaskRoleDO.GetPropertyString("WfTaskRoleID")
	'		End If
	'		aWfTADO("GranteeProjectID") = Convert.ToInt32(aGranteeProjectID)
	'		aWfTADO("PersonID") = aGPDO.GetPropertyInt("PrimaryPersonID")
	'		aWfTADO("WfTaskID") = aWfProjectTaskDO.GetPropertyInt("WfTaskID")
	'		aWfTADO("WfTaskRoleID") = aWfTaskRoleID
	'		aWfTADO("WfTaskStatusID") = aWfProjectTaskDO.GetPropertyInt("DefaultStatusID")
	'		aWfTADO("WfTaskOutcomeID") = aWfProjectTaskDO.GetPropertyInt("DefaultOutcomeID")
	'		aWfTADO.SaveData()
	'	End If
	'	CorePage.Redirect()
	'End Sub

End Class

End Namespace
