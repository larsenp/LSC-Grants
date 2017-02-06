Imports System.Xml
Imports System.Diagnostics
Imports Core.Web.Navigation
Imports Core.DataAccess
Imports Core.DataAccess.XMLAccess
Imports Core_Web.Controls.Base
Imports Core.Web.Modules
Imports EasyGrants.Web.Modules
Imports EasyGrants.Web.User


Namespace Easygrants_Web.Controls.PageSection
Public Class cPeerReviewer_Editor
	Inherits Easygrants_Web.Controls.Base.cEGDataPresenterCtl

	Protected spnTxtEmail As HtmlGenericControl
	Protected spnLblEmail As HtmlGenericControl
	Protected ctlTxtEmail As cEmailTextBox
	Protected TrEmailInst As HtmlTableRow
	Protected ctlType As cDropDown
	Protected ctlOtherType As cTextBox
'=============================================================
	Public Overrides Sub CoreCtl_Load(ByVal aSrc As Object, ByVal aEvent As EventArgs)
		MyBase.CoreCtl_Load(aSrc, aEvent)
		SavePostSubmit = True
		If Request.QueryString("PersonRelationshipID") > 0 Then
			spnTxtEmail.Visible = False
			TrEmailInst.Visible = False
			spnLblEmail.Visible = True
		Else
			spnTxtEmail.Visible = True
			TrEmailInst.Visible = True
			spnLblEmail.Visible = False
		End If
	End Sub

	

	Public Sub valUniqueEmail(ByVal aSrc As Object, ByVal aArgs As ServerValidateEventArgs)
		Dim aPersonRelationshipDOL As cDataObjectList
		Dim aUser As cEGUser
		aUser = CType(CType(Page, cModulePage).ModuleUser, cEGUser)

		ctlTxtEmail = CType(Me.FindControl("ctlTxtEmail"), cEmailTextBox)
		If ctlTxtEmail.Value <> "" And Request.QueryString("PersonRelationshipID") = 0 Then
			aPersonRelationshipDOL = WebSession.DataObjectFactory.GetDataObjectListWithFilter("PersonRelationship", "PersonID", aUser.PersonID, "TaskID", aUser.WfTaskID, "GranteeProjectID", aUser.GranteeProjectID, "RelatePersonDisplayEmail", ctlTxtEmail.Value)
			If aPersonRelationshipDOL.Count > 0 Then
				aArgs.IsValid = False
				Exit Sub
			End If
		End If
		aArgs.IsValid = True
   End Sub

   Public Sub valType(ByVal aSrc As Object, ByVal aArgs As ServerValidateEventArgs)
		ctlType = CType(Me.FindControl("ctlType"), cDropDown)
		ctlOtherType = CType(Me.FindControl("ctlOtherType"), cTextBox)
		If ctlOtherType.Value.Trim.Length = 0 And ctlType.SelectedValue.ToString = "6" Then
			aArgs.IsValid = False
			Exit Sub
		End If
		aArgs.IsValid = True
   End Sub

End Class 'cPeople_Editor

End Namespace 'Easygrants_Web.Controls.PageSection