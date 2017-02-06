Imports Core.DataAccess
Imports Core.Web.Modules
Imports Core_Web.Controls.Base
Imports EasyGrants.Web.User
Imports System.Text.RegularExpressions

Namespace Easygrants_Web.Modules.Staff.Controls.Page.Administration.EligibilityBuilder
Public MustInherit Class cCopyEligibilityTemplate
	Inherits Core_Web.Controls.Base.cDataPresenterCtl
	Protected ctlTemplateName As cTextBox
	Protected ctlTemplateDescription As cTextBox
	'Protected valUniqueTemplate As CustomValidator
	
	Dim aExistingEligibilityTemplateID As String = ""
	Dim aExistingEligibilityTemplateDO As cDataObject = Nothing
	
	Public Overrides Sub CoreCtl_Load(ByVal aSrc As Object, ByVal aEvent As EventArgs)
		MyBase.CoreCtl_Load(aSrc, aEvent)
		ctlTemplateName = FindControl("ctlTemplateName")
		ctlTemplateDescription = FindControl("ctlTemplateDescription")
		aExistingEligibilityTemplateID = Request.QueryString("EligibilityTemplateID")
        aExistingEligibilityTemplateDO = WebSession.DataObjectFactory.GetDataObjectListFromPrimaryKey("EligibilityTemplate", aExistingEligibilityTemplateID)(0)
        ctlTemplateName.Value = aExistingEligibilityTemplateDO.GetPropertyString("TemplateName")
        ctlTemplateDescription.Value = aExistingEligibilityTemplateDO.GetPropertyString("TemplateDescription")
	End Sub
	
	'Public Overrides Function EventController_Save() As Boolean
	'	Page.Validate()
 '       If Not Page.IsValid Then
 '           EventController_Save = False
 '           Exit Function
 '       End If
        
    Public Overrides Sub DataPresenter_SaveDataObjects()
    
        If Not aExistingEligibilityTemplateDO Is Nothing Then
			Dim aEligibilityTemplateDO As cDataObject = WebSession.DataObjectFactory.CreateNewDataObjectFromKey("EligibilityTemplate")
			aEligibilityTemplateDO("TemplateName") = ctlTemplateName.Value
			aEligibilityTemplateDO("TemplateDescription") = ctlTemplateDescription.Value
			aEligibilityTemplateDO.SaveData()
			
			Dim aExistingEligibilityTemplateQuestionsDOL As cDataObjectList = WebSession.DataObjectFactory.GetDataObjectListWithFilter("EligibilityTemplateQuestions", "EligibilityTemplateID", aExistingEligibilityTemplateID)
			Dim aExistingEligibilityTemplateQuestionsDO As cDataObject
			For Each aExistingEligibilityTemplateQuestionsDO in aExistingEligibilityTemplateQuestionsDOL
				Dim aEligibilityTemplateQuestionsDO As cDataObject = WebSession.DataObjectFactory.CloneDataObject(aExistingEligibilityTemplateQuestionsDO)
				aEligibilityTemplateQuestionsDO("EligibilityTemplateID") = aEligibilityTemplateDO("EligibilityTemplateID")
				aEligibilityTemplateQuestionsDO.SaveData()
			Next
		End If
        
    End Sub
    
    Public Sub ValidateUniqueTemplate(ByVal aSrc As Object, ByVal aArgs As ServerValidateEventArgs)
		Dim aEligibilityTemplateDOL As cDataObjectList = WebSession.DataObjectFactory.GetDataObjectListWithFilter("EligibilityTemplate", "TemplateName", ctlTemplateName.Value)
		If aEligibilityTemplateDOL.Count > 0 Then
			aArgs.IsValid = False
		End If
	End Sub
	
End Class

End Namespace