Imports System.Diagnostics
Imports System.Web.UI
Imports Core.DataAccess
Imports Core.DataAccess.XMLAccess
Imports System.Xml
Imports EasyGrants.Workflow
Imports Core_Web.Controls.Base
Imports Core.Web.Modules
Imports EasyGrants.Web.User
Imports Core.Web
Imports System.Text
Imports Core.Web.SvrCtls
Imports EasyGrants.Correspondence


Namespace Easygrants_Web.Modules.Staff.Controls.PageContent
Public MustInherit Class cGrantPrimaryContact
	Inherits Core_Web.Controls.Base.cDataObjectEditor

	Protected spnErrorMsg As HtmlGenericControl

	Public Overrides Sub CoreCtl_Load(ByVal aSrc As Object, ByVal aEvent As EventArgs)
		MyBase.CoreCtl_Load(aSrc, aEvent)

	End Sub
Public Sub SendPassword()
Dim aGranteeProjList As cDataObjectList
aGranteeProjList = Me.DataObjectCollection("GranteeProject")

Dim aUserList As cDataObjectList = WebSession.DataObjectFactory.GetDataObjectListWithFilter("User", _
						"PersonID", aGranteeProjList(0).GetPropertyInt("PrimaryPersonID", 0))

		If aUserList.Count > 0 Then
			Dim aUserDO As cDataObject = aUserList(0)
			Dim aCorrespondenceDefinitionID As String
			Dim aCorrespondenceDefinition As cDataObject
			aCorrespondenceDefinitionID = "12"
			aCorrespondenceDefinition = WebSession.DataObjectFactory.GetDataObjectFromPrimaryKey("CorrespondenceDefinition", aCorrespondenceDefinitionID)
			Dim aUserID As Integer = CType(WebSession.User("cEGStaffUser"), cEGUser).UserID
			Dim aCorrespondenceJob As cCorrespondenceJob = New cCorrespondenceJob(aUserID)
			aCorrespondenceJob.EmailArgs = New cEmailArgsDataObject(aUserDO.DataObjectList)
			aCorrespondenceJob.CorrespondenceDefinition = aCorrespondenceDefinition
			aCorrespondenceJob.SendEmail(WebSession.DataObjectFactory.Appl)
			aUserDO("PasswordLastSentDate") = DateTime.Now
			aUserDO.SaveData()
			CorePage.Redirect()
			spnErrorMsg.Visible = False
		Else
			spnErrorMsg.Visible = True
		End If
		End Sub
End Class
End Namespace