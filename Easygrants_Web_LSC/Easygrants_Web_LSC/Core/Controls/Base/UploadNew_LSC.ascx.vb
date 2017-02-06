Imports System.Web.UI.HtmlControls
Imports Core.DataAccess
Imports Core.Web.Modules
Imports EasyGrants.Web.User

Namespace Core_Web.Controls.Base

<ValidationPropertyAttribute("EntityAssocID")> Public MustInherit Class cUploadNew_LSC
	Inherits cUploadNew

	Protected liTemplate1 As HtmlControl
	Protected liTemplate2 As HtmlControl
	Protected liTemplate3 As HtmlControl
	Protected Table1 As HtmlTable

	Public Overrides Sub CoreCtl_Load(ByVal aSrc As Object, ByVal aEvent As System.EventArgs)
		MyBase.CoreCtl_Load(aSrc, aEvent)
		If UploadTemplateID = 0 Then
			Me.liTemplate1.Visible = False
			Me.liTemplate2.Visible = False
			Me.liTemplate3.Visible = False
			Me.Table1.Visible = False
		End If
	End Sub

	'Public Overrides ReadOnly Property UploadID() As Integer
	'	Get
	'		Dim aWfTaskAssignmentID As Integer
	'		Dim aUser As cEGUser
	'		If Not Request.QueryString("WfTaskAssignmentID") Is Nothing Then
	'			aWfTaskAssignmentID = Int32.Parse(Request.QueryString("WfTaskAssignmentID"))
	'		Else
	'			aUser = CType(CType(Page, cModulePage).ModuleUser, cEGUser)
	'			aWfTaskAssignmentID = aUser.WfTaskAssignmentID
	'		End If
	'		Dim aWfTA As cDataObject = WebSession.DataObjectFactory.GetDataObjectFromPrimaryKey("WfTaskAssignment", aWfTaskAssignmentID)
	'		Return aWfTA.GetRelatedPropertyInt("WfProjectTask.TaskUploadType")
	'	End Get
	'End Property


	'Public Overrides ReadOnly Property UploadDataObject() As cDataObject
	'	Get
	'		Dim aDO As cDataObject
	'		aDO = WebSession.DataObjectFactory.GetDataObjectFromPrimaryKey("WfProjectTaskUpload", UploadID)
	'	End Get
	'End Property

End Class
End Namespace
