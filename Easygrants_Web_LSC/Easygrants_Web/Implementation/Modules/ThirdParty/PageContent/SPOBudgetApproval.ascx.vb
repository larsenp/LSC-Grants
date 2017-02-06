Imports System.Xml
Imports Core.DataAccess
Imports Core.DataAccess.XMLAccess
Imports Core_Web.Controls.Base
Imports Core.Web.Modules
Imports EasyGrants.Web
Imports EasyGrants.Web.Modules
Imports EasyGrants.Workflow
Imports EasyGrants.Web.User
Imports Core.Web

Namespace Easygrants_Web.Implementation.Modules.ThirdParty.PageContent
Public MustInherit Class cSPOBudgetApproval
	Inherits Core_Web.Controls.Base.cDataPresenterCtl
	
'========================================================================

	protected spnSave as HtmlGenericControl
	protected tblSubmit as HtmlTable
	
	Protected ctlNewWindowOpener As cNewWindowOpener

'========================================================================

   Public Overrides Sub CoreCtl_Load(ByVal sender As System.Object, ByVal e As System.EventArgs)
        MyBase.CoreCtl_Load(sender, e)
        
		if ctype(me.DataObjectCollection("WfTaskAssignment"), cDataObjectList)(0).GetPropertyInt("WfTaskStatusID", 0) <> 1 then
			'spnSave.Visible = False
			tblSubmit.Visible = False
		end if
   End Sub

'-------------------------------------------------------------------------

	'Invoked by EventController_ControlValidate
	Public Function ValidateNonApprovalReason(ByVal aSrc As Object, ByVal aArgs As ServerValidateEventArgs)
		ValidateNonApprovalReason = True
		
		Dim ctlIsApproved As cRadioButtonList
		ctlIsApproved = CType(Me.FindControl("ctlIsApproved"), cRadioButtonList)
		Dim iSelVal as Boolean
		iSelVal = CType(ctlIsApproved.SelectedValue, Boolean)
		If iSelVal = False Then
			Dim ctlNonApprovalReason As cTextArea
			ctlNonApprovalReason = CType(Me.FindControl("ctlNonApprovalReason"), cTextArea)
			If ctlNonApprovalReason.Value.Trim() = "" Then
				ValidateNonApprovalReason = False
			End If
		End If
	End Function

'=============================================================

	Public Sub Submit(ByVal aModuleName As String, ByVal aModuleConfig As String, ByVal aPageKey As String)

		Dim aUser As cEGUser
		aUser = CType(CType(Page, cModulePage).ModuleUser, cEGUser)
		Dim aGranteeProjectDO As cGranteeProject
		aGranteeProjectDO = WebSession.DataObjectFactory.GetDataObjectFromPrimaryKey("GranteeProject", aUser.GranteeProjectID)


		Dim ctlIsApproved As cRadioButtonList = CType(Me.FindControl("ctlIsApproved"), cRadioButtonList)
		Dim aSelVal as Boolean = CType(ctlIsApproved.SelectedValue, Boolean)
		
		If aSelVal = False Then
			try
				dim aObj as cDataObject = ctype(me.DataObjectCollection("GranteeProjectAHA"), cDataObjectList)(0)
				aObj.RaiseEvent(20, aUser.UserID)
			catch
			end try
			'update applicant wfta
			dim aList as cDataObjectList = me.WebSession.DataObjectFactory.GetDataObjectListWithFilter("WfTask", _
				"WfTaskID", aUser.WfTaskID.ToString())
			aList = me.WebSession.DataObjectFactory.GetDataObjectListWithFilter("WfTaskAssignment", _
				"GranteeProjectID", aUser.GranteeProjectID.ToString(), "WfTaskID", aList(0).GetPropertyString("WfParentTaskID"), "WfTaskRoleID", "1")
			If aList.Count > 0 Then
				aList(0)("WfTaskStatusID") = 1   'incomplete
				aList(0)("WfTaskOutcomeID") = 36  'Initial Budget Not Submitted 
				WebSession.DataObjectFactory.SaveDataObject(aList(0))
			End If
			'update SPO wfta
			dim aSPOList as cDataObjectList = me.WebSession.DataObjectFactory.GetDataObjectListWithFilter("WfTaskAssignment", _
				"GranteeProjectID", aUser.GranteeProjectID.ToString(), "WfTaskID", aUser.WfTaskID.ToString(), "WfTaskRoleID", "103")
			If aSPOList.Count > 0 Then
				aSPOList(0)("WfTaskStatusID") = 2   'Complete
				aSPOList(0)("WfTaskOutcomeID") = 82  'SPO Budget Approval Not Approved 
				WebSession.DataObjectFactory.SaveDataObject(aSPOList(0))
			End If
			
			CType(WebSession, cEGSession).RedirectToModule(aModuleName, aModuleConfig, aPageKey)
		else
			'Update Applicant WfTA
			Dim aXmlDoc As cXMLDoc
			Dim aDataObjectNode As XmlNode
			Dim aFiltersNode As XmlNode
			Dim aWfTA As cDataObject
			
			aXmlDoc = WebSession.DataObjectFactory.CreateDataObjectNode("WfTaskAssignment", aDataObjectNode, aFiltersNode)
			aFiltersNode.AppendChild(WebSession.DataObjectFactory.CreateArgumentNode(aXmlDoc, "Data", "WfTaskID", aUser.WfTaskAssignmentObject.GetRelatedPropertyInt("WfTask.WfParentTaskID").ToString()))
			aFiltersNode.AppendChild(WebSession.DataObjectFactory.CreateArgumentNode(aXmlDoc, "Data", "WfTaskRoleID", "1"))
			aFiltersNode.AppendChild(WebSession.DataObjectFactory.CreateArgumentNode(aXmlDoc, "Data", "GranteeProjectID", aUser.GranteeProjectID.ToString()))
			aWfTA = WebSession.DataObjectFactory.GetDataObject(aDataObjectNode)
			If Not aWfTA Is Nothing Then
				aWfTA("WfTaskOutcomeID") = 35 'Initial Budget Submitted
				WebSession.DataObjectFactory.SaveDataObject(aWfTA)
			End If
			'End Update Applicant WfTA
			
			'Submit task
			Dim aSubmitPage as cSubmissionModulePage
			aSubmitPage = CType(Page, cSubmissionModulePage)
			aSubmitPage.PostSubmitModuleConfig = Request.QueryString("Config")
			aSubmitPage.PostSubmitModuleName = "ThirdParty"
			aSubmitPage.Submit(False)
		end if
	End Sub
	
'==============================================================

	Public Sub ViewAppPDF(ByVal aEntityID As String, ByVal aDefinitionID As String)
		Dim aHref As String
		aHref = CType(WebAppl, cEGAppl).Build_ReportOutput_EntityID_URL(aEntityID, aDefinitionID)
		ctlNewWindowOpener.NewWindowURL = aHref
		ctlNewWindowOpener.Open()
	End Sub
'========================================================================

End Class
End Namespace