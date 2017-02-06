
Imports Core.DataAccess
Imports Core.Web.Modules
Imports EasyGrants.Web.User
Imports Easygrants_Web.Controls.Base
Imports Core_Web.Controls.Base



Namespace Easygrants_Web.Controls.PageSection
Public MustInherit Class cThirdPartyMainContent
	Inherits Core_Web.Controls.Base.cDataPresenterCtl

	Protected Tblcomplete As HtmlTable
'============================================================= 
	 Public Overrides Sub CoreCtl_Load(ByVal aSrc As Object, ByVal aEvent As EventArgs)
		MyBase.CoreCtl_Load(aSrc, aEvent)
		Dim aUser As cEGUser
		Dim aStatus As Integer = 0
		aUser = CType(CType(Page, cModulePage).ModuleUser, cEGUser)
		Dim aWFTaskAssignmentDo As cDataObject = aUser.WfTaskAssignmentObject
		If Not aWFTaskAssignmentDo Is Nothing Then
			aStatus = aWFTaskAssignmentDo("WfTaskStatusID")
		End If
		If aStatus = 1 Or aStatus = 4 Then
			Tblcomplete.Visible = False
		ElseIf aStatus = 2 Then
			Tblcomplete.Visible = True
		End If
	End Sub

'=============================================================

End Class
End Namespace
