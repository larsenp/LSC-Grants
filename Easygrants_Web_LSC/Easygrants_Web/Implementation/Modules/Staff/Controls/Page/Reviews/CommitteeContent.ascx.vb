Imports Core.DataAccess
Imports Core.Web
Imports Core_Web.Controls.Base

Namespace Implementation.Modules.Staff.Controls.Page.Reviews
Public Class cCommitteeContent
	Inherits Core_Web.Controls.Base.cDataPresenterCtl
	
    Public Overrides Sub CoreCtl_Load(ByVal aSrc As Object, ByVal aEvent As System.EventArgs)
        MyBase.CoreCtl_Load(aSrc, aEvent)
		
		If Not IsPostBack Then
			Dim aWfTAListActive As cDataObjectList
			Dim aReviewCommitteeDOList As cDataObjectList
			Dim aReviewCommitteeDO As cDataObject
			Dim ctlList As cDataListCtl
			Dim aDeleteButtonHash As Hashtable
			Dim aDeleteButton As cCSSButton
			Dim aReviewCommitteeID As Integer
	        
			'Hide the delete button for review comittees with active review assignments
			aReviewCommitteeDOList = CType(DataObjectCollection("ReviewCommitteeList"), cDataObjectList)
			ctlList = FindControl("ctlDataList")
			aDeleteButtonHash = ctlList.DataListCtl_GetControlCollection("btnDelete")
			For Each aReviewCommitteeDO In aReviewCommitteeDOList
				aReviewCommitteeID = aReviewCommitteeDO.GetPropertyInt("ReviewCommitteeID")
				aDeleteButton = CType(aDeleteButtonHash(aReviewCommitteeID), cCSSButton)
				If Not aDeleteButton Is Nothing
					aWfTAListActive = aReviewCommitteeDO.GetRelatedPropertyDataObjectList("WfTaskAssignmentsActive")
					If aWfTAListActive.Count > 0 Then
						aDeleteButton.Visible = False
					End If
				End If
			Next
		End If
	End Sub

End Class
End Namespace
