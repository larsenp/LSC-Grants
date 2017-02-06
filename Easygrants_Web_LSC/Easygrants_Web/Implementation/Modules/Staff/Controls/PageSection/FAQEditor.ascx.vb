Imports System.Xml
Imports Core.DataAccess
Imports Core.DataAccess.XMLAccess
Imports Easygrants.DataAccess
Imports Easygrants.DataAccess.Report
Imports EasyGrants.Web
Imports Core_Web.Controls.Base

Namespace Easygrants_Web.Modules.Staff.Controls.PageSection

Public Class cFAQEditor
	Inherits Core_Web.Controls.Base.cDataPresenterCtl

	Protected ctlIsPublicAvailable As cCheckBox
	Protected ctlIsStaffAvailable As cCheckBox
	Protected ctlQuestion As cTextArea
	Protected ctlAnswer As cTextArea

	Public Overrides Sub CoreCtl_Load(ByVal aSrc As Object, ByVal aEvent As EventArgs)
		MyBase.CoreCtl_Load(aSrc, aEvent)
		ctlIsPublicAvailable = CType(Me.FindControl("ctlIsPublicAvailable"), cCheckBox)
		ctlIsStaffAvailable = CType(Me.FindControl("ctlIsStaffAvailable"), cCheckBox)
		ctlQuestion = CType(Me.FindControl("ctlQuestion"), cTextArea)
		ctlAnswer = CType(Me.FindControl("ctlAnswer"), cTextArea)
	End Sub

	Public Sub ValidateDisplayTo(ByVal aSrc As Object, ByVal aArgs As ServerValidateEventArgs)
		If ctlIsPublicAvailable.Value = False AndAlso ctlIsStaffAvailable.Value = False Then
			aArgs.IsValid = False
		End If
	End Sub

	Public Sub ValidateQuestion(ByVal aSrc As Object, ByVal aArgs As ServerValidateEventArgs)
		If ctlQuestion.Value = "" Then
			aArgs.IsValid = False
		End If
	End Sub

	Public Sub ValidateAnswer(ByVal aSrc As Object, ByVal aArgs As ServerValidateEventArgs)
		If ctlAnswer.Value = "" Then
			aArgs.IsValid = False
		End If
	End Sub


End Class

End Namespace