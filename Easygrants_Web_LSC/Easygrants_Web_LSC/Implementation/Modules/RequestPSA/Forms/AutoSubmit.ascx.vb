Imports EasyGrants.Modules.Application.Controls.Page

Namespace Implementation.Modules.RequestPSA.Forms
Public Class cAutoSubmit
	Inherits Core_Web.Controls.Base.cDataPresenterCtl

	Protected ctlSubmissionButton As cSubmission_Button_LSC

	Public Overrides Sub CoreCtl_Load(ByVal aSrc As Object, ByVal aEvent As EventArgs)
		MyBase.CoreCtl_Load(aSrc, aEvent)
		ctlSubmissionButton.SubmissionContent_Submit_LSC()
	End Sub

End Class
End Namespace
