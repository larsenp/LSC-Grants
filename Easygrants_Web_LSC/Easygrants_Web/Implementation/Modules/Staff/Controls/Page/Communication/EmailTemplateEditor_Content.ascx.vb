Imports Core.Web
Imports Core.DataAccess
Imports Core.DataAccess.XMLAccess
Imports Core.Web.Modules
Imports Core_Web.Controls.Base
Imports EasyGrants.Web
Imports EasyGrants.Web.User
Imports EasyGrants.Correspondence
Imports System.Xml
Imports EasyGrants.DataAccess.Report
Imports System.Text

Namespace Easygrants_Web.Modules.Staff.Controls.Page

Public MustInherit Class cEmailTemplateEditor_Content
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
    
	Protected mHTMLFormat as cRadioButtonList
    Protected mEmailLog as cRadioButtonList

'=============================================================

   Public Overrides Sub CoreCtl_Load(ByVal sender As System.Object, ByVal e As System.EventArgs)
        MyBase.CoreCtl_Load(sender, e)
		
		If Not IsPostBack Then
			mHTMLFormat = FindControl("ctlHTMLFormat")
			mHTMLFormat.SelectedField = "False"
			
			mEmailLog = FindControl("ctlEmailLog")
			mEmailLog.SelectedField = "True"
		End If

    End Sub
    
        '=============================================================
        Public Sub ModulePage_RedirectToModule(ByVal aModuleName As String, ByVal aModuleConfig As String, ByVal aPageKey As String)
            Dim aURL As StringBuilder = New StringBuilder
            aURL.Append(WebAppl.Get_ModuleRoot(aModuleName) + "/" + aModuleName + "/" + "ModuleContent.aspx" + "?Config=" + aModuleConfig + "&Page=" + aPageKey)
            Response.Redirect(aURL.ToString)
        End Sub

        '=============================================================
End Class 'cEmailTemplateEditor_Content

End Namespace 'Easygrants_Web.Modules.Staff.Controls.Page
