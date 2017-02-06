'Imports System.Diagnostics
'Imports System.Web.UI
'Imports System.Xml
'Imports System.Text
'Imports Core.DataAccess
'Imports Core.DataAccess.XMLAccess
'Imports Core.Web
'Imports Core_Web.Controls.Base
'Imports Core.Web.Modules
'Imports EasyGrants.Workflow
'Imports EasyGrants.Web.User

Namespace Easygrants_Web.Modules.Staff.Controls.Page

Public MustInherit Class cProjectReportEditor
    Inherits Core_Web.Controls.Base.cDataPresenterCtl
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

'=============================================================

	Public ReadOnly Property WfProjectID() As String
		Get
            If Not Request.QueryString("WfProjectID") Is Nothing Then
                Return Request.QueryString("WfProjectID")
            Else
                Return ""
            End If
		End Get
	End Property

'=============================================================

    'Public Overrides Sub CoreCtl_Load(ByVal sender As System.Object, ByVal e As System.EventArgs)
    '    MyBase.CoreCtl_Load(sender, e)
    'End Sub

'=============================================================

 '   Public Overloads Overrides Function EventController_Save() As Boolean
 '  		Dim aURL As String
	'	aURL = Request.QueryString("ReturnURL")
       
 '       MyBase.EventController_Save()

	'	Response.Redirect(aURL)
	'End Function

'=============================================================

	'Public Overrides Sub DataPresenter_SaveDataObjects()
 '       MyBase.DataPresenter_SaveDataObjects()
	'End Sub

'=============================================================
End Class

End Namespace 'Easygrants_Web.Modules.Staff.Controls.Page
