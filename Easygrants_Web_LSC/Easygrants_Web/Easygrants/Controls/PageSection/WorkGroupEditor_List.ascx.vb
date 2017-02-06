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
Public Class cWorkGroupEditor_List
	Inherits Core_Web.Controls.Base.cDataPresenterCtl
	
'============================================================= 

Protected ctlIsPrimary As cCheckBox


    Public Sub Cancel()
		dim aObjList as cDataObjectList = ctype(me.DataObjectCollection("WorkGroup"), cDataObjectList)
		
		if aObjList(0).GetPropertyString("WorkGroupDescription") = "" then
			me.WebSession.DataObjectFactory.DeleteData(aObjList(0))
		end if
		
		me.EventController_NavigateToModulePageKey("WorkGroups")
    End Sub  

'============================================================= 

	Public Overrides Sub DataPresenter_SaveDataObjects()
        Dim aPrimList As cDataObjectList
		Dim aWorkGrpList As cDataObjectList
		
        ctlIsPrimary = CType(Me.FindControl("ctlIsPrimary"), cCheckBox)
        aWorkGrpList = ctype(me.DataObjectCollection("WorkGroup"), cDataObjectList)
        
        If ctlIsPrimary.Value = True Then
			aPrimList = WebSession.DataObjectFactory.GetDataObjectListWithFilter("WorkGroup", _
						"IsPrimary", "True")

			If Not aPrimList Is Nothing Then
				If aPrimList.Count > 0 Then 
					If aWorkGrpList(0).GetPropertyInt("WorkGroupID", 0) <> aPrimList(0).GetPropertyInt("WorkGroupID", 0) Then
						aPrimList(0)("IsPrimary") = False
						WebSession.DataObjectFactory.SaveDataObject(aPrimList(0))
					End If
				End If
			End If			
	
		End If        
        
		MyBase.DataPresenter_SaveDataObjects()
        
	End Sub
	
	Public Sub ValidateDefaultWGRequired(ByVal aSrc As Object, ByVal aArgs As ServerValidateEventArgs)
		ctlIsPrimary = CType(Me.FindControl("ctlIsPrimary"), cCheckBox)
		Dim aWorkgroupID As String = ""
		If Not Request.QueryString("WorkGroupID") Is Nothing Then
			aWorkgroupID = Request.QueryString("WorkGroupID")
		End If
		Dim aDefaultWGDOL As cDataObjectList = WebSession.DataObjectFactory.GetDataObjectListWithFilter("WorkGroup", "IsPrimary", "True")
		If aDefaultWGDOL.Count < 1 And ctlIsPrimary.Value = False Then
			aArgs.IsValid = False
			Exit Sub
		Else If aDefaultWGDOL.Count > 0 And ctlIsPrimary.Value = False Then
			If aDefaultWGDOL(0).GetPropertyString("WorkGroupID") = aWorkgroupID Then
				aArgs.IsValid = False
				Exit Sub
			End If
		End If
		
		aArgs.IsValid = True
	End Sub
   
'=============================================================
End Class 'cBudgetPeriod_Editor
End Namespace
