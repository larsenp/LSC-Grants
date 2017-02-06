Imports Core.DataAccess
Imports EasyGrants.Workflow
Imports Core_Web.Controls.Base

Namespace Implementation.Modules.Staff.Controls.PageSection
Public Class cAddAssignmentByApplicant
    Inherits Core_Web.Controls.Base.cDataPresenterCtl

	Public Overrides Sub CoreCtl_Load(ByVal aSrc As Object, ByVal aEvent As EventArgs)
		MyBase.CoreCtl_Load(aSrc, aEvent)

		'If Not IsPostBack Then
			Dim ctlReviewer As cDropDown
			ctlReviewer = CType(FindControl("ctlReviewer"), cDropDown)
			Dim aLI As ListItem
			Dim aDO As cDataObject
			Dim aExistList As cDataObjectList
			aExistList = WebSession.DataObjectFactory.GetDataObjectListWithFilter("WfTaskAssignment", "ReviewCycleStageID", Request.QueryString("ReviewCycleStageID"), "GranteeProjectID", Request.QueryString("GranteeProjectID"))
			For Each aDO In aExistList
				aLI = ctlReviewer.Items.FindByValue(aDO.GetPropertyString("PersonID",""))
				If Not aLI Is Nothing Then
					ctlReviewer.Items.Remove(aLI)
				End If
			Next
		'End If
	End Sub

    Public Sub ValidatePrimary(ByVal aSrc As Object, ByVal aArgs As ServerValidateEventArgs)
		Dim ctlType As cDropDown
		Dim aDOList As cDataObjectList
		Dim aDO As cDataObject
		Dim aReviewCycleStageID As String
		Dim aApplicantID As String
		Dim GPID As String

		'when we Validate the Primary , we need to for the Current GrantID so added a new filter with GranteeProjectID
		aReviewCycleStageID = Request.QueryString("ReviewCycleStageID")		
		aApplicantID = Request.QueryString("ApplicantID")
		GPID = Request.QueryString("GranteeProjectID")
		ctlType = CType(FindControl("ctlType"), cDropDown)
		If ctlType.SelectedValue = "1" Then
			aDOList = WebSession.DataObjectFactory.GetDataObjectListWithFilter("WfTaskAssignment", "GranteeProjectID", GPID, "ReviewCycleStageID", aReviewCycleStageID, "ReviewAssignmentTypeID", "1")
			For Each aDO In aDOList
				If aDO.GetRelatedPropertyString("GranteeProject.PrimaryPersonID") = aApplicantID Then
					aArgs.IsValid = False
					Return
				End If				
			Next			
		End If		
		aArgs.IsValid = True
	End Sub

	Public Overrides Sub DataPresenter_SaveDataObjects()
		MyBase.DataPresenter_SaveDataObjects()

		Dim aWftaDO As cDataObject
        aWftaDO = CType(DataObjectCollection("WfTaskAssignment"), cDataObjectList)(0)
        If Not aWftaDO Is Nothing Then
			Dim aReviewCommitteeID As Integer = 0
			Dim aCommitteePool As cDataObjectList
			aCommitteePool = WebSession.DataObjectFactory.GetDataObjectListWithFilter("vCommitteePool", _
				"PersonID", aWftaDO.GetPropertyString("PersonID"), "ReviewCycleID", Request.QueryString("ReviewCycleID"))
			If aCommitteePool.Count > 0 Then
				aWftaDO("ReviewCommitteeID") = aCommitteePool(0).GetPropertyInt("ReviewCommitteeID", 0)
			End If

			Dim aRCCList As cDataObjectList
			aRCCList = WebSession.DataObjectFactory.GetDataObjectListWithFilter("ReviewCycleConflict", "ReviewCycleID", Request.QueryString("ReviewCycleID"), "RevPersonID", aWftaDO.GetPropertyString("PersonID"), "AppPersonID", aWftaDO.GetRelatedPropertyString("GranteeProject.PrimaryPersonID"))
			If aRCCList.Count >= 1 Then
				aWftaDO("ReviewPreferenceTypeID") = aRCCList(0).GetPropertyInt("RequestConflictID", 0)
			End If

			aWftaDO.SaveData()
			
			'Creates GRANTEE_PROJECT_REVIEW_STAGE record if necessary
			Dim aDO As cDataObject
			Dim aGP As cGranteeProject
			aGP = WebSession.DataObjectFactory.GetDataObjectFromPrimaryKey("GranteeProject", aWftaDO.GetPropertyString("GranteeProjectID"))
			aDO = aGP.GetGranteeProjectReviewStageDO(Request.QueryString("ReviewCycleStageID"), _
				Request.QueryString("ReviewCycleID"), aWftaDO.GetPropertyInt("PersonID"))
			
		End If
	End Sub

End Class
End Namespace