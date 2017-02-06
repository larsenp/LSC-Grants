Imports System.Diagnostics
Imports System.Xml
Imports Core.DataAccess
Imports Core.Web.Modules
Imports Easygrants.DataAccess.Budget
Imports EasyGrants.Web.User
Imports Core_Web.Controls.Base
Imports EasyGrants.Workflow
Imports Core.Web

Namespace Easygrants_Web.Controls.PageSection
Public Class cReviewCycleStageCmtEditor
	Inherits Core_Web.Controls.Base.cDataPresenterCtl
	
'============================================================= 

	Protected ctlTask As cDropDown
    
'=============================================================

	Public Overrides Sub CoreCtl_Load(ByVal aSrc As Object, ByVal aEvent As EventArgs)
		MyBase.CoreCtl_Load(aSrc, aEvent)
		
		'ctlTask = CType(Me.FindControl("ctlTask"), cDropDown)
		'ctlTask.Set_ServerIndexChange(AddressOf CreateCommittees)
	End Sub

'-------------------------------------------------------------

	Private Sub CreateCommittees(ByVal sender As System.Object, ByVal e As System.EventArgs)
		if me.Request.QueryString("ReviewCycleStageID") = "0" and ctlTask.SelectedValue <> "" then
			dim aObj as cDataObject
			dim aCmt as cDataObject
			dim aList as cDataObjectList = me.WebSession.DataObjectFactory.GetDataObjectListWithFilter("ReviewCycleStage", _
				"ReviewCycleID", me.Request.QueryString("ReviewCycleID"), "WfTaskID", ctlTask.SelectedValue)
			
			if aList.Count = 0 then
				dim aStage as cDataObject = ctype(me.DataObjectCollection("ReviewCycleStage"), cDataObjectList)(0)
				aStage("ReviewCycleID") = me.Request.QueryString("ReviewCycleID")
				aStage("WfTaskID") = ctlTask.SelectedValue
				me.WebSession.DataObjectFactory.SaveDataObject(aStage)
				aList = me.WebSession.DataObjectFactory.GetDataObjectListWithFilter("ReviewCycleCommittee", _
					"ReviewCycleID", me.Request.QueryString("ReviewCycleID"))
					
				for each aObj in aList
					aCmt = me.WebSession.DataObjectFactory.CreateNewDataObjectFromKey("ReviewCycleStageCommittee")
					aCmt("ReviewCycleStageID") = aStage.GetPropertyInt("ReviewCycleStageID")
					aCmt("ReviewCommitteeID") = aObj.GetPropertyInt("ReviewCommitteeID")
					me.WebSession.DataObjectFactory.SaveDataObject(aCmt)
				Next	
				
				me.Response.Redirect(cWebLib.AddQuerystringParameter(me.Request.RawUrl(), "ReviewCycleStageID", aStage.GetPropertyString("ReviewCycleStageID").Trim()))
			end if		
		end if
	End Sub

'-------------------------------------------------------------

	Public Overrides Sub CoreCtl_SetValues()
		MyBase.CoreCtl_SetValues()
		
	End Sub

'=============================================================
End Class 'cBudgetPeriod_Editor
End Namespace
