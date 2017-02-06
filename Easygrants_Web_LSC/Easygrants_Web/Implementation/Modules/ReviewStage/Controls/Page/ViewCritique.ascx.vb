Imports Core.DataAccess
Imports Core_Web.Controls.Base
Imports System.Xml
Imports Core.DataAccess.XMLAccess
Imports Core.Web.Modules
Imports EasyGrants.Web.User
Imports EasyGrants.Web
Imports Core.Web


Namespace Easygrants_Web.Implementation.Modules.ReviewStage.Controls.Page

Public MustInherit Class cViewCritique
	Inherits Core_Web.Controls.Base.cEntityDataPresenterCtl

		Protected tblCloseWindow As HtmlTable
		Protected spnCloseControl As HtmlGenericControl

		Public Sub CloseWindow()
			tblCloseWindow.Visible = True
			spnCloseControl.Visible = True
		End Sub
	End Class

End Namespace