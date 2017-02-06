
Imports Core.DataAccess
Imports Core.Web.Modules
Imports EasyGrants.Web.User
Imports Easygrants_Web.Controls.Base
Imports Core_Web.Controls.Base

Namespace Implementation.Modules.Application.Controls.Page
Public MustInherit Class cMainContentWithThirdParty
	Inherits cPostSubmitDataPresenterCtl

		Dim aUser As cEGUser
		Dim aStatus As Integer
		Protected TableValidation As HtmlTable
'============================================================= 
	 Public Overrides Sub CoreCtl_Load(ByVal aSrc As Object, ByVal aEvent As EventArgs)
		MyBase.CoreCtl_Load(aSrc, aEvent)

		aUser = CType(CType(Page, cModulePage).ModuleUser, cEGUser)
		Dim aWFTaskAssignmentDo As cDataObject = aUser.WfTaskAssignmentObject
		If Not aWFTaskAssignmentDo Is Nothing Then
			aStatus = aWFTaskAssignmentDo("WfTaskStatusID")
		End If
		If aStatus = 1 Or aStatus = 4 Then
			TableValidation.Visible = True
		ElseIf aStatus = 2 Then
			TableValidation.Visible = False
		End If

	End Sub

'=============================================================

End Class
End Namespace
