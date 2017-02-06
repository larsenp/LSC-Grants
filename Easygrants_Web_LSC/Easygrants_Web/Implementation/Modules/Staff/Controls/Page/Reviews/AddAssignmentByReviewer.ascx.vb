Imports Core.DataAccess
Imports EasyGrants.Workflow
Imports Core_Web.Controls.Base

Namespace Implementation.Modules.Staff.Controls.Page.Reviews
Public MustInherit Class cAddAssignmentByReviewer
    Inherits Core_Web.Controls.Base.cDataPresenterCtl

	Public Overrides Sub CoreCtl_Load(ByVal aSrc As Object, ByVal aEvent As EventArgs)
		MyBase.CoreCtl_Load(aSrc, aEvent)

		'If Not IsPostBack Then
			Dim ctlApplicant As cDropDown
			ctlApplicant = CType(FindControl("ctlApplicant"), cDropDown)
			Dim aLI As ListItem
			Dim aDO As cDataObject
			Dim aExistList As cDataObjectList
			aExistList = WebSession.DataObjectFactory.GetDataObjectListWithFilter("WfTaskAssignment", "ReviewCycleStageID", Request.QueryString("ReviewCycleStageID"), "PersonID", Request.QueryString("ReviewerID"))
			For Each aDO In aExistList
				aLI = ctlApplicant.Items.FindByValue(aDO.GetPropertyString("GranteeProjectID",""))
				If Not aLI Is Nothing Then
					ctlApplicant.Items.Remove(aLI)
				End If
			Next
		'End If
	End Sub

	Public Overrides Sub DataPresenter_SaveDataObjects()
		MyBase.DataPresenter_SaveDataObjects()

		Dim aWftaDO As cDataObject
		Dim aRCCList As cDataObjectList

        aWftaDO = CType(DataObjectCollection("WfTaskAssignment"), cDataObjectList)(0)
        If Not aWftaDO Is Nothing Then
			aRCCList = WebSession.DataObjectFactory.GetDataObjectListWithFilter("ReviewCycleConflict", "ReviewCycleID", Request.QueryString("ReviewCycleID"), "RevPersonID", aWftaDO.GetPropertyString("PersonID"), "AppPersonID", aWftaDO.GetRelatedPropertyString("GranteeProject.PrimaryPersonID"))
			If aRCCList.Count >= 1 Then
				aWftaDO("ReviewPreferenceTypeID") = aRCCList(0).GetPropertyInt("RequestConflictID", 0)
				aWftaDO.SaveData()
			End If
			
			'Creates GRANTEE_PROJECT_REVIEW_STAGE record if necessary
			Dim aDO As cDataObject
			Dim aGP As cGranteeProject
			aGP = WebSession.DataObjectFactory.GetDataObjectFromPrimaryKey("GranteeProject", aWftaDO.GetPropertyString("GranteeProjectID"))
			aDO = aGP.GetGranteeProjectReviewStageDO(Request.QueryString("ReviewCycleStageID"), _
				Request.QueryString("ReviewCycleID"), Request.QueryString("ReviewerID"))
		End If
	End Sub

End Class
End Namespace