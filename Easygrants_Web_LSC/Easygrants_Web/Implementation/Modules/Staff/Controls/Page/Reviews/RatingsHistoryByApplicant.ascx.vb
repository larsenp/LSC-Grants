Imports Core.Web
Imports Core_Web.Controls.Base

Namespace Implementation.Modules.Staff.Controls.Page.Reviews
Public MustInherit Class cRatingsHistoryByApplicant
    Inherits Core_Web.Controls.Base.cDataPresenterCtl

	Protected ctlApplicants As cDropDown
	Protected tblCloseWindow as HtmlTable
	Protected spnCloseControl as HtmlGenericControl

    Public Overrides Sub CoreCtl_Load(ByVal aSrc As Object, ByVal aEvent As EventArgs)
		MyBase.CoreCtl_Load(aSrc, aEvent)	
		tblCloseWindow.Visible = True

		ctlApplicants = CType(Me.FindControl("ctlApplicants"), cDropDown)
		ctlApplicants.Set_ServerIndexChange(AddressOf OnApplicantsSelect)

		Dim aGPID As String
		aGPID = Request.QueryString("GPID")
		If aGPID <> "" Then
			ctlApplicants.SelectedField = aGPID
		End If

	End Sub

	Private Sub OnApplicantsSelect(ByVal sender As System.Object, ByVal e As System.EventArgs)
		Dim aURL As String = Request.RawUrl
		aURL = cWebLib.AddQuerystringParameter(aURL, "GPID", ctlApplicants.SelectedValue)
		Response.Redirect(aURL)
	End Sub

	Public Sub CloseWindow()
		tblCloseWindow.Visible = True
		spnCloseControl.Visible = True
	End Sub

End Class
End Namespace