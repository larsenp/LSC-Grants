Imports System.Diagnostics
Imports System.Web.UI
Imports System.Xml
Imports Core.DataAccess
Imports Core.DataAccess.XMLAccess
Imports Core_Web.Controls.Base
Imports Core.Web.Modules
Imports EasyGrants.Web.User
Imports EasyGrants.DataAccess
Imports EasyGrants.Workflow
Imports Core.Web
Imports EasyGrants.Web

Namespace Implementation.Modules.Home.Controls.Page
    Public MustInherit Class cGrantDetails
        Inherits Core_Web.Controls.Base.cEntityDataPresenterCtl
        
        Protected ctlGrantTasks As cDropDown
        Protected ctlNewWindowOpener As cNewWindowOpener
        
        Public Overrides Sub CoreCtl_Load(ByVal sender As System.Object, ByVal e As System.EventArgs)
            MyBase.CoreCtl_Load(sender, e)
            ctlGrantTasks = FindControl("ctlGrantTasks")
        End Sub
        
        Public Sub ViewPDF(ByVal aEntityID As String, ByVal aDefinitionID As String)
            Dim aHref As String
            aHref = CType(WebAppl, cEGAppl).Build_ReportOutput_EntityID_URL(aEntityID, aDefinitionID)
            ctlNewWindowOpener.NewWindowURL = aHref
            ctlNewWindowOpener.Open()
        End Sub
        
        Public Sub DocumentList_ViewConvertedUploadedFile(ByVal aPrimaryKeyValue As String)

            Dim aHref As String

			aHref = WebAppl.Build_RootURL(CorePage.GetUploadViewerControlUrl("OriginalFileViewer"))
            aHref = cWebLib.AddQuerystringParameter(aHref, "SubmittedFileID", aPrimaryKeyValue)
            ctlNewWindowOpener.NewWindowURL = aHref
            ctlNewWindowOpener.Open()

        End Sub
        
        Public Sub DocumentList_Delete(ByVal aPrimaryKeyValue As String)

			'Dim aSubmittedFile As cSubmittedFile
			'Dim aURL = Request.Url.PathAndQuery()

			'aSubmittedFile = WebSession.DataObjectFactory.GetDataObjectFromPrimaryKey("SubmittedFile", aPrimaryKeyValue)
			'aSubmittedFile.SubmittedFile_Delete()

			'The above code is commented out because , we moved this code section to cDataPresenterCtl as if there is Sharepoint Integration , then we need to delete the File from sharepoint.
			'So the delete Functionality is placed at once place in cDataPresenterCtl Class.
			SubmittedFile_Delete(aPrimaryKeyValue)

			CorePage.Redirect()

		End Sub
        
        Public Sub CreateGrantTask()
			Dim aWfProjectTaskID As String = ctlGrantTasks.SelectedValue()
		If Not aWfProjectTaskID = "" Then
			Dim aWfTADO As cDataObject = WebSession.DataObjectFactory.CreateNewDataObjectFromKey("WfTaskAssignment")
			Dim aGranteeProjectID As String = Request.QueryString("GranteeProjectID")
			Dim aGPDO As cDataObject = WebSession.DataObjectFactory.GetDataObjectFromPrimaryKey("GranteeProject", aGranteeProjectID)
			Dim aWfProjectTaskDO As cDataObject = WebSession.DataObjectFactory.GetDataObjectFromPrimaryKey("WfProjectTask", aWfProjectTaskID)
			Dim aWfTaskRoleDO As cDataObject = WebSession.DataObjectFactory.GetDataObjectListWithFilter("WfTaskRole", "TaskTypeID", "8", "IsDefault", "True")(0)
			Dim aWfTaskRoleID As String = "114"
			If Not aWfTaskRoleDO Is Nothing Then
				aWfTaskRoleID = aWfTaskRoleDO.GetPropertyString("WfTaskRoleID")
			End If
			aWfTADO("GranteeProjectID") = Convert.ToInt32(aGranteeProjectID)
			aWfTADO("PersonID") = aGPDO.GetPropertyInt("PrimaryPersonID")
			aWfTADO("WfTaskID") = aWfProjectTaskDO.GetPropertyInt("WfTaskID")
			aWfTADO("WfTaskRoleID") = aWfTaskRoleID
			aWfTADO("WfTaskStatusID") = aWfProjectTaskDO.GetPropertyInt("DefaultStatusID")
			aWfTADO("WfTaskOutcomeID") = aWfProjectTaskDO.GetPropertyInt("DefaultOutcomeID")
			aWfTADO.SaveData()
		End If
		CorePage.Redirect()
	End Sub

    End Class
End Namespace 'Easygrants_Web.Modules.Staff.Controls.Page
