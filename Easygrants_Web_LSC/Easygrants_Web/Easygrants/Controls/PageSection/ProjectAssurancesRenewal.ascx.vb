Imports Core_Web.Controls.Base

Namespace Easygrants_Web.Controls.PageSection
	Public MustInherit Class cProjectAssurancesRenewal
		Inherits Core_Web.Controls.Base.cDataPresenterCtl

'=============================================================

		Protected mSvButton As String
		Protected trSaveAndCancel As HtmlTableRow

'=============================================================

		Public Property SvButton() As String
			Get
				Return mSvButton
			End Get
			Set(ByVal Value As String)
				mSvButton = Value
			End Set
		End Property

'=============================================================

		Public Overrides Sub CoreCtl_Load(ByVal aSrc As Object, ByVal aEvent As EventArgs)
			MyBase.CoreCtl_Load(aSrc, aEvent)

			If SvButton = "NoShow" Then
				trSaveAndCancel.Visible = False
			End If
		End Sub

'=============================================================

	End Class
End Namespace
