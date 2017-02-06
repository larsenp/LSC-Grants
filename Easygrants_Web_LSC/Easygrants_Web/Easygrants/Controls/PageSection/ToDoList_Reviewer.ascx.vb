Imports System.Xml
Imports Core.DataAccess
Imports Core.DataAccess.XMLAccess
Imports EasyGrants.Workflow


Namespace Easygrants_Web.Controls.PageSection
Public MustInherit Class cToDoList_Reviewer
	Inherits Core_Web.Controls.Base.cDataPresenterCtl
'=============================================================

	Public Overrides Sub CoreCtl_Load(ByVal aSrc As Object, ByVal aEvent As EventArgs)
		MyBase.CoreCtl_Load(aSrc, aEvent)
	End Sub

'========================================================================

	Protected Overrides Function DataPresenter_Get_DataObjectList(ByRef aDataObjectElement As XmlElement) As cDataObjectList
		If cXMLDoc.AttributeToString(aDataObjectElement, "Key") = "List3" Then
			Dim aProjectTasks As ArrayList = New ArrayList()
			Dim aReviewCommittees As ArrayList = New ArrayList()
			Dim aWfTAs As ArrayList = New ArrayList()
			Dim aWfTaskAssignmentList As cDataObjectList
			Dim aWfTaskAssignment As cWfTaskAssignment
			Dim aProjectTaskID As Integer
			Dim aWfTaskAssignmentID As Integer
			Dim aItem As Integer
			Dim aNewWfTAList As cDataObjectList
			Dim aProjectTaskList As cDataObjectList
			Dim aProjectTask As cDataObject
			Dim aReviewCycleStageID As Integer
			Dim aProjRevID As Integer
			Dim aSortOrderID As Integer
			Dim aProjRevs As ArrayList = New ArrayList()

			aWfTaskAssignmentList = CType(DataObjectCollection("WfTA"), cDataObjectList)
			If Not aWfTaskAssignmentList Is Nothing Then
				For Each aWfTaskAssignment In aWfTaskAssignmentList
					'Add unique ProjectTask IDs to array list. Ensure uniqueness of the items
					'Add correspnding WfTaskAssignment IDs to the second array list. Also unique and will be used to create the list
					aProjectTaskID = aWfTaskAssignment.GetRelatedPropertyInt("WfProjectTask.WfProjectTaskID")
					aReviewCycleStageID = aWfTaskAssignment.GetPropertyInt("ReviewCycleStageID", 0)
					'aSortOrderID = aWfTaskAssignment.GetRelatedPropertyInt("WfProjectTask.SortOrder")
					'aProjRevID = aProjectTaskID + aReviewCommitteeID

						If Not aProjRevs.Contains(aReviewCycleStageID) Then
							aProjRevs.Add(aReviewCycleStageID)
							aWfTAs.Add(aWfTaskAssignment.GetPropertyInt("WfTaskAssignmentID"))
						Else
							If aWfTaskAssignment.GetPropertyInt("WfTaskStatusID", 0) = 1 Then
								Dim aProjPosition As Integer = aProjRevs.IndexOf(aReviewCycleStageID)
								aWfTAs.RemoveAt(aProjPosition)
								aWfTAs.Insert(aProjPosition, aWfTaskAssignment.GetPropertyInt("WfTaskAssignmentID"))
							End If
						End If
				Next
			End If

			'Set up data object list of WfTaskAssignments
			aNewWfTAList = New cDataObjectList(WebSession.DataObjectFactory)

			'For each WfTaskAssignmentID, add a data object to the list
			For Each aItem In aWfTAs
				aWfTaskAssignment = WebSession.DataObjectFactory.GetDataObjectFromPrimaryKey("WfTaskAssignment", aItem.ToString)
					aNewWfTAList.Add(aWfTaskAssignment)
					aNewWfTAList.DataObjectNode = aWfTaskAssignment.DataObjectList.DataObjectNode
				''if a Chair Review task and Chair NOT a Reviewer, then remove from list
				'If aWfTaskAssignment.GetPropertyInt("WfTaskID") = "22" And aWfTaskAssignment.GetRelatedPropertyInt("RCMember.ReviewerRoleID") <> 2 Then	'2:  Chair Reviewer
				'	aNewWfTAList.Remove(aWfTaskAssignment)
				'End If
			Next

			Return aNewWfTAList
		Else
			Return MyBase.DataPresenter_Get_DataObjectList(aDataObjectElement)
		End If
	End Function

'========================================================================

End Class
End Namespace