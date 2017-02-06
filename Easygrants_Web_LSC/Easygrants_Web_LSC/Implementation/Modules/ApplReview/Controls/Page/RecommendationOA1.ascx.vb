Imports System.Web.UI.WebControls
Imports System.Xml
Imports Core.DataAccess
Imports Core_Web.Controls.Base
Imports EasyGrants.Workflow

Namespace Implementation.Modules.ApplReview.Controls.Page
	Public Class cRecommendationOA1
		Inherits Core_Web.Controls.Base.cDataPresenterCtl

		Protected txtCommentIIC As cTextArea
		Protected chkIIC1 As cCheckBox
		Protected chkIIC2 As cCheckBox
		Protected chkIIC3 As cCheckBox
		Protected chkIIC4 As cCheckBox
		Protected chkIIC5 As cCheckBox
		Protected chkIIC6 As cCheckBox
		Protected chkIIC7 As cCheckBox
		Protected chkIIC8 As cCheckBox
		Protected chkIIC9 As cCheckBox
		Protected chkIIC10 As cCheckBox
		Protected chkIIC11 As cCheckBox
		Protected txtCommentIIC11 As cTextArea

		Public Overrides Sub CoreCtl_Load(ByVal aSrc As Object, ByVal aEvent As EventArgs)
			MyBase.CoreCtl_Load(aSrc, aEvent)

			txtCommentIIC = GetControl("txtCommentIIC")
			chkIIC1 = GetControl("chkIIC1")
			chkIIC2 = GetControl("chkIIC2")
			chkIIC3 = GetControl("chkIIC3")
			chkIIC4 = GetControl("chkIIC4")
			chkIIC5 = GetControl("chkIIC5")
			chkIIC6 = GetControl("chkIIC6")
			chkIIC7 = GetControl("chkIIC7")
			chkIIC8 = GetControl("chkIIC8")
			chkIIC9 = GetControl("chkIIC9")
			chkIIC10 = GetControl("chkIIC10")
			chkIIC11 = GetControl("chkIIC11")
			txtCommentIIC11 = GetControl("txtCommentIIC11")

		End Sub

		Public Sub ValidateOA1PartII(ByVal aSrc As Object, ByVal aArgs As ServerValidateEventArgs)

			If txtCommentIIC.Value <> "" Then
				aArgs.IsValid = True
				Return
			End If

			If chkIIC1.Value Or _
				chkIIC2.Value Or _
				chkIIC3.Value Or _
				chkIIC4.Value Or _
				chkIIC5.Value Or _
				chkIIC6.Value Or _
				chkIIC7.Value Or _
				chkIIC8.Value Or _
				chkIIC9.Value Or _
				chkIIC10.Value Then

				aArgs.IsValid = False
				Return
			End If

			aArgs.IsValid = True

		End Sub

		Public Sub ValidateOA1Question11(ByVal aSrc As Object, ByVal aArgs As ServerValidateEventArgs)

			If txtCommentIIC11.Value = "" And chkIIC11.Value Then
				aArgs.IsValid = False
				Return
			End If

			aArgs.IsValid = True
		End Sub

	End Class
End Namespace