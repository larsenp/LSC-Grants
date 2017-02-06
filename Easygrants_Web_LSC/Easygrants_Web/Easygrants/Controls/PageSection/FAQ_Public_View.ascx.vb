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

Namespace Easygrants_Web.Controls.PageSection
Public MustInherit Class cFAQ_Public_View
	Inherits Core_Web.Controls.Base.cDataPresenterCtl

		Protected trTitle As HtmlTableRow
		Protected tblCloseWindow As HtmlTable
		Protected spnCloseControl As HtmlGenericControl
		'Dim aUser As cEGUser

		Public Overrides Sub CoreCtl_Load(ByVal aSrc As Object, ByVal aEvent As System.EventArgs)
			MyBase.CoreCtl_Load(aSrc, aEvent)

			'aUser = CType(CType(Page, cModulePage).ModuleUser, cEGUser)
			'Dim aDo As cDataObject = WebSession.DataObjectFactory.GetDataObjectListWithFilter("User", "UserID", aUser.UserID)(0)
			'If Not aDo Is Nothing Then
				If Not WebSession.HasStaffUser Then
					trTitle.Visible = False
				Else
					trTitle.Visible = True
				End If
			'Else
			'	trTitle.Visible = False
			'End If
			
		End Sub

		Public Sub CloseWindow()
			tblCloseWindow.Visible = True
			spnCloseControl.Visible = True
		End Sub

End Class

End Namespace