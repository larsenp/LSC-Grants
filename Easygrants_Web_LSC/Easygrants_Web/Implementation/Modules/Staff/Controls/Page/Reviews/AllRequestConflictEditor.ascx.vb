Imports Core.DataAccess
Imports Core_Web.Controls.Base
Imports System.Text

Namespace Implementation.Modules.Staff.Controls.Page.Reviews
Public MustInherit Class cAllRequestConflictEditor
	Inherits Core_Web.Controls.Base.cEntityDataPresenterCtl
	
	protected ctlList as cDataListCtl
    protected valOptionConflict as CustomValidator


	Public Overrides Sub DataPresenter_SaveDataObjects()
		Dim aWftaDOList As cDataObjectList
		Dim aWftaDO As cDataObject
		Dim aWftaID As Integer
		Dim aOptionsHash As Hashtable
		Dim aOptionsList As cRadioButtonList
		Dim aConflictHash As Hashtable
		Dim aConflictDD As cDropDown
		Dim aRCCList As cDataObjectList
		Dim aIsModified As Boolean = False
		Dim aObj As cDataObject

        aWftaDOList = CType(DataObjectCollection("WfTaskAssignmentList"), cDataObjectList)
		
		ctlList = FindControl("ctlList")
		aOptionsHash =  ctlList.DataListCtl_GetControlCollection("ctlOptions")
		aConflictHash =  ctlList.DataListCtl_GetControlCollection("ctlConflictType")

		If aWftaDOList.Count > 0 Then
			For Each aWftaDO In aWftaDOList
				aWftaID = aWftaDO.GetPropertyInt("WfTaskAssignmentID")
				aOptionsList = CType(aOptionsHash(aWftaID), cRadioButtonList)
				aConflictDD = CType(aConflictHash(aWftaID), cDropDown)
				If Not aOptionsList Is Nothing Or Not aConflictDD Is Nothing Then
					aWftaDO("ReviewPreferenceTypeID") = aOptionsList.SelectedValue
					Dim aReviewConflictTypeID As Object
					If aConflictDD.SelectedField <> "" Then
						aReviewConflictTypeID = aConflictDD.SelectedValue
					Else
						aReviewConflictTypeID = System.DBNull.Value
					End If
					aWftaDO("ReviewConflictTypeID") = aReviewConflictTypeID
					If aWftaDO.Modified Then
						aIsModified = True
						aWftaDO.SaveData()
					End If
					'Update REVIEW_CYCLE_CONFLICT record
					If aIsModified Then
						aRCCList = WebSession.DataObjectFactory.GetDataObjectListWithFilter("ReviewCycleConflict", "ReviewCycleID", Request.QueryString("ReviewCycleID"), "RevPersonID", aWftaDO.GetPropertyString("PersonID"), "AppPersonID", aWftaDO.GetRelatedPropertyString("GranteeProject.PrimaryPersonID"))
						If aRCCList.Count >= 1 Then
							aRCCList(0)("ConflictTypeID") = aReviewConflictTypeID
							aRCCList(0)("RequestConflictID") = aWftaDO.GetPropertyInt("ReviewPreferenceTypeID")
							aRCCList(0)("ReviewSourceID") = 2 'internal manual
							aRCCList(0).SaveData()
						Else
							aObj = WebSession.DataObjectFactory.CreateNewDataObjectFromKey("ReviewCycleConflict")
							aObj("ReviewCycleID") = Request.QueryString("ReviewCycleID")
							aObj("RevPersonID") = aWftaDO.GetPropertyString("PersonID")
							aObj("AppPersonID") = aWftaDO.GetRelatedPropertyInt("GranteeProject.PrimaryPersonID")
							aObj("ConflictTypeID") = aReviewConflictTypeID
							aObj("RequestConflictID") = aWftaDO.GetPropertyInt("ReviewPreferenceTypeID")
							aObj("ReviewSourceID") = 2 'internal manual
							aObj("RevWFTAID") = aWftaID
							aObj("ReviewCommitteeID") = CType(DataObjectCollection("ReviewCycle"), cDataObjectList)(0).GetRelatedPropertyInt("ReviewCycleCommittee.ReviewCommitteeID")
							aObj.SaveData()
						End If
					End If
				End If
			Next
		End If
	End Sub

    Public Sub ValidateOptionConflict(ByVal aSrc As Object, ByVal aArgs As ServerValidateEventArgs)
		dim aIsValid as Boolean = True
        Dim aOptionsHash As Hashtable
		Dim aOptionsList As cRadioButtonList
		Dim aConflictHash As Hashtable
		Dim aConflictDD As cDropDown
        Dim aWftaDOList As cDataObjectList
		Dim aWftaDO As cDataObject
		Dim aWftaID As Integer
        Dim aApplicantPool As StringBuilder = New StringBuilder()

        ctlList = FindControl("ctlList")
        aWftaDOList = CType(DataObjectCollection("WfTaskAssignmentList"), cDataObjectList)
        If aWftaDOList.Count > 0 Then
			For Each aWftaDO In aWftaDOList
				aWftaID = aWftaDO.GetPropertyInt("WfTaskAssignmentID")
                aOptionsHash =  ctlList.DataListCtl_GetControlCollection("ctlOptions")
		        aConflictHash =  ctlList.DataListCtl_GetControlCollection("ctlConflictType")
				aOptionsList = CType(aOptionsHash(aWftaID), cRadioButtonList)
				aConflictDD = CType(aConflictHash(aWftaID), cDropDown)
				If Not aOptionsList Is Nothing Or Not aConflictDD Is Nothing Then
					Dim aReviewConflictTypeID As Object
					If aOptionsList.SelectedValue = "4" AndAlso aConflictDD.SelectedValue = "" Then
                        aApplicantPool.Append("You indicated a conflict for ")
						aApplicantPool.Append(aWftaDO.GetRelatedPropertyString("GranteeProject.PrimaryPerson.LastNameFirstNameMiddleName"))
						aApplicantPool.Append(".  Conflict Type is required.")
						aApplicantPool.Append("<br>")
						valOptionConflict.ErrorMessage = aApplicantPool.ToString()
                        aIsValid = False
					Elseif aOptionsList.SelectedValue <> "4" AndAlso aConflictDD.SelectedValue  <> "" Then
                        aApplicantPool.Append("You did not indicate a conflict for ")
						aApplicantPool.Append(aWftaDO.GetRelatedPropertyString("GranteeProject.PrimaryPerson.LastNameFirstNameMiddleName"))
						aApplicantPool.Append(" but entered a Conflict Type. Remove the Conflict Type.")
						aApplicantPool.Append("<br>")
						valOptionConflict.ErrorMessage = aApplicantPool.ToString()
                        aIsValid = False
					End If
                End If
            Next
        End If
        if aIsValid = False then
			aArgs.IsValid = False
			exit Sub
		end if
   End Sub 


End Class
End Namespace