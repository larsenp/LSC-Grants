
Namespace Implementation.Modules.Review.Controls.PageSection


Partial Public Class cGrantInformation
	Inherits Core_Web.Controls.Base.cDataPresenterCtl


	Public Overrides Sub CoreCtl_Load(ByVal sender As System.Object, ByVal e As System.EventArgs)
			MyBase.CoreCtl_Load(sender, e)

		If Page.IsPostBack = True Then
			MyBase.CoreCtl_SetValues()
		End If

	End Sub


	

End Class


End Namespace