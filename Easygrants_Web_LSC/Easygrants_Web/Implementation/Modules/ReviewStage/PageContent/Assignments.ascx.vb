Imports System.Xml
Imports Core.DataAccess
Imports Core.DataAccess.XMLAccess
Imports Core_Web.Controls.Base
Imports Core.Web.Modules
Imports EasyGrants.Web
Imports EasyGrants.Web.Modules
Imports EasyGrants.Workflow
Imports EasyGrants.Web.User
Imports Core.Web
Imports System.Text

Namespace Implementation.Modules.ReviewStage.PageContent
Public MustInherit Class cAssignments
	Inherits Core_Web.Controls.Base.cDataPresenterCtl
	
'========================================================================

	Protected tblCloseWindow as HtmlTable
	Protected spnCloseControl as HtmlGenericControl
	'Protected tblSubmit As HtmlTable

'========================================================================

   Public Overrides Sub CoreCtl_Load(ByVal sender As System.Object, ByVal e As System.EventArgs)
        MyBase.CoreCtl_Load(sender, e)
	End Sub	
   
'-------------------------------------------------
	
	Public Sub CloseWindow()
		tblCloseWindow.Visible = True
		spnCloseControl.Visible = True
	End Sub	
	
'==============================================================

End Class
End Namespace