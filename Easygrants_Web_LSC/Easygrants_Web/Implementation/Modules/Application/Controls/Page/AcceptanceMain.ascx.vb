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

Namespace Implementation.Modules.Application.Controls.Page
Public MustInherit Class cAcceptanceMain
	Inherits Core_Web.Controls.Base.cDataPresenterCtl
	
'========================================================================

	protected spnSave as HtmlGenericControl
	protected tblSubmit as HtmlTable
	
	Protected ctlNewWindowOpener As cNewWindowOpener
	Protected valNonAcceptedReason as CustomValidator
	Protected ctlIsAccepted As cRadioButtonList 

'========================================================================

   Public Overrides Sub CoreCtl_Load(ByVal sender As System.Object, ByVal e As System.EventArgs)
        MyBase.CoreCtl_Load(sender, e)
        
		if ctype(me.DataObjectCollection("WfTaskAssignment"), cDataObjectList)(0).GetPropertyInt("WfTaskStatusID", 0) <> 1 then
			tblSubmit.Visible = False
		end if
   End Sub
   
'-----------------------------------------------------
  
    Public Sub ValidateNonAcceptedReason(ByVal aSrc As Object, ByVal aArgs As ServerValidateEventArgs)
		Dim iSelVal as Boolean
		Dim ctlNonAcceptedReason As cTextArea
		
		ctlIsAccepted = CType(Me.FindControl("ctlIsAccepted"), cRadioButtonList)
		
		if ctlIsAccepted.SelectedValue <> "" then
			iSelVal = CType(ctlIsAccepted.SelectedValue, Boolean)
			If iSelVal = False Then
				ctlNonAcceptedReason = CType(Me.FindControl("ctlNonAcceptedReason"), cTextArea)
				If ctlNonAcceptedReason.Value.Trim() = "" Then
					aArgs.IsValid = False
				End If
			End If
		end if
   End Sub 

'=============================================================

	Public Sub Submit(ByVal aModuleName As String, ByVal aModuleConfig As String, ByVal aPageKey As String)

		Dim aUser As cEGUser
		aUser = CType(CType(Page, cModulePage).ModuleUser, cEGUser)
		Dim aGranteeProjectDO As cGranteeProject
		
		
		valNonAcceptedReason.Enabled = True
		
		if MyBase.EventController_Save() = False then exit Sub
		
		MyBase.DataPresenter_SaveDataObjects()
		
		ctlIsAccepted = CType(Me.FindControl("ctlIsAccepted"), cRadioButtonList)
		
		Dim aSelVal as Boolean = CType(ctlIsAccepted.SelectedValue, Boolean)
		
		If aSelVal = False Then
			try
				dim aObj as cDataObject = ctype(me.DataObjectCollection("GranteeProjectAHA"), cDataObjectList)(0)
				aObj.RaiseEvent(30, aUser.UserID) 'Acceptance (Declined) template
			catch
			end try
				
			'Update Applicant WfTA
			Dim aXmlDoc As cXMLDoc
			Dim aDataObjectNode As XmlNode
			Dim aFiltersNode As XmlNode
			Dim aWfTA As cDataObject
			
			aXmlDoc = WebSession.DataObjectFactory.CreateDataObjectNode("WfTaskAssignment", aDataObjectNode, aFiltersNode)
			aFiltersNode.AppendChild(WebSession.DataObjectFactory.CreateArgumentNode(aXmlDoc, "Data", "WfTaskID", aUser.WfTaskID.ToString()))
			aFiltersNode.AppendChild(WebSession.DataObjectFactory.CreateArgumentNode(aXmlDoc, "Data", "WfTaskRoleID", "1"))
			aFiltersNode.AppendChild(WebSession.DataObjectFactory.CreateArgumentNode(aXmlDoc, "Data", "GranteeProjectID", aUser.GranteeProjectID.ToString()))
			aWfTA = WebSession.DataObjectFactory.GetDataObject(aDataObjectNode)
			If Not aWfTA Is Nothing Then
				aWfTA("WfTaskStatusID") = 2 'set Status to Complete
				If aUser.WfTaskID = 23 Then 'Research Acceptance task
					aWfTA("WfTaskOutcomeID") = 31 'Research outcome submitted
				Else
					aWfTA("WfTaskOutcomeID") = 45 'Council outcome to Submitted
				End If
				WebSession.DataObjectFactory.SaveDataObject(aWfTA)
			End If
			
			'Create Acceptance Review task record
			Dim aWfTaskAssgObject As cWfTaskAssignment
			aXmlDoc = WebSession.DataObjectFactory.CreateDataObjectNode("WfTaskAssignment", aDataObjectNode, aFiltersNode)
			aWfTaskAssgObject = WebSession.DataObjectFactory.GetNewDataObject(aDataObjectNode)
			
			if not aWfTA is nothing then
				if aUser.WfTaskID = 23
					aWfTaskAssgObject("WfTaskID") = 48  'Research Acceptance Review task
				else
					aWfTaskAssgObject("WfTaskID") = 49  'Council Acceptance Review task
				end if
			end if
			aWfTaskAssgObject("WfTaskStatusID") = 1
			aWfTaskAssgObject("WfTaskRoleID") = 7 'Internal Reviewer
			'aWfTaskAssgObject("PersonID") = aUser.PersonID
			aWfTaskAssgObject("GranteeProjectID") = aUser.GranteeProjectID
			WebSession.DataObjectFactory.SaveDataObject(aWfTaskAssgObject)

			CType(WebSession, cEGSession).RedirectToModule(aModuleName, aModuleConfig, aPageKey)
		Else

			'Submit task
			Dim aSubmitPage as cSubmissionModulePage
			aSubmitPage = CType(Page, cSubmissionModulePage)
			aSubmitPage.PostSubmitModuleConfig = Request.QueryString("Config")
			aSubmitPage.PostSubmitModuleName = "Application"
			aSubmitPage.Submit(False)
		end if
	End Sub
	
'==============================================================

	
End Class
End Namespace