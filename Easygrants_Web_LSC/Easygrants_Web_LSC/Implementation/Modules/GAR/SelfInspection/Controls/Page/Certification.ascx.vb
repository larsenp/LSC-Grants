Imports System.Web.UI.WebControls
Imports Core_Web.Controls.Base

Namespace Implementation.Modules.GAR.SelfInspection
	Public Class cCertification
        'Inherits Core_Web.Controls.Base.cDataPresenterCtl
        Inherits Easygrants_Web.Controls.Base.cWfTADataPresenterCtl

		Protected txtCases As cTextBox
		Protected txtExceptions As cTextBox

		Public Overrides Sub CoreCtl_Load(ByVal aSrc As Object, ByVal aEvent As EventArgs)
			MyBase.CoreCtl_Load(aSrc, aEvent)
			txtCases = GetControl("txtCases")
			txtExceptions = GetControl("txtExceptions")
		End Sub

		Public Sub ValidateExceptions(ByVal aSrc As Object, ByVal aArgs As ServerValidateEventArgs)
			aArgs.IsValid = True

			'If one of the boxes is empty, return and let the required field validator handle validation.
			Dim aCaseStr As String = txtCases.Value
			If aCaseStr = "" Then Return
			Dim aExcStr As String = txtExceptions.Value
			If aExcStr = "" Then Return

			'If one of the boxes has a non-integer value, return and let the range validator handle validation.
			Dim aCaseInt As Integer
			Dim aExcInt As Integer
			Try
				aCaseInt = Int32.Parse(aCaseStr)
				aExcInt = Int32.Parse(aExcStr)
			Catch ex As Exception
				Return
			End Try

			If aExcInt > aCaseInt Then
				aArgs.IsValid = False
			End If
		End Sub

	End Class
End Namespace
