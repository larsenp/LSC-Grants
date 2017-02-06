Imports System.Xml
Imports Core.DataAccess
Imports Core.DataAccess.XMLAccess
Imports Core.Web.Modules
Imports Core_Web.Controls.Base
Imports EasyGrants.Workflow
Imports EasyGrants.Web.Modules
Imports Easygrants_Web.Modules.LOI
Imports Easygrants_Web.Implementation.Modules.Eligibility.Controls.Page

Namespace Implementation.Modules.Eligibility.Controls.Page

Public MustInherit Class cEligibilityQuiz_Content_ViewImpl
    Inherits cEligibilityQuiz_Content_View
'=================================================
    Protected ctlQuestion As cLabel

    Public Overloads Sub ValidateQuestions(ByVal aSrc As Object, ByVal aArgs As ServerValidateEventArgs)

        ctlAnswerList = CType(Me.FindControl("ctlAnswerList"), cRadioButtonList)
        ctlQuestionID = CType(Me.FindControl("ctlQuestionID"), cLabel)
        ctlQuestion = CType(Me.FindControl("ctlQuestion"), cLabel)
		valQuestion.ErrorMessage = "Answer to " & """" & ctlQuestion.Value & """ is required."
        If ctlAnswerList.SelectedValue = "" Then
            aArgs.IsValid = False
        End If
   End Sub


'=================================================
End Class
End Namespace