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

Namespace Easygrants_Web.Modules.Staff.Controls.PageContent
Public MustInherit Class cConflictByApp
    Inherits Core_Web.Controls.Base.cDataPresenterCtl

'=============================================================

	Protected ctlPerson As cDropDown
	Protected ctlConflict as cDropDown
    Protected spnName As HtmlGenericControl
    Protected spnInst as HtmlGenericControl
    Protected trInst as HtmlTableRow
    Protected tdInst as HtmlTableCell
    
'=============================================================

	Public Overrides Sub CoreCtl_Load(ByVal aSrc As Object, ByVal aEvent As EventArgs)
		MyBase.CoreCtl_Load(aSrc, aEvent)
	End Sub
	
'=============================================================

End Class
End Namespace
