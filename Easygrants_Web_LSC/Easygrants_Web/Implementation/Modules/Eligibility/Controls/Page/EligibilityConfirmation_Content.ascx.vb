'Imports System.Diagnostics
'Imports System.Web.UI
'Imports System.Xml
Imports Core.Web
Imports Core.DataAccess
'Imports Core.DataAccess.XMLAccess
'Imports Core_Web.Controls.Base
Imports Core.Web.Modules
Imports EasyGrants.Web.User
'Imports EasyGrants.DataAccess
'Imports EasyGrants.Workflow

Namespace Easygrants_Web.Implementation.Modules.Eligibility.Controls.Page
Public MustInherit Class cEligibilityConfirmation_Content
	Inherits Core_Web.Controls.Base.cDataPresenterCtl
'=============================================================

		Protected spnEligibleLabel As HtmlGenericControl
		Protected spnEmailLabel1 As HtmlGenericControl
		Protected spnEmailLabel2 As HtmlGenericControl
		Protected spnEmailClick As HtmlGenericControl

'=============================================================

	Public Overrides Sub CoreCtl_Load(ByVal sender As System.Object, ByVal e As System.EventArgs)
		MyBase.CoreCtl_Load(sender, e)

		Dim aUser As cEGUser = CType(CType(Page, cModulePage).ModuleUser, cEGUser)
		Dim aWfTaskAssignment As cDataObject
		Dim aWfTaskOutcome As String
		Dim aEligibility1DO As cDataObject
		Dim aEligibility2DO As cDataObject
		Dim spnQA1 As HtmlGenericControl
		Dim spnQA2 As HtmlGenericControl

		aWfTaskAssignment = Me.DataObjectCollection("WfTaskAssignment")(0)
		aWfTaskOutcome = aWfTaskAssignment.GetRelatedPropertyString("WfTaskOutcome.WfTaskOutcome_Abbr")

		Select Case aWfTaskOutcome
			Case "NotEligible"
					spnEligibleLabel.Visible = True
					spnEligibleLabel.InnerHtml = "<b>" + "You are not eligible due to the answers below." + "</b>"
					spnEmailLabel1.Visible = True
					spnEmailLabel1.InnerHtml = "<b>" + "If you feel you have received this determination in error, " + "</b>"
					spnEmailLabel2.Visible = True
					spnEmailClick.Visible = True
			Case "Eligible"
					spnEligibleLabel.Visible = True
					spnEligibleLabel.InnerHtml = "<b>" + "You are eligible." + "</b>"
					spnEmailClick.Visible = False
		End Select

	End Sub

		Public Sub ShowEligibilityException()
			Dim aURL As String = cWebLib.RemoveQuerystringParameter(Request.Url().ToString(), "Page")
			aURL = cWebLib.AddQuerystringParameter(Request.Url().ToString(), "Page", "EligibilityException")
			Response.Redirect(aURL)
		End Sub

'=============================================================

End Class
End Namespace