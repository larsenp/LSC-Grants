Imports System.Web.UI.WebControls

Namespace Core_Web.Controls.Base

Public MustInherit Class cValidationSummary
	Inherits Core.Web.cCoreCtl
'====================================================

	Protected valSummary As ValidationSummary

'====================================================

	Public Property HeaderText() As String
		Get
			Dim aStr As String
			aStr = valSummary.HeaderText
			aStr = Replace(aStr, "<span class='ValidationSummaryHeader'>", "")
			aStr = Replace(aStr, "<br></span>", "")
			HeaderText = aStr
		End Get
		Set(ByVal Value As String)
			valSummary.HeaderText = "<span class='ValidationSummaryHeader'>" + Value + "<br></span>"
		End Set
	End Property

'====================================================

        Public Overrides Sub CoreCtl_Load(ByVal sender As System.Object, ByVal e As System.EventArgs)
            If (HeaderText = "") Then
                valSummary.HeaderText = "<span class='ValidationSummaryHeader'> " + _
                    "Page did not save. Please correct the following items and re-submit.<br></span>"
			End If
        End Sub

        '====================================================

		Private Sub Page_PreRender(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.PreRender
			For Each aVal As IValidator In valSummary.Page.Validators
				If aVal.ErrorMessage.Trim <> "" Then
					aVal.ErrorMessage = ConfigurableText(aVal.ErrorMessage)
				End If
			Next
		End Sub
End Class
End Namespace