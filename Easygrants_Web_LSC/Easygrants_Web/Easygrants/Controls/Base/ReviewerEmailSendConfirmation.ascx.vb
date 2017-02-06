Imports Core.Web.Modules
Imports EasyGrants.Web.User
Imports EasyGrants.Correspondence
Imports Core_Web.Controls.Base

Namespace Easygrants_Web.Controls.Base

Public MustInherit Class cReviewerEmailSendConfirmation
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
    Private mEmailArgs As IEmailArgs
    Protected spnDisplayName As HtmlGenericControl
    Protected spnCount As HtmlGenericControl
   
'=============================================================

   Public Overrides Sub CoreCtl_Load(ByVal sender As System.Object, ByVal e As System.EventArgs)
        MyBase.CoreCtl_Load(sender, e)

        Dim aReturnLink As cLink
        aReturnLink = CType(FindControl("lnkReturn"), cLink)
      
        mEmailArgs = CType(CType(WebSession.CurrentPage, cModulePage).ModuleUser, cEGStaffUser).EmailArgs
		spnDisplayName.InnerText = me.Request.QueryString("list")
		spnCount.InnerText = me.Request.QueryString("cnt")
		
        If Not mEmailArgs Is Nothing Then
            spnDisplayName.InnerText = mEmailArgs.GetDisplayNameEmailList()
			aReturnLink.Caption = "Return to " & CType(WebSession.CurrentPage, cModulePage).ModulePage_GetTitle(Request.QueryString("ReturnPageKey"))
            spnCount.InnerText = mEmailArgs.BaseDataObjList.Count
        End If

        'set the EmailArgs of off StaffUser to null
        CType(CType(WebSession.CurrentPage, cModulePage).ModuleUser, cEGStaffUser).EmailArgs = Nothing
    End Sub

'=============================================================
End Class 'cReviewerEmailSendConfirmation

End Namespace 'Easygrants_Web.Controls.Base
