Imports Core.DataAccess
Imports Core_Web.Controls.Base
Imports System.Text

Namespace Implementation.Modules.Staff.Controls.Page.Reviews
Public MustInherit Class cScoreEditor
	Inherits Core_Web.Controls.Base.cEntityDataPresenterCtl


    protected valOptionConflict as CustomValidator
	
	Public Overrides Sub DataPresenter_SaveDataObjects()
		Dim aTAOldDO As cDataObject
		Dim aWftaDO As cDataObject
		Dim aRCCList As cDataObjectList
		Dim aIsModified As Boolean = False
		Dim ctlRC As cRadioButtonList
		Dim ctlReviewConflictType As cDropDown
		Dim aObj As cDataObject

		aTAOldDO = WebSession.DataObjectFactory.GetDataObjectFromPrimaryKey("WfTaskAssignment", Request.QueryString("WfTaskAssignmentID"))
		
		MyBase.DataPresenter_SaveDataObjects()

        aWftaDO = CType(DataObjectCollection("WfTaskAssignment"), cDataObjectList)(0)
		ctlRC = CType(FindControl("ctlRC"), cRadioButtonList)
		ctlReviewConflictType = CType(FindControl("ctlReviewConflictType"), cDropDown)

	    if aWftaDO.GetPropertyInt("ReviewConflictTypeID", 0) <> 0 AndAlso ctlRC.SelectedValue <> "4" then
            aWftaDO("ReviewConflictTypeID") = System.DBNull.Value
            aWftaDO.SaveData()       
        End If

        'Update REVIEW_CYCLE_CONFLICT record
		If aTAOldDO.GetPropertyInt("ReviewPreferenceTypeID",0) <> aWftaDO.GetPropertyInt("ReviewPreferenceTypeID",0) Or _
			aTAOldDO.GetPropertyInt("ReviewConflictTypeID",0) <> aWftaDO.GetPropertyInt("ReviewConflictTypeID",0) Then
			aRCCList = WebSession.DataObjectFactory.GetDataObjectListWithFilter("ReviewCycleConflict", "ReviewCycleID", Request.QueryString("ReviewCycleID"), "RevPersonID", aWftaDO.GetPropertyString("PersonID"), "AppPersonID", aWftaDO.GetRelatedPropertyString("GranteeProject.PrimaryPersonID"))
			If aRCCList.Count >= 1 Then
				If aWftaDO.GetPropertyInt("ReviewConflictTypeID", 0) > 0 Then
					aRCCList(0)("ConflictTypeID") = aWftaDO.GetPropertyInt("ReviewConflictTypeID")
                Else
					aRCCList(0)("ConflictTypeID") = System.DBNull.Value
				End If	 			
				aRCCList(0)("RequestConflictID") = aWftaDO.GetPropertyInt("ReviewPreferenceTypeID")
				aRCCList(0)("ReviewSourceID") = 2 'internal manual
				aRCCList(0).SaveData()
			Else
				aObj = WebSession.DataObjectFactory.CreateNewDataObjectFromKey("ReviewCycleConflict")
				aObj("ReviewCycleID") = Request.QueryString("ReviewCycleID")
				aObj("RevPersonID") = aWftaDO.GetPropertyString("PersonID")
				aObj("AppPersonID") = aWftaDO.GetRelatedPropertyInt("GranteeProject.PrimaryPersonID")
				If aWftaDO.GetPropertyInt("ReviewConflictTypeID", 0) > 0 Then
					aObj("ConflictTypeID") = aWftaDO.GetPropertyInt("ReviewConflictTypeID")
				Else
					aObj("ConflictTypeID") = System.DBNull.Value
				End If				
				aObj("RequestConflictID") = aWftaDO.GetPropertyInt("ReviewPreferenceTypeID")
				aObj("ReviewSourceID") = 2 'internal manual
				aObj("RevWFTAID") = aWftaDO.GetPropertyInt("WfTaskAssignmentID")
				aObj("ReviewCommitteeID") = aWftaDO.GetPropertyInt("ReviewCommitteeID")
				aObj.SaveData()
			End If

            
		End If
	End Sub


	Public Function ValidateConflictType(ByVal aSrc As Object, ByVal aArgs As ServerValidateEventArgs)
		ValidateConflictType = True
		
        Dim ctlRC As cRadioButtonList
		Dim ctlReviewConflictType As cDropDown

        ctlRC = CType(FindControl("ctlRC"), cRadioButtonList)
		ctlReviewConflictType = CType(FindControl("ctlReviewConflictType"), cDropDown)

        If ctlRC.SelectedValue <> "4" AndAlso ctlReviewConflictType.SelectedValue <> "" Then
            valOptionConflict.ErrorMessage = "You did not indicate a conflict but entered a conflict type. Remove the Conflict Type."
            ValidateConflictType = False
		End If
	End Function

	Public Function ValidatePreferenceType(ByVal aSrc As Object, ByVal aArgs As ServerValidateEventArgs)
		ValidatePreferenceType = True
		
        Dim ctlRC As cRadioButtonList
		Dim ctlReviewConflictType As cDropDown

        ctlRC = CType(FindControl("ctlRC"), cRadioButtonList)
		ctlReviewConflictType = CType(FindControl("ctlReviewConflictType"), cDropDown)

		If ctlRC.SelectedValue = "4" AndAlso ctlReviewConflictType.SelectedValue = "" Then
            valOptionConflict.ErrorMessage = "You indicated a conflict. Conflict Type is required."
            ValidatePreferenceType = False
		End If
	End Function

End Class
End Namespace