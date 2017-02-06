Imports Core.DataAccess
Imports Core_Web.Controls.Base

Namespace Implementation.Modules.Staff.Controls.Page.Reviews
Public Class cReviewCycleContent
	Inherits Core_Web.Controls.Base.cDataPresenterCtl
	
	Public Overrides Sub CoreCtl_Load(ByVal aSrc As Object, ByVal aEvent As System.EventArgs)
		MyBase.CoreCtl_Load(aSrc, aEvent)

		If Not IsPostBack Then
			Dim aWfTAListActive As cDataObjectList
			Dim aReviewCycleDOList As cDataObjectList
			Dim aReviewCycleDO As cDataObject
			Dim ctlList As cDataListCtl
			Dim aDeleteButtonHash As Hashtable
			Dim aDeleteButton As cCSSButton
			Dim aReviewCycleID As Integer

			'Hide the delete button for review cycles with active review assignments
			aReviewCycleDOList = CType(DataObjectCollection("ReviewCycleList"), cDataObjectList)
			ctlList = FindControl("ctlDataList")
			aDeleteButtonHash = ctlList.DataListCtl_GetControlCollection("btnDelete")
			For Each aReviewCycleDO In aReviewCycleDOList
				aReviewCycleID = aReviewCycleDO.GetPropertyInt("ReviewCycleID")
				aDeleteButton = CType(aDeleteButtonHash(aReviewCycleID), cCSSButton)
				If Not aDeleteButton Is Nothing AndAlso aReviewCycleDO.GetRelatedPropertyBool("ReviewCycleHasActiveWfta.HasActiveTasks", False) Then
					aDeleteButton.Visible = False
				End If
			Next
		End If
	End Sub

	Public Sub ReviewCycleCopy(ByVal aReviewCycleID As String)
		dim aObj as cDataObject
		dim aTask as cDataObject
   		dim aOutcome as cDataObject
   		dim aNewObj as cDataObject
   		dim aTaskID as String
   		dim aProjectID as String
   		
   		dim aList as cDataObjectList = me.WebSession.DataObjectFactory.GetDataObjectListWithFilter("ReviewCycle", "ReviewCycleID", aReviewCycleID)
		dim aReviewCycle as cDataObject = me.WebSession.DataObjectFactory.CloneDataObject(aList(0))
		aReviewCycle("Name") = "Copy of " + aList(0).GetPropertyString("Name")
		aReviewCycle.SaveData()
		dim aTaskList as cDataObjectList = me.WebSession.DataObjectFactory.GetDataObjectListWithFilter("ReviewCycleProjectTask", _
   			"ReviewCycleID", aReviewCycleID)
   		
   		for each aObj in aTaskList
			aTask = me.WebSession.DataObjectFactory.CloneDataObject(aObj)
			aTask("ReviewCycleID") = aReviewCycle.GetPropertyString("ReviewCycleID")
			aTask.SaveData()
			aList = me.WebSession.DataObjectFactory.GetDataObjectListWithFilter("ReviewCycleProjectTaskOutcome", _
   				"ReviewCycleProjectTaskID", aObj.GetPropertyString("ReviewCycleProjectTaskID"))
   	
   			for each aOutcome in aList
				aNewObj = me.WebSession.DataObjectFactory.CloneDataObject(aOutcome)
				aNewObj("ReviewCycleProjectTaskID") = aTask.GetPropertyString("ReviewCycleProjectTaskID")
				aNewObj.SaveData()
			Next			
		Next			
		
		aList = me.WebSession.DataObjectFactory.GetDataObjectListWithFilter("ReviewCycleCommittee", _
   			"ReviewCycleID", aReviewCycleID)
   		
   		for each aObj in aList
			aNewObj = me.WebSession.DataObjectFactory.CloneDataObject(aObj)
			aNewObj("ReviewCycleID") = aReviewCycle.GetPropertyString("ReviewCycleID")
			aNewObj.SaveData()
		Next			
		
		me.CorePage.Redirect()
	End Sub  
       
End Class 'cReviewCycleContent
End Namespace
