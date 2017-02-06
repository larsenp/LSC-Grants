Imports Core.DataAccess
Imports Core.Web.Modules
Imports EasyGrants.Web.User
Imports Easygrants_Web.Controls.Base
Imports Core_Web.Controls.Base
Imports EasyGrants.Web
Imports Core.Web


Namespace Easygrants_Web.Modules.Application.Controls.PageSection
	Public MustInherit Class cGrantPrimaryContactList
		Inherits Core_Web.Controls.Base.cDataPresenterCtl

		Protected ctlGranteeType As cDropDown

		Public Overrides Sub CoreCtl_Load(ByVal aSrc As Object, ByVal aEvent As EventArgs)
			MyBase.CoreCtl_Load(aSrc, aEvent)
			ctlGranteeType = Me.FindControl("ctlGranteeType")
		End Sub

		Public Sub btnAdd_Redirect(ByVal GranteeProjectPIID As String, ByVal PersonID As String, ByVal GranteeProjectID As String, ByVal EntityTypeID As String, _
			ByVal ReturnURL As String)
			If ctlGranteeType.SelectedValue = "1" Then
				EventController_NavigateToModulePageKey("GrantPrimaryContactEditor", GranteeProjectPIID, PersonID, GranteeProjectID, EntityTypeID, ReturnURL)
			ElseIf ctlGranteeType.SelectedValue = "2" Then
				EventController_NavigateToModulePageKey("GrantPrimaryContactOrgEditor", GranteeProjectPIID, PersonID, GranteeProjectID, EntityTypeID, ReturnURL)
			End If
		End Sub

		Public Sub btnEdit_Redirect(ByVal GranteeProjectPIID As String, ByVal PersonID As String, ByVal GranteeProjectID As String, ByVal EntityTypeID As String, _
			ByVal OrganizationID As String, ByVal ReturnURL As String)
			'Dim GranteeProjectPIDOL As cDataObjectList = Me.DataObjectCollection("GrantPrimaryContactListGranteeProjectPI")
			If EntityTypeID = "EntityTypeID=1" Then
				EventController_NavigateToModulePageKey("GrantPrimaryContactEditor", GranteeProjectPIID, PersonID, GranteeProjectID, EntityTypeID, OrganizationID, ReturnURL)
			ElseIf EntityTypeID = "EntityTypeID=2" Then
				EventController_NavigateToModulePageKey("GrantPrimaryContactOrgEditor", GranteeProjectPIID, PersonID, GranteeProjectID, EntityTypeID, OrganizationID, ReturnURL)
			End If
		End Sub
	End Class
End Namespace