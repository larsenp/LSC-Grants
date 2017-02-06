Imports Core.DataAccess
Imports Core.DataAccess.XMLAccess
Imports System.Xml

Namespace Easygrants_Web.Controls.PageSection

Public MustInherit Class cContentManagerPreviewHtml
    Inherits Core_Web.Controls.Base.cDataPresenterCtl

'====================================================

	Protected tblCloseWindow As HtmlTable
	Protected spnCloseControl As HtmlGenericControl
		
'====================================================

	Public Sub CloseWindow()
		tblCloseWindow.Visible = True
		spnCloseControl.Visible = True
	End Sub	

'====================================================
	
End Class
End Namespace