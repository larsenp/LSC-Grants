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
    Public MustInherit Class cAbstractUpload

        Inherits Core_Web.Controls.Base.cDataPresenterCtl

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
   
    End Class
End Namespace