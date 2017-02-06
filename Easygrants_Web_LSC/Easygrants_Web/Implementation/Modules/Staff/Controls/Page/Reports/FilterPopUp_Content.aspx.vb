Imports System.Diagnostics
Imports System.Xml
Imports Core.DataAccess
Imports Core.DataAccess.XMLAccess
Imports Core.DataAccess.DBAccess
Imports Core.Web
Imports Core.Web.Modules
Imports EasyGrants.Web
Imports EasyGrants.Web.User
Imports System.Net

Namespace Easygrants_Web.Modules.Staff.Controls.Page.Reports

Public MustInherit Class cFilterPopUp_Content
	Inherits Core.Web.cCorePage
'=============================================================

'Protected spnStyles As HtmlGenericControl

'=============================================================

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

	Public Overrides Sub CorePage_Load(ByVal sender As System.Object, ByVal e As System.EventArgs)
		'Set Href property for technical support link

		'CorePage_LoadStyles(spnStyles)
    End Sub
	'Public Overrides Sub CoreCtl_Load(ByVal sender As System.Object, ByVal e As System.EventArgs)
	'	MyBase.CoreCtl_Load(sender, e)
		
	'	me.WebSession.Remove_All_NonStaff_Users()
		
	'	if me.WebSession.Users("cEGHomeUser") is nothing then
	'		dim aUser as cEGUser = new cEGUser(ctype(me.WebSession.Users("cEGStaffUser"), cEGUser))
	'		aUser.AccessLevel = 1
	'		me.WebSession.Users.Add("cEGHomeUser", aUser)
	'	end if	
		
	'	'dim aUserService as New grant_user_insert_agService()
	'	'dim aCredentials as new NetworkCredential("iappsguest", "myguest54pass")
	'	'aUserService.Credentials = aCredentials
	'	'dim aUserID as String = aUserService.userCreate("4")
	'	'response.Write(aUserID)
		
	'	'dim aDR as IDataReader = ctype(me.WebSession.DataObjectFactory.GetDataProvider("EGDatabase"), _
	'	'	cDataProviderSQL).DBConn.FillDataReader("select * from c_TITLE")
	'	'while aDR.Read()
	'	'	response.Write(aDR("abbr"))
	'	'end while
	'	'aDR.Close()
	'End Sub

'=============================================================
End Class

End Namespace 'Easygrants_Web.Modules.Staff.Controls.Page
