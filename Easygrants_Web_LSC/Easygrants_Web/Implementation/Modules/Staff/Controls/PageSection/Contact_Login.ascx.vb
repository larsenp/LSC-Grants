Imports System.Diagnostics
Imports System.Web.UI
Imports System.Xml
Imports Core.DataAccess
Imports Core.DataAccess.XMLAccess
Imports Core.Web
Imports Core_Web.Controls.Base
Imports Core.Web.Modules
Imports EasyGrants.Workflow
Imports EasyGrants.Web.User
Imports EasyGrants.Web
Imports EasyGrants.Correspondence


Namespace Easygrants_Web.Modules.Staff.Controls.PageSection
Public MustInherit Class cContact_Login
	Inherits Core_Web.Controls.Base.cDataObjectEditor
'=============================================================

	Protected tbLogin As HtmlTable
	Protected tbAdd As HtmlTable
	Protected tdOpt As HtmlTableCell
	Protected spnEdit As HtmlGenericControl
	Protected spnDelete As HtmlGenericControl
	Protected spnAdd As HtmlGenericControl
	Protected spnClickAdd As HtmlGenericControl
	
'=============================================================

	Public Overrides Sub CoreCtl_Load(ByVal aSrc As Object, ByVal aEvent As EventArgs)
		MyBase.CoreCtl_Load(aSrc, aEvent)

		Dim aUser As cEGUser = CType(CType(Page, cModulePage).ModuleUser, cEGUser)
		dim aList as cDataObjectList = CType(DataObjectCollection("User"), cDataObjectList)
		
		If aUser.AccessLevel < 3 and aList.Count > 0 Then
			if aList(0).GetPropertyInt("UserTypeID", 0) > 1 Then
				'tdOpt.Visible = False
				spnEdit.Visible = False
				spnDelete.Visible = False
				spnAdd.Visible = False
				spnClickAdd.Visible = False
			end if
		End If

		If aList.Count = 0 Then
			tbLogin.Visible = False
		Else
			tbAdd.Visible = False
		End If
	End Sub

'--------------------------------------------------------------

  Public Sub Delete()
	Dim aUrl As String = Request.RawUrl.ToString()
	WebSession.DataObjectFactory.DeleteData(DataObjectCollection("User"))
	Response.Redirect(aUrl)
  End Sub


        Public Sub SendPassword()
            Dim aUserDO As cDataObject = DataObjectCollection("User")(0)
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
        End Sub


        '=============================================================
End Class
End Namespace