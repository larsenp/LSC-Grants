Imports Core_Web.Controls.Base
Imports Core.DataAccess

Namespace Easygrants_Web.Modules.Staff.Controls.Page.Administration.WorkflowBuilder
Public MustInherit Class cWorkflowEligibilityQuizBuilder
	Inherits Core_Web.Controls.Base.cDataPresenterCtl
	
	Protected ctlTemplate As cDropDown
	Protected errMsg As HtmlGenericControl
	
	Public Overrides Sub CoreCtl_Load(ByVal aSrc As Object, ByVal aEvent As EventArgs)
		MyBase.CoreCtl_Load(aSrc, aEvent)
		'errMsg.Visible = False
	End Sub
	
	Public Sub CopyTemplateQuestions()
		errMsg.InnerText = ""
		ctlTemplate = CType(FindControl("ctlTemplate"), cDropDown)
		If ctlTemplate.SelectedValue = "" Then
			'errMsg.Visible = True
			errMsg.InnerHtml = "<font color='red'>Eligibility Template is required.</font><br/><br/>"
			Exit Sub
		End If
		Dim aTemplateQDOL As cDataObjectList = WebSession.DataObjectFactory.GetDataObjectListWithFilter("EligibilityTemplateQuestions", "EligibilityTemplateID", ctlTemplate.SelectedValue)
		Dim aTemplateQDO As cDataObject
		Dim aWfPTEligibilityDO As cDataObject
		Dim aWfPTEligibilityDOL As cDataObjectList = WebSession.DataObjectFactory.GetDataObjectListWithFilter("WFProjectTaskEligibilityAnswer", "WfProjectTaskID", Request.QueryString("WfProjectTaskID"))
		WebSession.DataObjectFactory.DeleteData(aWfPTEligibilityDOL)
		for each aTemplateQDO in aTemplateQDOL
			aWfPTEligibilityDO = WebSession.DataObjectFactory.CreateNewDataObjectFromKey("WFProjectTaskEligibilityAnswer")
			aWfPTEligibilityDO("WfProjectTaskID") = Convert.ToInt32(Request.QueryString("WfProjectTaskID"))
			aWfPTEligibilityDO("QuestionID") = aTemplateQDO.GetPropertyInt("QuestionID")
			aWfPTEligibilityDO("ValidAnswerID") = aTemplateQDO.GetPropertyInt("ValidAnswerID")
			aWfPTEligibilityDO.SaveData
		Next
		Response.Redirect(Request.Url.ToString)
	End Sub
	
	Public Sub ValidateTemplate(ByVal aSrc As Object, ByVal aArgs As ServerValidateEventArgs)
		ctlTemplate = CType(FindControl("ctlTemplate"), cDropDown)
		If ctlTemplate.SelectedValue = "" Then
			aArgs.IsValid = False
		End If
	End Sub

End Class
End Namespace