Imports System.Diagnostics
Imports System.Xml
Imports Core.DataAccess
Imports Core.Web.Modules
Imports Easygrants.DataAccess.Budget
Imports EasyGrants.Web.User
Imports Core_Web.Controls.Base
Imports EasyGrants.Workflow
Imports Core.Web
Imports Core.DataAccess.XMLAccess
Imports EasyGrants.DataAccess
Imports EasyGrants.Web.Modules

Namespace Easygrants_Web.Controls.PageSection
Public Class cInternalReviewEditor
	Inherits Core_Web.Controls.Base.cEntityDataPresenterCtl
'============================================================= 

	Protected ctlOutcome as cDropDown
    Protected tbSubmit as HtmlTable
    
'=============================================================
    Public overrides Sub CoreCtl_Load(ByVal sender As System.Object, ByVal e As System.EventArgs)		
		MyBase.CoreCtl_Load(sender, e)
		
		ctlOutcome = CType(Me.FindControl("ctlOutcome"), cDropDown)
		
		
		dim aObjList as cDataObjectList = CType(DataObjectCollection("WfTaskAssignment"), cDataObjectList)
        
		if aObjList(0).GetPropertyInt("WfTaskStatusID", 0) <> 1 then
			tbSubmit.Visible = False
		end if
		
		aObjList = CType(DataObjectCollection("ReviewAdditionalInformation"), cDataObjectList)
        
	End Sub   
	 
	'-------------------------------------------------------------
			Public Overrides Sub CoreCtl_SetValues()
				MyBase.CoreCtl_SetValues()
				
				'if not a rejected or invite for full proposal Outcome, then hide submit section/button
				if ctlOutcome.SelectedValue <> "" then
					Select Case ctlOutcome.SelectedValue
						Case 107, 108, 110
							tbSubmit.Visible = False
					End Select
				end if
					
			End Sub
	'-------------------------------------------------------------	

    Public Sub Submit()
        dim aObjList as cDataObjectList = CType(DataObjectCollection("WfTaskAssignment"), cDataObjectList)
        dim aNewObj as cDataObject = me.WebSession.DataObjectFactory.CreateNewDataObjectFromKey("WfTaskAssignment")
		dim aOutcomeList as cDataObjectList = me.WebSession.DataObjectFactory.GetDataObjectListWithFilter("OutcomeConfiguration", _
			"OriginalTaskID", aObjList(0).GetPropertyString("WfTaskID"), "OriginalOutcomeID", "-1") ' "-1" for all outcomes.
			
		
        
        'if outcome = Ready for Proposal Invitation, then create Full Proposal task assignment and send out LOI Approval email, kda 7/8/06.
        if ctlOutcome.SelectedValue <> "" AndAlso ctlOutcome.SelectedValue = 112 then  'Invite to submit Full Proposal task
			if aOutcomeList.Count > 0 then
				aNewObj("WfTaskID") = aOutcomeList(0).GetPropertyString("GeneratedTaskID")
				aNewObj("WfTaskStatusID") = aOutcomeList(0).GetPropertyString("GeneratedTaskStatusID")
				aNewObj("GranteeProjectID") = aObjList(0).GetPropertyInt("GranteeProjectID", 0)
				aNewObj("WfTaskRoleID") = aOutcomeList(0).GetPropertyString("GeneratedTaskRoleID")
				aNewObj("PersonID") = aObjList(0).GetRelatedPropertyInt("GranteeProject.PrimaryPersonID")
				aNewObj("OpenDate") = system.DateTime.Now
				me.WebSession.DataObjectFactory.SaveDataObject(aNewObj)
			else
				aOutcomeList = me.WebSession.DataObjectFactory.GetDataObjectListWithFilter("OutcomeConfiguration", _
					"OriginalTaskID", aObjList(0).GetPropertyString("WfTaskID"), "OriginalOutcomeID", ctlOutcome.SelectedValue.ToString())
			
				if aOutcomeList.Count > 0 then
					aNewObj("WfTaskID") = aOutcomeList(0).GetPropertyString("GeneratedTaskID")
					aNewObj("WfTaskStatusID") = aOutcomeList(0).GetPropertyString("GeneratedTaskStatusID")
					aNewObj("GranteeProjectID") = aObjList(0).GetPropertyInt("GranteeProjectID")
					aNewObj("WfTaskRoleID") = aOutcomeList(0).GetPropertyString("GeneratedTaskRoleID")
					aNewObj("PersonID") = aObjList(0).GetRelatedPropertyInt("GranteeProject.PrimaryPersonID")
					aNewObj("OpenDate") = system.DateTime.Now
					me.WebSession.DataObjectFactory.SaveDataObject(aNewObj)
					
					if aOutcomeList(0).GetPropertyInt("EventID", 0) > 0 then
						try
							aNewObj.RaiseEvent(aOutcomeList(0).GetPropertyInt("EventID", 0), ctype(aNewObj.GetRelatedPropertyDataObject("Person"), cPerson).Get_EG_User())
						catch
						end try
					end if
					'CType(Page, cSubmissionModulePage).Submit(True)
				end if
			end if
	        
			if aOutcomeList(0).GetPropertyInt("EventID", 0) > 0 then
				try
					aNewObj.RaiseEvent(aOutcomeList(0).GetPropertyInt("EventID", 0), ctype(aNewObj.GetRelatedPropertyDataObject("Person"), cPerson).Get_EG_User())
				catch
				end try
			end if
        end if
        
        aObjList(0)("WfTaskStatusID") = 2
		aObjList(0)("WfTaskRoleID") = 16
		aObjList(0)("WfTaskOutcomeID") = ctlOutcome.SelectedValue
		aObjList(0)("CloseDate") = System.DateTime.Now
		aObjList(0)("SubmittedDate") = System.DateTime.Now
		me.WebSession.DataObjectFactory.SaveDataObject(aObjList(0))
		
        Response.Redirect(request.QueryString("ReturnURL"))
    End Sub

'=============================================================
End Class 'cInternalReviewEditor
End Namespace