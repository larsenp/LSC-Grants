Imports Core.Web
Imports Core.DataAccess
Imports Core.DataAccess.XMLAccess
Imports Core.Web.Modules
Imports Core_Web.Controls.Base
Imports EasyGrants.Web
Imports EasyGrants.Workflow
Imports EasyGrants.Web.User
Imports System.Xml
Imports Core.Web.User
Imports Easygrants_Web.Controls
Imports Easygrants_Web.Controls.PageSection
Imports System.Diagnostics
Imports System.Web.UI
Imports Core.Web.SvrCtls

Namespace Easygrants_Web.Controls.PageSection
    Public MustInherit Class cOtherSupportUpload

        Inherits Core_Web.Controls.Base.cDataPresenterCtl
			Protected WithEvents spnProjectNumber As System.Web.UI.HtmlControls.HtmlGenericControl
			Protected WithEvents spnSource As System.Web.UI.HtmlControls.HtmlGenericControl
			Protected WithEvents spnInvestigator As System.Web.UI.HtmlControls.HtmlGenericControl
			Protected WithEvents spnProjectTitle As System.Web.UI.HtmlControls.HtmlGenericControl
			Protected WithEvents spnStartDate As System.Web.UI.HtmlControls.HtmlGenericControl
			Protected WithEvents spnEndDate As System.Web.UI.HtmlControls.HtmlGenericControl
			Protected WithEvents spnTotal As System.Web.UI.HtmlControls.HtmlGenericControl
			Protected WithEvents spnPICVUpload As System.Web.UI.HtmlControls.HtmlGenericControl
			Protected WithEvents spnCancel As System.Web.UI.HtmlControls.HtmlGenericControl


'============================================================= 

        'Protected ctlPICVUpload As cUpload
        'Protected ctlCoPICVUpload As cUpload
        
'============================================================= 
 
        Public Overrides Sub CoreCtl_Load(ByVal aSrc As Object, ByVal aEvent As EventArgs)
            MyBase.CoreCtl_Load(aSrc, aEvent)

   '         ctlPICVUpload = CType(FindControl("ctlPICVUpload"), cUpload)
   '         ctlCoPICVUpload = CType(FindControl("ctlCoPICVUpload"), cUpload)
            
			'ctlPICVUpload.Anchor = "aPICVUpload"
			'ctlCoPICVUpload.Anchor = "aCoPICVUpload"
			
			'if request.QueryString("Anchor") <> "" then
			'	Dim aURL as String = Request.RawUrl.ToString()
			'	aURL = Core.Web.cWebLib.RemoveQuerystringParameter(aURL, "Anchor")
			'	response.Redirect(aURL + "#" + request.QueryString("Anchor"))
			'end if

        End Sub
        
  '======================================================
   
		Private Sub InitializeComponent()

		End Sub
	End Class
End Namespace