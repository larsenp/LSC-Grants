Imports Core.Web
Imports Core.DataAccess
Imports Core.DataAccess.XMLAccess
Imports Core.Web.Modules
Imports Core_Web.Controls.Base
Imports EasyGrants.Web
Imports EasyGrants.Workflow
Imports EasyGrants.Web.User
Imports EasyGrants.Correspondence
Imports System.Xml
Imports Core.Web.User

Namespace Implementation.Modules.Staff.Controls.Page.Contacts

Public MustInherit Class cEditPerson
	Inherits Core_Web.Controls.Base.cDataPresenterCtl
'=================================================
		Public Overrides Sub CoreCtl_Load(ByVal aSrc As Object, ByVal aEvent As EventArgs)
			MyBase.CoreCtl_Load(aSrc, aEvent)
		End Sub
'=============================================================
		
		'Person Match code in review (kda - 2/18/06)
		'calls Cancel in Person_Editor shared control
		'Public Sub Cancel(ByVal aReturnURL as String)
		'	Dim ctlPageSection As Easygrants_Web.Controls.PageSection.cPerson_Editor = GetControl("ctlPersonEditor")
		'	ctlPageSection.Cancel(aReturnURL)

		'End Sub

'=============================================================
		
		
		'calls Save in Person_Editor shared control
		'Public Sub ContinueRedirect(ByVal aReturnURL as String)
		'	Dim ctlPageSection As Easygrants_Web.Controls.PageSection.cPerson_Editor = GetControl("ctlPersonEditor")
		'	ctlPageSection.ContinueRedirect(aReturnURL)

		'End Sub
		
'=============================================================
End Class
End Namespace
