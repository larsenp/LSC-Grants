Imports System.Diagnostics
Imports System.Web.UI
Imports Core.DataAccess
Imports Core.DataAccess.XMLAccess
Imports System.Xml
Imports EasyGrants.Workflow
Imports Core_Web.Controls.Base
Imports EasyGrants.Web
Imports Core.Web.Modules
Imports EasyGrants.Web.User
Imports Core.Web


Namespace Implementation.Modules.Home.Controls.Page
Public MustInherit Class cSelectProgram_Content
	Inherits Core_Web.Controls.Base.cDataPresenterCtl
                   
 '=============================================================

    Protected ctlFundingComp As cDropDown
	Protected spnSaveAndContinue As HtmlGenericControl

'=============================================================

   Public Overrides Sub CoreCtl_Load(ByVal sender As System.Object, ByVal e As System.EventArgs)
        MyBase.CoreCtl_Load(sender, e)
		ctlFundingComp = CType(Me.FindControl("ctlFundingComp"), cDropDown)
	End Sub

 '------------------------------------------------------------------------------------------------------------------------------
		Public Overrides Sub CoreCtl_SetValues()
			MyBase.CoreCtl_SetValues()

			If ctlFundingComp.SelectedValue = "" Then
				spnSaveAndContinue.Visible = False
			Else
				spnSaveAndContinue.Visible = True
			End If

			If Request.QueryString("ProgramID") <> "" Then
				If Request.QueryString("ProgramID") = "-1" Then
					ctlFundingComp.SelectedField = "<None>"
				Else
					ctlFundingComp.SelectedField = Request.QueryString("ProgramID")
					'if Session("OutcomeComments") <> "" then
					'	ctlRptOutcomeComments.Value = Session("OutcomeComments")
					'end if
				End If
			End If

		End Sub

'---------------------------------------------------------------------------------------------------------------------------------

		Public Sub ControlFundingCompSelected(ByVal aSelectedValue As String, ByVal aURL As String)
			If aSelectedValue = "" Then
				aSelectedValue = "-1"
			End If
			'Session.Add("OutcomeComments", ctlRptOutcomeComments.Value)
			Response.Redirect(cWebLib.AddQuerystringParameter(aURL, "ProgramID", aSelectedValue))
		End Sub


 '=============================================================

End Class
End Namespace