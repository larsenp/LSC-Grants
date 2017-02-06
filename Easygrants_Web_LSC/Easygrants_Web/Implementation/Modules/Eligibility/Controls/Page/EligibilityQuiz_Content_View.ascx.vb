Imports System.Diagnostics
Imports System.Web.UI
Imports System.Xml
Imports Core.DataAccess
Imports Core.DataAccess.XMLAccess
Imports Core_Web.Controls.Base
Imports Core.Web.Modules
Imports EasyGrants.Web.User
Imports EasyGrants.DataAccess
Imports EasyGrants.Workflow
Namespace Easygrants_Web.Implementation.Modules.Eligibility.Controls.Page
Public MustInherit Class cEligibilityQuiz_Content_View
	Inherits Core_Web.Controls.Base.cEntityDataPresenterCtl

Protected ctlAnswerList As cRadioButtonList
Protected ctlQuestionID As cLabel
Protected ctlQuestionNumber As cLabel
Protected valQuestion As CustomValidator

	Public Overrides Sub CoreCtl_Load(ByVal sender As System.Object, ByVal e As System.EventArgs)
		MyBase.CoreCtl_Load(sender, e)
	End Sub
	Public Overrides Sub CoreCtl_SetValues()
		MyBase.CoreCtl_SetValues()

		ctlQuestionNumber = CType(Me.FindControl("ctlQuestionNumber"), cLabel)
		ctlQuestionID = CType(Me.FindControl("ctlQuestionID"), cLabel)
		ctlQuestionID.Visible = False

		Dim aEligibilityList As cDataObjectList
		Dim aGranteeProjectID As Integer
		Dim aWfTaskAssignmentObject As cDataObject

		aGranteeProjectID = CType(CType(Page, cModulePage).ModuleUser, cEGUser).GranteeProjectID
		aWfTaskAssignmentObject = CType(CType(Page, cModulePage).ModuleUser, cEGUser).WfTaskAssignmentObject

		Dim aWfProjectTaskID = WebSession.DataObjectFactory.GetDataObjectListWithFilter("WfProjectTask", "WfProjectID", _
			aWfTaskAssignmentObject.GetRelatedPropertyString("GranteeProject.WfProjectID"), "WfTaskID", aWfTaskAssignmentObject.GetPropertyString("WfTaskID"))(0).GetPropertyString("WfProjectTaskID")

		aEligibilityList = WebSession.DataObjectFactory.GetDataObjectListWithFilter("Eligibility", _
			"GranteeProjectID", aGranteeProjectID, "QuestionID", ctlQuestionID.Value, "WfProjectTaskID", aWfProjectTaskID)
		If aEligibilityList.Count > 0 Then
			ctlAnswerList = CType(Me.FindControl("ctlAnswerList"), cRadioButtonList)
			ctlAnswerList.SelectedField = aEligibilityList(0).GetPropertyString("AnswerID")
		End If

	End Sub
    Public Sub ValidateQuestions(ByVal aSrc As Object, ByVal aArgs As ServerValidateEventArgs)

        ctlAnswerList = CType(Me.FindControl("ctlAnswerList"), cRadioButtonList)
        ctlQuestionID = CType(Me.FindControl("ctlQuestionID"), cLabel)
		valQuestion.ErrorMessage = "You must answer question " & ctlQuestionID.Value
        If ctlAnswerList.SelectedValue = "" Then
            aArgs.IsValid = False
        End If
   End Sub
End Class
End Namespace